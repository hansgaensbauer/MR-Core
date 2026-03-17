import scipy.optimize as opt
import numpy as np

from mrc.system_constants import *

def get_echo_amplitudes(rx_data, num_echoes, te, t90, use_real=False, width=40, t90_samples = None):
    tr_samples = te*100000
    if(t90_samples is None):
        t90_samples = int(t90 * fs)
    mags_abs = np.zeros(num_echoes)

    for i in range(num_echoes-1):
        start = int((i+1) * tr_samples - width/2) + t90_samples
        if (start + width) < len(rx_data):
            mags_abs[i] = np.mean(np.real(rx_data[start:start+width])) if use_real else np.mean(np.abs(rx_data[start:start+width]))

    return mags_abs
    
def get_t2(echo_data, te):
    def _decay(x, a, b, c):
        return a * np.exp(-b * x)+c
    popt, _ = opt.curve_fit(_decay, np.arange(len(echo_data))*te, echo_data/np.max(echo_data))
    return 1/popt[1]

def get_m0(echo_data, te):
    # def _decay(x, a, b, c):
    #     return a * np.exp(-b * x)+c
    # popt, _ = opt.curve_fit(_decay, np.arange(len(echo_data))*te, echo_data/np.max(echo_data))
    # return popt[0]*np.max(echo_data)
    return np.mean(echo_data[:5])