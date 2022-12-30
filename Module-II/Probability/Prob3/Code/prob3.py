import numpy as np
import random

k = [0,1,2,3]           # random variable
P_k = [0.125,0.375,0.375,0.125] # PDF             
cdf = [0,0,0,0]                 # initialising with 0
cdf = np.cumsum(P_k)            # CDF calculation using cumulative addition
#print(cdf)
trials = 100

def randomsamples():
 Samples = [x for x in range(trials)]     
 for i in range(trials):
      n = np.random.rand()       # random no.b/w 0 and 1
      if (n<=cdf[0]):
         Samples[i] = k[0]
      elif (n>cdf[0]) and (n<=cdf[1]):
         Samples[i] = k[1]
      elif (n>cdf[1]) and (n<=cdf[2]):
         Samples[i] = k[2]
      elif (n>cdf[2]):
         Samples[i] = k[3]
 Samples = str(Samples)
 return(Samples)

S = randomsamples()              

P_0 = S.count("0")/trials
P_1 = S.count("1")/trials
P_2 = S.count("2")/trials
P_3 = S.count("3")/trials

mu = k[0]*P_0+k[1]*P_1+k[2]*P_2+k[3]*P_3    # mean 
print("Mean number of heads in three tosses of a coin is", mu)


    

    
    


