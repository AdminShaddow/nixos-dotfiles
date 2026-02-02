import numpy as np
import matplotlib.pyplot as plt

def f(x):
    return np.sin(x)

x1 = 2

plt.plot(f(1), f(2), f(3))
plt.ylabel('some numbers')
plt.show()