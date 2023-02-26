import numpy as np
import matplotlib.pyplot as plt

n = 1000
# Generate equiprobable X ∈ {1,-1}
X = np.random.choice([1, -1], size=n)

A_dB = 5  
A = 10**(A_dB/10)  # converting to linear scale

# Generate N 
N = np.random.normal(0, 1, n)  

Y = A*X + N
z = range(len(Y))

plt.scatter(z, Y, color='red', label='Y=AX+N')
plt.grid() 
plt.xlabel('$X$')
plt.ylabel('$Y$')
plt.legend()
plt.show()
