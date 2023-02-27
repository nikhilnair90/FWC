import numpy as np
import matplotlib.pyplot as plt
from scipy.special import erfc

# Define the Q-function
def Q(x):
    return 0.5 * erfc(x / np.sqrt(2))

x = np.array([1, -1])

A_dB = np.arange(0, 11)
A = 10**(A_dB/10) 
#print(A)


Pe =  Q(A)

# Plot Pe
plt.plot(A, Pe)
plt.xlabel('A')
plt.ylabel('Pe')
plt.title('Theoretical Pe')
plt.grid()
plt.show()
