import numpy as np
import matplotlib.pyplot as plt

def f(x):
    return np.exp(-x) * np.cos(2*np.pi*x)

x1 = np.arange(0.0, 1.0, 2.0)

plt.plot(f(x1))
plt.ylabel('some numbers')
plt.show()

import webbrowser as webbrowser
webbrowser.Mozilla.open