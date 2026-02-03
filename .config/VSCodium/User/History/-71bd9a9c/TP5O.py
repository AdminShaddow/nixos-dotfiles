import numpy as np
import matplotlib.pyplot as plt

def f(t):
    return np.exp(-x) * np.cos(2*np.pi*t)

t1 = (0.0, 1.0, 2.0, 3.0)

plt.plot(f(t1))
plt.ylabel('some numbers')
plt.show()