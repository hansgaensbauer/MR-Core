import numpy as np
import pypulseq as pp

from mrc.system_constants import *

def compile_sequence(sequence, progfile):
    
    contents = np.empty(shape=0,dtype = np.uint16)
    seq = pp.Sequence(system)
    if isinstance(sequence, str):
        seq.read(sequence, detect_rf_use=True)
    else: 
        seq = sequence

    def _write_statics(amplitudes, phases):
        nonlocal contents
        for phase in phases.astype(np.int16):
            contents = np.append(contents, phase)
        for i in range(4-len(phases)):
            contents = np.append(contents, np.int16(0))
        for amp in amplitudes:
            contents = np.append(contents, amp)
        for i in range(4-len(amplitudes)):
            contents = np.append(contents, np.int16(0))

    def _write_delay(time, cycles=False):
        nonlocal contents
        # print(time)
        delay_length = time if cycles else int(np.round(time*120e6))
        # print(delay_length)
        if delay_length == 0:
            pass
            # print("Zero length delay not possible")
        elif delay_length == 1:
            pass
        elif delay_length == 2:
            contents = np.append(contents, np.uint16(0b0100 << 12)) #Noop
        elif delay_length < 2**12+2:
            contents = np.append(contents, np.uint16((0b0100 << 12) + delay_length - 3))
            contents = np.append(contents, np.uint16((0b1000 << 12) + 0)) #Jump 0
        elif delay_length < 2**24:
            contents = np.append(contents, np.uint16((0b0101 << 12) + int((delay_length-1)/2**12)-1)) #outer loopset
            _write_delay(2**12, cycles=True)
            contents = np.append(contents, np.uint16((0b1001 << 12) + 2)) #outer jump

            remainder = delay_length - 2**12 * int((delay_length-1)/2**12) - 1
            _write_delay(remainder, cycles=True)
        elif delay_length < 2**36:
            contents = np.append(contents,
                                 np.uint16((0b0110 << 12) + int((delay_length - 1) / (2**24 - 1)) - 1))  # outer loopset
            _write_delay(2**24-1, cycles=True)
            contents = np.append(contents, np.uint16((0b1010 << 12) + 6))  # outer jump

            remainder = (delay_length-1) - (2**24-1) * int((delay_length-1)/(2**24-1))
            _write_delay(remainder, cycles=True)
        else:
            print("Delay too long!")

    def _mrc_grad(gr_amplitude):
        if gr_amplitude > 0: return 0b01
        elif gr_amplitude < 0: return 0b10
        else: return 0

    def _write_command(amp, phase, grx, gry, grz, amps, phases):
        nonlocal contents
        contents = np.append(contents, np.uint16((0b00 << 14) +
            (np.where(amps == amp)[0] << 12) +
            (np.where(phases == phase)[0] << 10) +
            (_mrc_grad(grx) << 8) +
            (_mrc_grad(gry) << 6) +
            (_mrc_grad(grz) << 4)))
        # print(np.where(phases == phase)[0])

    def _write_halt():
        nonlocal contents
        contents = np.append(contents, np.uint16((0b11 << 14)))

    #Do not pass the header to this function!
    def make_jumps_relative(instructions):
        nist = instructions
        for i in range(len(instructions)):
            if instructions[i] >> 14 == 0b10: #jump instruction
                target = instructions[i] & 0b111111111111
                timer = (instructions[i] >> 12) & 0b11
                nist[i] = ((0b10 << 14) + (timer << 12) + (i - target))
        return nist

    #Prepare an array of changes and timestamps
    updates = {}

    def add_event_to_updates(time, rfmag=None, rfphase=None, gx=None, gy=None, gz=None):
        if time in updates.keys() :
            if rfmag is not None : updates[time][0] = rfmag
            if rfphase is not None : updates[time][1] = rfphase
            if gx is not None : updates[time][2] = gx
            if gy is not None : updates[time][3] = gy
            if gz is not None : updates[time][4] = gz
        else:
            if rfmag is None : rfmag = 0
            if rfphase is None : rfphase = 0
            if gx is None : gx = 0
            if gy is None : gy = 0
            if gz is None : gz = 0
            updates[time] = [rfmag, rfphase, gx, gy, gz]

    numblocks = seq.duration()[1]
    time = 0
    for i in range(numblocks):
        bk = seq.get_block(i+1)
        if bk.rf is not None :
            add_event_to_updates(time, rfmag=np.abs(bk.rf.signal[0]), rfphase=bk.rf.phase_offset) #Start of Pulse
            add_event_to_updates(time + bk.rf.shape_dur, rfmag=0, rfphase=0) #End of Pulse
        if bk.gx is not None :
            add_event_to_updates(time, gx=bk.gx.amplitude) #Start of gradient
            add_event_to_updates(time + bk.gx.flat_time, gx=0) #End of gradient
        if bk.gy is not None :
            add_event_to_updates(time, gy=bk.gy.amplitude) #Start of gradient
            add_event_to_updates(time + bk.gy.flat_time, gy=0) #End of gradient
        if bk.gz is not None :
            add_event_to_updates(time, gz=bk.gz.amplitude) #Start of gradient
            add_event_to_updates(time + bk.gz.flat_time, gz=0) #End of gradient
        time = time + bk.block_duration
        if i+1 == numblocks : #last block is delay, so add one more update
            add_event_to_updates(time, rfmag=0, rfphase=0) #End of gradient

    all_amplitudes = np.array([updates[time][0] for time in updates])
    all_phases = np.array([updates[time][1] for time in updates])
    amplitudes = (np.unique(np.abs(all_amplitudes).astype(np.uint16))) #.astype(np.uint16)
    phases = np.unique(all_phases/np.pi*2**15).astype(np.int16)

    assert len(amplitudes) <= 4
    assert len(phases) <= 4

    # Write Sequence Length
    contents = np.append(contents, np.uint16(np.round(seq.duration()[0]*100e3/16)))
    _write_statics(amplitudes, phases)
    lasttime = 0

    for time in sorted(updates.keys()):
        _write_delay(time - lasttime)
        _write_command(int(np.abs(updates[time][0])), int(updates[time][1] / np.pi * 2 ** 15), updates[time][2], updates[time][3], updates[time][4],
                    amplitudes,
                    phases)
        lasttime = time
    _write_halt()

    program = contents[HEADLEN:]
    header = contents[0:HEADLEN]

    #detecting and stacking loops
    roll_loops = True
    if roll_loops:

        for i in range(len(program)):
            #calculate matches
            index = np.where(program[i:] == program[i])[0] + i #find matches and mask earlier matches
            if len(index) > 1:
                j = 0
                loopitrs = 0
                looplen = index[j+1] - index[j]
                while(j+1 < len(index) and
                        index[j+1]+looplen < len(program) and
                        np.array_equal(program[index[j]:index[j]+looplen], program[index[j+1]:index[j+1]+looplen])):
                    loopitrs += 1
                    j = j + 1
                if loopitrs >= 1:
                    for n in range(int((loopitrs-1)/4094)):
                        #roll the loop
                        newcontents = np.append(program[0:i], (0b0111 << 12) + 4094)
                        newcontents = np.append(newcontents, program[i:i+looplen])
                        newcontents = np.append(newcontents, (0b1011 << 12) + looplen)
                        newcontents = np.append(newcontents, program[i+(4094+1)*looplen:])
                        program = newcontents
                    newcontents = np.append(program[0:i], (0b0111 << 12) + (loopitrs-1)%4094 + 1)
                    newcontents = np.append(newcontents, program[i:i+looplen])
                    newcontents = np.append(newcontents, (0b1011 << 12) + looplen)
                    newcontents = np.append(newcontents, program[i+(loopitrs%4094+1)*looplen:])
                    program = newcontents
                    break

    # program = make_jumps_relative(program)
    if isinstance(progfile, str):
        with open(progfile, 'wb') as f:
            for item in header:
                f.write(np.uint16(item))
            for item in program:
                f.write(np.uint16(item))
            f.flush()
    else:
        for item in header:
            progfile.write(np.uint16(item))
        for item in program:
            progfile.write(np.uint16(item))
        progfile.flush()

def mrcdump(mrcfile):
    def _read_bin_file(filename):
        with open(filename, 'rb') as f:
            byte_array = bytearray(f.read())
        f.close()
        rsarr = np.reshape(byte_array, (-1,2))
        return np.array([int.from_bytes(rsarr[i], "little") for i in range(len(rsarr))])

    instructions = _read_bin_file(mrcfile)
    print("Duration: %d" % (int(instructions[0])*16))

    print("Statics:")
    for i in range(4):
        print("Phase %d: %d" % (i, int(instructions[i+HEADLEN-8])))
    print()
    for i in range(4):
        print("Amp %d: %d" % (i, int(instructions[i+HEADLEN-4])))

    print("\nInstructions:")
    for i in range(len(instructions) - HEADLEN):
        print("%d:\t" % i, end="")
        print("{:016b}\t".format(instructions[i+HEADLEN]), end="")
        if instructions[i+HEADLEN] >> 14 == 0b00 : #command instruction
            print("cmd \t", end = "")
            print("{:d} {:d} {:02b} {:02b} {:02b}".format(
                instructions[i+HEADLEN]>>12 & 0b11,
                instructions[i+HEADLEN]>>10 & 0b11,
                instructions[i+HEADLEN]>>8 & 0b11,
                instructions[i+HEADLEN]>>6 & 0b11,
                instructions[i+HEADLEN]>>4 & 0b11
                ))
        elif instructions[i+HEADLEN] >> 14 == 0b01 : #loopset instruction:
            print("lset\t", end = '')
            print("{:d} {:d}".format(
                instructions[i+HEADLEN]>>12 & 0b11,
                instructions[i+HEADLEN] & 0b111111111111,
                ))
        elif instructions[i+HEADLEN] >> 14 == 0b10 : #jump instruction:
            print("jmp \t", end = '')
            print("{:d} {:d}".format(
                instructions[i+HEADLEN]>>12 & 0b11,
                instructions[i+HEADLEN] & 0b111111111111,
                ))
        else:
            print("halt.")
