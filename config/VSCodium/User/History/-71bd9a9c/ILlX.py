import numpy as np
import matplotlib.pyplot as plt

def f(t):
    return np.sin(t)*t

t1 = np.arange(0.0, 50.0, 0.0001)

plt.figure(1)
plt.subplot(211)
plt.plot(t1, f(t1))

##plt.subplot(212)
##plt.plot(t2, np.cos(2*np.pi*t2), 'r--')
plt.show()
