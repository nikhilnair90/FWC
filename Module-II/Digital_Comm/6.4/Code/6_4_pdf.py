import numpy as np
import matplotlib.pyplot as plt


n = 1000000     # Number of samples
np.random.seed(0)
U1 = np.random.uniform(0, 1, n)  # Generating samples of U1
U2 = np.random.uniform(0, 1, n)  # Generating samples of U2

T = U1 + U2          
T_ascend = np.sort(T)           # Sorting T in ascending order
x = T_ascend


# Calculating theoretical PDF of T
def pdf(x):
    if x <= 0:
        return 0
    elif 0 <= x <= 1:
        return x
    elif 1 < x <= 2:
        return 2-x
    else:
        return 0

y = [pdf(i) for i in x]

# Calculating the CDF of T through simulations
bin_edges = np.linspace(0, 2, num=50)
bin_centers = (bin_edges[:-1] + bin_edges[1:]) / 2
hist, _ = np.histogram(x, bins=bin_edges)
bin_width = bin_edges[1] - bin_edges[0]
hist = hist / (bin_width * np.sum(hist))

plt.scatter(bin_centers, hist,color='red', label='Simulated PDF')
plt.plot(x, y, label='Theoretical PDF')
plt.grid() 
plt.xlabel('$x$')
plt.ylabel('$P(T=x)$')
plt.legend()
plt.show()

