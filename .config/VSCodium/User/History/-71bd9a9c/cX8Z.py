import numpy as np
import matplotlib.pyplot as plt

def f(x):
    return np.exp(-x) * np.cos(2*np.pi*x)

x1 = 2

plt.plot(f(x1))
plt.ylabel('some numbers')
plt.show()