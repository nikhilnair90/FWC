import numpy as np
import math

# Initialize the number of items to choose from
n = 3
# Initialize the number of possibilities to choose
x = range(n + 1)
p = 0.5   #probability of head
q = 0.5   #probability of tail

#print(x)
print("The distribution of no. of heads is")
mu = 0
for i in x:
    print(x[i])
    nCx = math.comb(n,x[i])
    Pxi = nCx*p**x[i]*q**(n-x[i])
    Xi_Pxi= x[i]*Pxi
    print(Pxi)
    mu = mu + Xi_Pxi
    if i==4:
        break    
    i+=1
print("mean number of heads in three tosses of a coin is", mu)    
 



