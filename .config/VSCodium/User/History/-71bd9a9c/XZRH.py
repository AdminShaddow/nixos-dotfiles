import numpy as np
import matplotlib.pyplot as plt

def f(x):
    return np.sin(x)

plt.plot([1,2,3,4], 'ro')
plt.axis([0, 16, 0, 16])
plt.show()