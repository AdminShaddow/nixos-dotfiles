import math as math
import numpy as numpy

x = 0
n = 1000
counter = 0
str1 = "4"
str2 = ""

for i in range(n,9999):
    x = x + 1
    if numpy.mod(x,4) == 0:
        str2 = f'{x}'
        print (str2)
    if str1 in str2:
        counter = counter + 1
print ("----")
print (counter)