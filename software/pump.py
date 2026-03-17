import serial
import time

class Pump:
    
    def __init__(self, port = 'COM10', output = False):
        self.port = port
        self.output = output
        try:
            self.ser = serial.Serial('COM10', 115200, timeout = 1)
        except Exception as e:
            self.ser = serial.Serial('/dev/ttyUSB1', 115200, timeout = 1)
            print(e)
            print("Trying USB1")
        self.ser.bytesize = 8   # Number of data bits = 8
        self.ser.parity  ='N'   # No parity
        self.ser.stopbits = 1   # Number of Stop bits = 1
        
        time.sleep(0.1)
        self.ser.write(bytes('stop 1 \n', 'utf-8'))
        self.ser.write(bytes('stop 2 \n', 'utf-8'))
        time.sleep(0.1)
        if(self.output): print("Pump: " + self.ser.readline().decode('utf-8'))
        if(self.output): print("Pump: " + self.ser.readline().decode('utf-8'))
        self.setspeed(1, 50)
        self.setspeed(2, 50)
        self.start(1)
        self.start(2)
        
    def setspeed(self, pump, speed):
        self.ser.write(bytes(("setspeed " + str(pump) + " %d\n" % (speed)), 'utf-8'))
        time.sleep(0.1)
        if(self.output): print("Pump: " + self.ser.readline().decode('utf-8'))
        
    def setdir(self, pump, dir):
        if(dir == 'cw'):
            self.ser.write(bytes("setdir " + str(pump) + " 1 \n", 'utf-8'))
        elif(dir == 'ccw'):
            self.ser.write(bytes("setdir " + str(pump) + " 0\n", 'utf-8'))
        time.sleep(0.1)
        if(self.output): print("Pump: " + self.ser.readline().decode('utf-8'))
        
    def stop(self, pump):
        self.ser.write(bytes("stop " + str(pump) + " \n", 'utf-8'))
        time.sleep(0.1)
        if(self.output): print("Pump: " + self.ser.readline().decode('utf-8'))
        
    def start(self, pump):
        self.ser.write(bytes("start " + str(pump) + " \n", 'utf-8'))
        time.sleep(0.1)
        if(self.output): print("Pump: " + self.ser.readline().decode('utf-8'))
        
    def getspeed(self, pump):
        self.ser.write(bytes("getspeed " + str(pump) + " \n", 'utf-8'))
        time.sleep(0.1)
        if(self.output): print("Pump: " + self.ser.readline().decode('utf-8'))
        
    def getalarm(self, pump):
        self.ser.write(bytes("getalarm " + str(pump) + " \n", 'utf-8'))
        time.sleep(0.1)
        if(self.output): print("Pump: " + self.ser.readline().decode('utf-8'))
        
    def __del__(self):
        pass
        # self.ser.close()