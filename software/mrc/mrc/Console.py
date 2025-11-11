import numpy as np
import serial
import serial.tools.list_ports
import time
import importlib.resources
import tempfile
from pypulseq.Sequence.sequence import Sequence

from mrc.mrc_compiler import *
from mrc.rx_processing import *
from mrc.sequences import *
from mrc.system_constants import *

class AutoDetectException(Exception):
    pass

class Console:
    com_port = ''
    
    TTYPE_STATUS = 1
    TTYPE_DATA = 2
    new_data_flag = False
    rx_data = np.empty(0, dtype=np.complex128)

    def __init__(self, port=None, frequency = 21.65e6):
        if port is None:
            #Autodetect com port
            ports = serial.tools.list_ports.comports(include_links=False)
            for port in ports:
                if port.pid == 22336:
                    self.com_port = port.device
                    print("Connected to " + port.device)
                    break
            if self.com_port == '':
                raise AutoDetectException("Port AutoDetect Failed. Is the MRC Connected Properly?")
        self.frequency = frequency
            
        self.ser = serial.Serial(self.com_port, timeout=10)

    def read_serial(self):
        header = self.ser.read(4)
        if header[0] == self.TTYPE_STATUS:
            numbytes = (header[1]<<16)+(header[2]<<8)+(header[3])
            try:
                message = self.ser.read(numbytes + 4)
                check = (message[numbytes] == 0x01 and
                        message[numbytes + 1] == 0x02 and
                        message[numbytes + 2] == 0x03 and
                        message[numbytes + 3] == 0x04)
                assert check
                
                # Append to terminal output
                # print("STATUS: " + message[0:numbytes].decode('ascii') + "\n")
                self.new_data_flag = True
            except serial.SerialTimeoutException:
                print("ERROR: Status Received Wrong Number of Bytes\n")
                self.ser.reset_input_buffer()
        elif header[0] == self.TTYPE_DATA:
            numbytes = ((header[1]<<16)+(header[2]<<8)+(header[3]))*4
            try:
                capture = self.ser.read(numbytes + 4)
            except serial.SerialTimeoutException:
                print("ERROR: Received Wrong Number of Bytes (should be %d)\n" % numbytes)
                self.ser.reset_input_buffer()
            try:
                assert len(capture) == numbytes+4
                check = (capture[numbytes] == 0x01 and
                    capture[numbytes + 1] == 0x02 and
                    capture[numbytes + 2] == 0x03 and
                    capture[numbytes + 3] == 0x04)
                assert check

                capture_np = np.frombuffer(capture[2:-2], dtype=np.int16)
                self.rx_data = capture_np[1::2] + 1j*capture_np[::2]
                print("Received Bytes: %d\n" % numbytes)
                self.new_data_flag = True
            except (AssertionError, IndexError):
                print("Data Check Failed. Received %d bytes" % len(capture))
        else:
            self.ser.reset_input_buffer()
    
    def load(self, sequence):
        print("Loading Sequence... ", end = "")

        if isinstance(sequence, str): #File path was passed
            with open(sequence, 'rb') as f:
                byte_array = bytearray(f.read())
                # byte_array = np.flip(np.reshape(byte_array, (-1,2)), axis=1)
                f.seek(0,2)
                file_size = int(f.tell())
        else:
            with tempfile.TemporaryFile() as temp_file:
                compile_sequence(sequence, temp_file)
                temp_file.seek(0)
                byte_array = bytearray(temp_file.read())
                temp_file.seek(0, 2)
                file_size = int(temp_file.tell())

        self.ser.write('load'.encode('utf-8') + file_size.to_bytes(2, 'big'))
        time.sleep(0.01)
        for i in range(int(file_size/64)):
            self.ser.write(byte_array[64*i:64*i+64])
            time.sleep(0.01)
        if file_size - int(file_size/64)*64 > 0:
            self.ser.write(byte_array[64*int(file_size/64):])
            # print(file_size - 64*int(file_size/64))
        self.read_serial()
        print("Done.")
        time.sleep(0.1)

    def amp(self, amp):
        print("Setting Coil Strength to " + str(amp) + " Counts/Hz")
        self.ser.write(("amp " + str(int(amp*100))).encode('utf-8'))
        self.read_serial()
        time.sleep(0.1)

    def attenuation(self, att):
        print("Setting Attenuator to " + str(att) + " dB")
        self.ser.write(("att " + str(att)).encode('utf-8'))
        self.read_serial()
        time.sleep(0.1)

    def select_well(self, well):
        print("Selecting Well " + str(well))
        self.ser.write(("well " + str(well)).encode('utf-8'))
        self.read_serial()
        time.sleep(0.1)

    def freq(self, freq):
        print("Setting Frequency to " + str(freq))
        self.ser.write(("freq " + str(freq)).encode('utf-8'))
        self.read_serial()
        time.sleep(0.1)

    def run(self, sequence=None):
        if(sequence is not None):
            self.load(sequence)
        print("Running Sequence")
        self.ser.write("trigger".encode('utf-8'))
        self.read_serial()
        time.sleep(0.1)


    def calibrate(self, calibrate_freq = True, calibrate_flip_angle = False):
        if calibrate_freq:
            with importlib.resources.as_file(importlib.resources.files('sequences').joinpath('mrc_builtin_se.mrc')) as path:
                self.load(str(path)) #load spin echo demo
            self.amp(1000)
            self.freq(self.frequency)
            self.run()
            best_idx = np.argmax(np.abs(np.fft.fft(self.rx_data[200:256+200])))
            best_freq = np.fft.fftfreq(256, d=1/fs)[best_idx]
            print("Calculated Frequency: %d" % (self.frequency - int(best_freq)))
            self.frequency = self.frequency - best_freq
            self.freq(self.frequency)

        if calibrate_flip_angle:
            npts = 20
            amps = np.linspace(0,1000,npts)
            fids = np.empty(npts)
            for i in range(len(amps)): 
                self.amp(amps[i])
                self.run()
                fids[i] = np.abs(self.rx_data[80])
                time.sleep(10)
            time.sleep(0.1)
            return fids

    def run_cpmg(self, n_echoes = 100, echo_time = 3e-3, t90 = 200e-6, t180 = 200e-6):
        self.load(build_cpmg(echo_time, n_echoes, t90, t180))
        self.run()
        return np.arange(0, echo_time * n_echoes, echo_time), get_echo_amplitudes(self.rx_data, n_echoes, echo_time, t90)

    def run_ir(self, inversion_time, n_echoes = 100, echo_time = 3e-3, t90 = 200e-6, t180 = 200e-6):
        self.load(build_ir(inversion_time, echo_time, n_echoes, t90, t180))
        self.run()
        return np.arange(0, echo_time * n_echoes, echo_time) + inversion_time, get_echo_amplitudes(self.rx_data, n_echoes, echo_time, t90+inversion_time, use_real=True)

    def run_ir_t1(self, inversion_times, n_echoes = 100, echo_time = 3e-3, t90 = 200e-6, t180 = 200e-6, inter_experiment_delay = 3):
        initial_magnetizations = np.empty(0)
        for inversion_time in inversion_times:
            self.load(build_ir(inversion_time, echo_time, n_echoes, t90, t180))
            self.run()
            echoes = get_echo_amplitudes(self.rx_data, n_echoes, echo_time, t90+inversion_time, use_real=True)
            initial_magnetizations = np.append(initial_magnetizations, get_m0(echoes, echo_time))
            time.sleep(inter_experiment_delay)
        return initial_magnetizations