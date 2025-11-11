import mrc
import pypulseq as pp
import numpy as np

te = 1e-3
t90 = 200e-6
t180 = 200e-6

system = pp.Opts(max_grad=32, grad_unit='mT/m', max_slew=130, rf_raster_time=1/120e6, block_duration_raster=1/120e6, grad_raster_time=1/120e6, slew_unit='mT/m/ms')
seq = pp.Sequence(system=mrc.system)

# RF pulse with a 90 degree flip angle
rf90_0 = pp.make_block_pulse(flip_angle=np.pi/2, duration=5000e-6, phase_offset = 0*np.pi/180, system=system)
rf90_120 = pp.make_block_pulse(flip_angle=np.pi/60, phase_offset = 120*np.pi/180, duration=100e-6, system=system)
rf180_240 = pp.make_block_pulse(flip_angle=1.0*np.pi, duration=100e-6, phase_offset = -120*np.pi/180, system=system)
rf180_120 = pp.make_block_pulse(flip_angle=1.0*np.pi, duration=100e-6, phase_offset = 120*np.pi/180, system=system)
rf90_240 = pp.make_block_pulse(flip_angle=1.0*np.pi/2, phase_offset = -120*np.pi/180, duration=100e-6, system=system)
rf180x = pp.make_block_pulse(flip_angle=np.pi, duration=200e-6, phase_offset = np.pi/2, system=system)

seq.add_block(rf90_0)
seq.add_block(pp.make_delay(5e-3))
seq.add_block(rf90_120)
seq.add_block(pp.make_delay(2e-3))
seq.add_block(rf90_120)
seq.add_block(pp.make_delay(2e-3))
seq.add_block(rf90_120)
seq.add_block(pp.make_delay(2e-3))
seq.add_block(rf90_120)
seq.add_block(pp.make_delay(2e-3))
seq.add_block(rf90_120)
seq.add_block(pp.make_delay(2e-3))

# seq = mrc.build_spinecho(4e-3,100e-6,100e-6)

mrc.compile_sequence(seq, 'repeats.mrc')
mrc.mrcdump('repeats.mrc')