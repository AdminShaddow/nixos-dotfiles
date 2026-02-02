import math as math
import numpy as numpy

x = 0
n = 9999
counter = 0
str1 = "4"

for i in range(n):
    x = x + 1
    if numpy.mod(x,4) == 0:
        str2 = "{x}"
    if str1 in str2:
        counter = counter + 1
print (counter)

print(f"{str1 in string}")