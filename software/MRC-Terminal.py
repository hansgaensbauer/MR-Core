import tkinter as tk
from tkinter import ttk
import serial
import serial.tools.list_ports
import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg, NavigationToolbar2Tk
import numpy as np
import threading
import time
import scipy.optimize as opt

class AutoDetectException(Exception):
    pass

fs = 100e3
t90 = 150e-6
tr = 3000e-6
nechoes = 950
sequence_directory = "C:/Users/hansg/Documents/MIT/Hanlab/MR-Core/software/mrc/mrc/sequences"


#Autodetect com port
ports = serial.tools.list_ports.comports(include_links=False)
for port in ports:
    if port.pid == 22336:
        comport = port.device
        print("Connected to " + port.device)
        break
if comport == '':
    raise AutoDetectException("Port AutoDetect Failed. Is the MRC Connected Properly?")

def get_echo_amplitudes(cpdatas):
    width = 40
    tr_samps = 300
    t90_samps = 100 #int(t90 * fs)
    mags_abs = np.zeros(nechoes)

    for i in range(nechoes-1):
        start = int((i+1) * tr_samps - width/2) + t90_samps
        if((start + width) < len(cpdatas)):
            mags_abs[i] = np.mean(np.abs(cpdatas[start:start+width]))

    return mags_abs
    
def get_t2(cpdata):
    def _decay(x, a, b, c):
        return a * np.exp(-b * x)+c
    popt, pcov = opt.curve_fit(_decay, np.arange(len(cpdata))*tr, cpdata)
    return 1/popt[1]

# Setup serial communication (adjust port and baudrate as needed)
ser = serial.Serial(comport, timeout=4)
ser.reset_input_buffer()
TTYPE_STATUS = 1
TTYPE_DATA = 2

# Create a Tkinter window
root = tk.Tk()
root.title("Machine Interface")

# Create a frame for the plot
frame_plot = ttk.Frame(root)
frame_plot.pack(side=tk.TOP, fill=tk.BOTH, expand=1)

# Create a frame for the terminal
frame_terminal = ttk.Frame(root)
frame_terminal.pack(side=tk.BOTTOM, fill=tk.X)

# Create a plot using matplotlib
fig, ax = plt.subplots()
canvas = FigureCanvasTkAgg(fig, master=frame_plot)
canvas.draw()
canvas.get_tk_widget().pack(side=tk.TOP, fill=tk.BOTH, expand=1)

# Add a toolbar for navigation
toolbar = NavigationToolbar2Tk(canvas, frame_plot)
toolbar.update()
canvas.get_tk_widget().pack(side=tk.TOP, fill=tk.BOTH, expand=1)

# Add a text widget for terminal output
text_terminal = tk.Text(frame_terminal, height=10)
text_terminal.pack(side=tk.TOP, fill=tk.BOTH, expand=1)

# Add an entry widget for terminal input
entry_terminal = tk.Entry(frame_terminal)
entry_terminal.insert(tk.END, ">>> ")
entry_terminal.pack(side=tk.BOTTOM, fill=tk.BOTH, expand=1)

# Function to send command to the machine
def send_command(event):
    command = entry_terminal.get()[4:]
    print(command)
    #Copy the command to the console
    text_terminal.insert(tk.END, ">>> " + command + "\n")
    text_terminal.see(tk.END)
    entry_terminal.delete(0, tk.END)
    entry_terminal.insert(tk.END, ">>> ")
    if(command.split()[0] == "load"):
        progfile = sequence_directory + "/" + command.split()[1]
        with open(progfile, 'rb') as f:
            byte_array = bytearray(f.read())
            # byte_array = np.flip(np.reshape(byte_array, (-1,2)), axis=1)
            f.seek(0,2)
            filesize = int(f.tell())
            ser.write('load'.encode('utf-8') + filesize.to_bytes(2, 'big'))
            time.sleep(0.01)
            for i in range(int(filesize/64)):
                ser.write(byte_array[64*i:64*i+64])
                time.sleep(0.01)
                print(i)
            if(filesize - int(filesize/64)*64 > 0):
                ser.write(byte_array[64*int(filesize/64):])
                print(filesize - 64*int(filesize/64))
            
    elif(command == 'plotecho'):
        ax.cla()  # Clear the previous plot
        echoes = get_echo_amplitudes(cdata)
        ax.plot(np.arange(0,len(echoes)*tr, tr), echoes)
        canvas.draw()
        # ser.write('trigger'.encode('utf-8'))
    else:
        ser.write(command.encode('utf-8'))

entry_terminal.bind('<Return>', send_command)

# Function to read data from serial and update plot
def read_serial():
    while True:
        if (ser.inWaiting() > 0):
            header = ser.read(4)
            if(header[0] == TTYPE_STATUS):
                numbytes = (header[1]<<16)+(header[2]<<8)+(header[3])
                try:
                    message = ser.read(numbytes + 4)
                    check = (message[numbytes] == 0x01 and
                            message[numbytes + 1] == 0x02 and
                            message[numbytes + 2] == 0x03 and
                            message[numbytes + 3] == 0x04)
                    assert check
                    # Append to terminal output
                    text_terminal.insert(tk.END, "STATUS: " + message[0:numbytes].decode('ascii') + "\n")
                    text_terminal.see(tk.END)
                except:
                    text_terminal.insert(tk.END, "ERROR: Status Received Wrong Number of Bytes\n")
                    text_terminal.see(tk.END)
                    ser.reset_input_buffer()
            elif(header[0] == TTYPE_DATA):
                numbytes = ((header[1]<<16)+(header[2]<<8)+(header[3]))*4
                try:
                    capture = ser.read(numbytes + 4)
                    check = (capture[numbytes] == 0x01 and
                        capture[numbytes + 1] == 0x02 and
                        capture[numbytes + 2] == 0x03 and
                        capture[numbytes + 3] == 0x04)
                    assert check
                    capture_np = np.frombuffer(capture[2:-2], dtype=np.int16)
                    global cdata
                    cdata = capture_np[1::2] + 1j*capture_np[::2]
                    xlim = ax.get_xlim()
                    ylim = ax.get_ylim()
                    olddata = ax.has_data()
                    ax.cla()  # Clear the previous plot
                    ax.plot(np.real(cdata)[:-1])
                    ax.plot(np.imag(cdata)[:-1])
                    if(olddata):
                        ax.set_xlim(xlim)
                        ax.set_ylim(ylim)
                    canvas.draw()
                    text_terminal.insert(tk.END, "Received Bytes: %d\n" % (numbytes))
                    text_terminal.see(tk.END)
                except:
                    text_terminal.insert(tk.END, "ERROR: Received Wrong Number of Bytes (should be %d)\n" % numbytes)
                    text_terminal.see(tk.END)
                    ser.reset_input_buffer()
            else:
                ser.reset_input_buffer()
        time.sleep(0.001) 

# Run the read_serial function in a separate thread
thread = threading.Thread(target=read_serial)
thread.daemon = True
thread.start()

# Start the Tkinter event loop
root.mainloop()