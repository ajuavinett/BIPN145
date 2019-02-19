# IMPORT LIBRARIES
# from IPython import get_ipython
# get_ipython().magic('reset -sf')
import numpy as np
import time
import winsound
import serial

# ESTABLISH COMMUNICATION WITH ARDUINO
# Talk to the Arduino. This COM port will depend on where your Arduino is plugged in.
# If your com port was different in the Arduino IDE, you need to change it here.
# If you cannot figure out which port your Arduino is connected to, open an Anaconda Prompt and type "python -m serial.tools.list_ports"
# This will list the ports for you.
ser = serial.Serial('COM3')

# EXPERIMENT VARIABLES
ITI = 2 # intertrial interval, in s
num_beeps = 100 # number of beeps
duration = 300 # sound duration, in ms
frequency = 1000 # main frequency, in Hz
deviant = 500 # deviant frequency, in Hz
deviant_ratio = 0.2 # ratio of deviant to normal frequencies. 0.2 = 20% deviant

# CREATE THE STIMULUS ARRAY
stim_array = np.full((1,num_beeps),1000)
deviant_IDs = np.unique(np.random.choice(num_beeps,int(num_beeps*deviant_ratio)))
deviant_IDs = deviant_IDs[deviant_IDs>4] # only keep after 5 trials
stim_array[0,deviant_IDs] = deviant

# PLAY THE STIMULI! (And tell LabChart when you do!)
for n in range(num_beeps):
    print('trial #:',n)
    winsound.Beep(stim_array[0,n],duration)   
    if n in deviant_IDs:
        ser.write(3) # three pulses for deviant
    else:
        ser.write(1) # one pulse for standard
    time.sleep(ITI)

        
ser.close()