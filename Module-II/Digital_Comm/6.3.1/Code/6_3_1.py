import numpy as np
import matplotlib.pyplot as plt


n = 10000     # Number of samples

U = np.random.uniform(0, 1, n)  # Generate samples of U
#print(U)

V = -2 * np.log(1 - U)          # Transforming U to V 
V_ascend = np.sort(V)           # Sort V in ascending order
#print(V_ascend)

# Calculating the CDF of V
cdf = np.cumsum(V_ascend)/n
#print(cdf)  

# Plotting the CDF of V
plt.plot(V_ascend,cdf)
plt.grid() 
plt.xlabel('$V$')
plt.ylabel('$F_V(V)$')
plt.show()
