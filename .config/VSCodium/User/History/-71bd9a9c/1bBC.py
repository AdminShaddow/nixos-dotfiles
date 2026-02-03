import numpy as np
import matplotlib.pyplot as plt

def f(x):
    return np.exp(-x) * np.cos(2*np.pi*t)

x1 = (0.0, 1.0, 2.0, 3.0)

plt.plot(f(x1))
plt.ylabel('some numbers')
plt.show()