# IMPORT LIBRARIES
# from IPython import get_ipython
# get_ipython().magic('reset -sf')
import numpy as np
import time
import winsound
import sys
import serial
import os
import random


# STEP 1. CONVERT ALL FILES to 16-bit wave
# https://audio.online-convert.com/convert-to-wav
# Same sampling rate & audio channels.

# STEP 2. MOVE ALL SOUND FILES into a new folder: Documents/BIPN145/SoundFiles

# STEP 3. In the window at right, move into the folder where the code & sound files are
#cd Documents
#cd BIPN145
#cd SoundFiles

# STEP 4. CHANGE SOUND FILE NAMES BELOW FOR STANDARD & DEVIANT 1-5

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
          
    winsound.PlaySound("bake_hammers_v3.wav",winsound.SND_ASYNC)
    
    if n in deviant_IDs:
        dev_stim = random.randint(1,5) # choose a random number from 1 to 5
        if dev_stim == 1:
            winsound.PlaySound("bake_hammers_v3.wav",winsound.SND_ASYNC) # DEVIANT 1
            
        if dev_stim == 2:
            winsound.PlaySound("bake_hammers_v3.wav",winsound.SND_ASYNC) # DEVIANT 2
            
        if dev_stim == 3:
            winsound.PlaySound("bake_hammers_v3.wav",winsound.SND_ASYNC) # DEVIANT 3
            
        if dev_stim == 4:
            winsound.PlaySound("bake_hammers_v3.wav",winsound.SND_ASYNC) # DEVIANT 4
            
        if dev_stim == 5:
            winsound.PlaySound("bake_hammers_v3.wav",winsound.SND_ASYNC) # DEVIANT 5
        
        ser.write(3) # three pulses for deviant

    else:
        winsound.PlaySound("bake_hammers_v3.wav",winsound.SND_ASYNC) # STANDARD
        
        ser.write(1) # one pulse for standard


    time.sleep(ITI)

        
ser.close()