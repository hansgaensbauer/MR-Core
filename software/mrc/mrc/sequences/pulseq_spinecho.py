import pypulseq as pp
import numpy as np

te = 3e-3
t90 = 200e-6
t180 = 200e-6

system = pp.Opts(max_grad=32, grad_unit='mT/m', max_slew=130, rf_raster_time=1/120e6, block_duration_raster=1/120e6, grad_raster_time=1/120e6, slew_unit='mT/m/ms')
seq = pp.Sequence(system=system)

# RF pulse with a 90 degree flip angle
rf90 = pp.make_block_pulse(flip_angle=90, duration=t90, system=system)
rf180 = pp.make_block_pulse(flip_angle=180, duration=t180, phase_offset = np.pi/2, system=system)

seq.add_block(rf90)
seq.add_block(pp.make_delay(te/2-t180/2))
print(5000*120e-6)
seq.add_block(rf180)
seq.add_block(pp.make_delay(te-t180))
seq.plot()
seq.write('se.seq')