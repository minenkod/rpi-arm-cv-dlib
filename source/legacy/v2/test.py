
import sys
from os import path
print("Sys path")
print('\n'.join(sys.path))


directory = '/usr/lib/python3/dist-packages'
sys.path.append(directory)

print ("directory exists:" + str(path.exists(directory)))


print("systempath set")
import platform
print("Python version:")
print(platform.python_version())

import cv2
print("cv2 Success!")

import dlib
print("dlib Success!")


#import sys




