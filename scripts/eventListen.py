#!/usr/bin/python
import struct
import os

inputDevice = "/dev/input/event0"
inputEventFormat = 'iihhi'
inputEventSize = 16
file = open(inputDevice, "rb")
event = file.read(inputEventSize)

while event:
   (time1, time2, type, code, value) = struct.unpack(inputEventFormat, event)
   if type == 4 and code == 4 and value == 103: # tested in ArchLinuxArm (OTB Button)
      os.system("/home/anton/scripts/rotate180.sh") # runs the script if it is found in PATH
   event = file.read(inputEventSize)
file.close()

