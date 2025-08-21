import numpy as np

from mrc.system_constants import *

def build_spinecho(te, t90, t180):  
    seq = pp.Sequence(system=system)

    rf90 = pp.make_block_pulse(flip_angle=np.pi/2, duration=t90, system=system)
    rf180 = pp.make_block_pulse(flip_angle=np.pi, duration=t180, phase_offset = np.pi/2, system=system)

    seq.add_block(rf90)
    seq.add_block(pp.make_delay(te/2-t180/2))
    seq.add_block(rf180)
    seq.add_block(pp.make_delay(te-t180))
    return seq

def build_cpmg(echo_time, num_echoes, t90, t180):
    seq = pp.Sequence(system=system)

    rf90 = pp.make_block_pulse(flip_angle=np.pi/2, duration=t90, system=system)
    rf180 = pp.make_block_pulse(flip_angle=np.pi, duration=t180, phase_offset = np.pi/2, system=system)

    seq.add_block(rf90)
    seq.add_block(pp.make_delay(echo_time/2-t180/2))
    for i in range(num_echoes):
        seq.add_block(rf180)
        seq.add_block(pp.make_delay(echo_time-t180))
    return seq

def build_ir(inversion_time, echo_time, num_echoes, t90, t180):
    seq = pp.Sequence(system=system)

    rf90 = pp.make_block_pulse(flip_angle=np.pi/2, duration=t90, system=system)
    rf180 = pp.make_block_pulse(flip_angle=np.pi, duration=t180, phase_offset = np.pi/2, system=system)

    seq.add_block(rf180)
    seq.add_block(pp.make_delay(inversion_time-t180/2-t90/2))
    seq.add_block(rf90)
    seq.add_block(pp.make_delay(echo_time/2-t180/2))
    for i in range(num_echoes):
        seq.add_block(rf180)
        seq.add_block(pp.make_delay(echo_time-t180))
    return seq


