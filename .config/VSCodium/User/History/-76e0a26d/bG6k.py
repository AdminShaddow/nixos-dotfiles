import math as math
import numpy as numpy

x = 0
n = 10

for i in range(n):
    x = x + 1
    if numpy.mod(x,4) == 0:
        print (x)
