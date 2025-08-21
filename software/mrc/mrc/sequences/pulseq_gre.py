import pypulseq as pp
import numpy as np

gamma = 42.577e6 #Hz/T
grad_strength_x = 1.6e-3 * 30 #T/m
grad_strength_y = 1.6e-3 * 30 #T/m
grad_strength_z = 1.6e-3 * 30 #T/m
fs = 100e3 #Hz

fov = fs/(gamma*grad_strength_x)  # FOV is fixed by scanner
print(fov)
Nx = 256

t90 = 20e-6
dead_time = 10e-6

system = pp.Opts(max_grad=32, grad_unit='mT/m', max_slew=130, rf_raster_time=1/120e6, block_duration_raster=1/120e6, grad_raster_time=1/120e6, slew_unit='mT/m/ms')
seq = pp.Sequence(system=system)

rf90 = pp.make_block_pulse(flip_angle=90, duration=t90, system=system)
g_windup_x = pp.make_trapezoid(channel="x", flat_area=grad_strength_x*Nx/fs/2, flat_time=Nx/fs/2, system=system)
g_readout_x = pp.make_trapezoid(channel="x", flat_area=-grad_strength_x*Nx/fs, flat_time=Nx/fs, system=system)

seq.add_block(rf90)
seq.add_block(pp.make_delay(dead_time))
seq.add_block(g_windup_x)
seq.add_block(g_readout_x)
seq.plot()
seq.write('1d.seq')