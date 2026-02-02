import math as math
import numpy as numpy

x = 1000
counter = 0
str1 = '4'
str2 = ""

for i in range(x,9999):
    x = x + 1
    if numpy.mod(x,4) == 0:
        str2 = f"{x}"
    if str1 in str2:
        counter = counter + 1
        print(x)
        print (counter)
        print("----")