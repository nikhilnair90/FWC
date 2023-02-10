import numpy as np
import matplotlib.pyplot as plt


n = 1000000     # Number of samples
np.random.seed(0)
U1 = np.random.uniform(0, 1, n)  # Generating samples of U1
U2 = np.random.uniform(0, 1, n)  # Generating samples of U2

T = U1 + U2          
T_ascend = np.sort(T)           # Sorting T in ascending order
x = T_ascend

# Calculating the CDF of T through simulation
pdf_sim = np.ones(n)/n
cdf_sim = np.cumsum(pdf_sim)

# Calculating theoretical CDF of T
def cdf(x):
    if x <= 0:
        return 0
    elif 0 <= x <= 1:
        return x**2/2
    elif 1 < x <= 2:
        return -1/2*x**2+2*x-1
    else:
        return 1

x_stepped = x[0 : n : int(n/50)]
y = [cdf(i) for i in x_stepped]

plt.plot(T_ascend, cdf_sim, label='Simulated CDF')
plt.scatter(x_stepped, y, s=20, color='red', label='Theoretical CDF')
plt.grid() 
plt.xlabel('$x$')
plt.ylabel('$F_T(x)$')
plt.legend()
plt.show()

