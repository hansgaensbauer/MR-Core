# MRC Python Library
The following is documentation for the MRC python library, which includes drivers for the MRC hardware, as well as built-in pulse sequence creation tools and post processing functions for magnetic resonance experiments. 

# Class: `Console`
This class encapsulates functions that interact with the MRC hardware. 

## Attributes

- **`rx_data`**: (numpy.ndarray of numpy.complex128) – This array stores the most recent raw received data. The sample rate is 100kSa/s.
- **`ser`**: (pyserial.Serial) – Serial object for communicating with the console.
- **`frequency`**: (int) – This is the console center frequency. This variable should not be set externally, and is only used for data post-processing. Instead, use Console.freq() to change the system frequency. 

## Methods

### `Console(port = None, frequency = 21.65e6) -> None`
Connect to and initialize the MRC console. This is the constructor for the MRC class.

**Parameters:**
- **`port`**: (str) – Optional COM port of the system. If no port is provided, the class will attempt to autodetect the console.
- **`frequency`**: (float) – Calibration center frequency for the system. This should be within 100kHz of the true magnet frequency.

**Parameters:**
- **`amplitude`**: (float) – The system coil strength in units of DAC Counts/Hz. This value will be multiplied by the pulse amplitude defined in the pulseq experiment, which has units of Hz. The maximum DAC output is 2<sup>15</sup>, so the product of the system coil strength and the pulse amplitude must fall below this number.

### `Console.freq(frequency) -> None`
Sets the system Larmor frequency in Hz.

**Parameters:**
- **`frequency`**: (int) – The current larmor frequency. 

### `Console.run(sequence = None) -> None`
Load and run the provided sequence, or run the currently loaded sequence. 

**Parameters:**
- **`sequence`**: (str or Sequence, optional) – If `sequence` is provided, it will be loaded onto the console before the experiment is triggered. If it is not provided, then the console will run the last sequence loaded. If `sequence` is str, it represents the path to a compiled sequence file. If `sequence` is type `pypulseq.Sequence.sequence.Sequence`, this function will compile it into a temporary file, load it onto the system, and then delete the temporary file.

### `Console.calibrate(calibrate_freq=True, calibrate_flip_angle=False) -> Tuple`
Perform frequency and flip angle calibration. The use of this function to calibrate the flip angle is not recommended - in most cases, the system coil strength should be set manually for each new probe and then held constant. This function will update the system frequency and amplitude automatically if the corresponding calibration is requested. It loads a spinecho experiment to perform calibration, so it is necessary to reload the desired experiment after performing calibration.

**Parameters:**
- **`calibrate_freq`**: (bool) – If `calibrate_freq` is true, this function will run an FFT based frequency calibration.
- **`calibrate_flip_angle`**: (bool) – If `calibrate_flip_angle` is true, this function will run an amplitude calibration.

**Returns:**
- **`f0, coil_strength`**: (tuple) – The calculated Larmor frequency and coil strength after calibration. If either calibration was not performed, the corresponding return value will be `None`.

### `Console.run_cpmg(n_echoes = 100, echo_time = 3e-3, t90 = 200e-6, t180 = 200e-6) -> Tuple`
Builds, loads, and runs a Carr-Purcell-Meiboom-Gill experiment. 

**Parameters:**
- **`n_echoes`**: (int) – The number of echoes in the experiment.
- **`echo_time`**: (float) – The inter-echo spacing in seconds.
- **`t90`**: (float) – The duration of the 90 degree pulse in seconds.
- **`t180`**: (float) – The duration of the 180 degree pulse in seconds.

**Returns:**
- **`echo_time_points, echo_amplitudes`**: (tuple) – The time coordinates and amplitudes of the echoes from the CPMG experiment.

### `Console.run_ir(inversion_time, n_echoes = 100, echo_time = 3e-3, t90 = 200e-6, t180 = 200e-6) -> Tuple`
Builds, loads, and runs an inversion-recovery CPMG experiment. 

**Parameters:**
- **`inversion_time`**: (float) – The inversion time for the experiment in seconds.
- **`n_echoes`**: (int) – The number of echoes in the experiment.
- **`echo_time`**: (float) – The inter-echo spacing in seconds.
- **`t90`**: (float) – The duration of the 90 degree pulse in seconds.
- **`t180`**: (float) – The duration of the 180 degree pulse in seconds.

**Returns:**
- **`echo_time_points, echo_amplitudes`**: (tuple) – The time coordinates and amplitudes of the echoes from the IR CPMG experiment.

### `Console.run_ir_t1(inversion_times, n_echoes = 100, echo_time = 3e-3, t90 = 200e-6, t180 = 200e-6, inter_experiment_delay = 3) -> Tuple`
Measures T<sub>1</sub> using repeated IR CPMG experiments with user specified inversion times.

**Parameters:**
- **`inversion_time`**: (numpy.ndarray) – An array of inversion times to sweep.
- **`n_echoes`**: (int) – The number of echoes in the experiment.
- **`echo_time`**: (float) – The inter-echo spacing in seconds.
- **`t90`**: (float) – The duration of the 90 degree pulse in seconds.
- **`t180`**: (float) – The duration of the 180 degree pulse in seconds.
- **`inter_experiment_delay`**: (float) – The wait time between each experiment in seconds.

**Returns:**
- **`initial_magnetizations`**: (numpy.ndarray) – The initial magnetizations for each inversion time specified in the input arguments. 

### `Console.load(sequence) -> None`
Loads a pypulseq Sequence or cpmpiled .mrc file onto the system.

**Parameters:**
- **`sequence`**: (str or Sequence) – If `sequence` is str, it represents the path to a compiled sequence file. If `sequence` is type `pypulseq.Sequence.sequence.Sequence`, this function will compile it into a temporary file, load it onto the system, and then delete the temporary file.

### `amp(amplitude) -> None`
Sets the system coil B<sub>1</sub> strength in DAC Counts/Hz.

# Other Functions
These functions are not part of the Console class, and should be called with `mrc.[functionname]()`

### `build_spinecho(te, t90, t180) -> pypulseq.Sequence.sequence.Sequence`
Convenience function for creating a pulseq spin-echo sequence.

**Parameters:**
- **`te`**: (float) – The inter-echo spacing in seconds.
- **`t90`**: (float) – The duration of the 90 degree pulse in seconds.
- **`t180`**: (float) – The duration of the 180 degree pulse in seconds.

**Returns:**
- **`sequence`**: (pypulseq.Sequence.sequence.Sequence) – A spin-echo experiment implemented in pypulseq.

### `build_cpmg(echo_time, num_echoes, t90, t180) -> pypulseq.Sequence.sequence.Sequence`
Convenience function for creating a pulseq CPMG sequence.

**Parameters:**
- **`echo_time`**: (float) – The inter-echo spacing in seconds.
- **`num_echoes`**: (int) – The number of echoes in the experiment.
- **`t90`**: (float) – The duration of the 90 degree pulse in seconds.
- **`t180`**: (float) – The duration of the 180 degree pulse in seconds.

**Returns:**
- **`sequence`**: (pypulseq.Sequence.sequence.Sequence) – A CPMG experiment implemented in pypulseq.

### `build_ir(inversion_time, echo_time, num_echoes, t90, t180) -> pypulseq.Sequence.sequence.Sequence`
Convenience function for creating a pulseq inversion recovery CPMG sequence.

**Parameters:**
- **`inversion_time`**: (float) – The inversion time in seconds.
- **`echo_time`**: (float) – The inter-echo spacing in seconds.
- **`num_echoes`**: (int) – The number of echoes in the experiment.
- **`t90`**: (float) – The duration of the 90 degree pulse in seconds.
- **`t180`**: (float) – The duration of the 180 degree pulse in seconds.

**Returns:**
- **`sequence`**: (pypulseq.Sequence.sequence.Sequence) – An inversion recovery CPMG experiment implemented in pypulseq.

### `get_echo_amplitudes(rx_data, num_echoes, te, t90) -> numpy.ndarray`
Extract the echo amplitudes from the received data

**Parameters:**
- **`rx_data`**: (np.ndarray of numpy.complex128) – The received data from a CPMG experiment
- **`num_echoes`**: (int) – The number of echoes in the experiment.
- **`te`**: (float) – The inter-echo spacing in seconds.
- **`t90`**: (float) – The duration of the 90 degree pulse in seconds.

**Returns:**
- **`mags_abs`**: (np.ndarray) – The CPMG echo amplitudes.

### `get_t2(echo_data, te) -> float`
Estimate T<sub>2</sub> from an array of echo amplitudes.

**Parameters:**
- **`echo_data`**: (np.ndarray) – Array of echo amplitudes.
- **`te`**: (float) – The inter-echo time in seconds.

**Returns:**
- **`t2`**: (float) – The best-fit value for T<sub>2</sub>.

### `get_m0(echo_data, te) -> float`
Estimate M<sub>0</sub> from an array of echo amplitudes.

**Parameters:**
- **`echo_data`**: (np.ndarray) – Array of echo amplitudes.
- **`te`**: (float) – The inter-echo time in seconds.

**Returns:**
- **`m0`**: (float) – The best-fit value for M<sub>0</sub>.

### `compile_sequence(sequence, progfile) -> None`
Compile a pypulseq sequence or .seq file into a .mrc binary for the system.

**Parameters:**
- **`sequence`**: (str or pypulseq.Sequence.sequence.Sequence) – If `sequence` is str, it represents the path to a compiled sequence file. If `sequence` is type `pypulseq.Sequence.sequence.Sequence` it will be compiled without being saved as a .seq file first.
- **`progfile`**: (str) – The path for the .mrc file that will be produced.

### `mrcdump(mrcfile) -> None`
Disassemble a .mrc file and pretty-print the result.

**Parameters:**
- **`mrcfile`**: (str) - The path to the .mrc file to disassemble. 

