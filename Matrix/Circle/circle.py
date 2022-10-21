import numpy as np
import matplotlib.pyplot as plt
from numpy import linalg as LA
import math
import sys  #for path to external scripts

import subprocess
import shlex

#local imports
#from line.funcs import *
#from triangle.funcs import *
#from conics.funcs import circ_gen 

def line_dir_pt(m,G,k1,k2):
   len = 10
   dim = G.shape[0]
   x_LC = np.zeros((dim,len))
   lam_1 = np.linspace(k1,k2,len)
   for i in range(len):
     temp1 = G + lam_1[i]*m
     x_LC[:,i]= temp1.T
   return x_LC



#Generating points on a circle
def circ_gen(O,r):
  len = 100
  theta = np.linspace(0,2*np.pi,len)
  x_circ = np.zeros((2,len))
  x_circ[0,:] = r*np.cos(theta)
  x_circ[1,:] = r*np.sin(theta)
  x_circ = (x_circ.T + O).T
  return x_circ


#Input parameters
A = np.array(([3,4]))    #point(a,b) on circle 2,3 
X = np.arange(-5,15,1)   #x points to draw locus


#Centre and radius of circle1
u1 = np.array(([0,0]))
r1 = np.array(([2]))


#plotting the locus
C=(LA.norm(A)**2+r1**2)/2
e1=np.array(([1,0]))
e2=np.array(([0,1]))

g = C/(A@e1)
G = g*e1
t = C/(A@e2)
T = t*e2

plt.axline(G,T, color='red', linestyle='--',label='$Locus$')

#Computation of  radius of circle2
u2=G
r2 = LA.norm(G-A)

#Computation of radius of circle3 
u3=T
r3 = LA.norm(T-A)

#To check orthogonality
S1=r1**2+r3**2
S2=LA.norm(u3-u1)**2
if round(S1[0])==round(S2):
    print('S1=S2, hence circles are orthogonal')
else:
    print('S!=S2, hence circles are not orthogonal')

#Generating the circle
x_circ1= circ_gen(u1,r1) 
x_circ2= circ_gen(G,r2) 
x_circ3= circ_gen(T,r3)

# use set_position
ax = plt.gca()
ax.spines['top'].set_color('none')
ax.spines['left'].set_position('zero')
ax.spines['right'].set_color('none')
ax.spines['bottom'].set_position('zero')


#Plotting the circle
plt.plot(x_circ1[0,:],x_circ1[1,:],color='orange',label='$Circle1$')
plt.plot(x_circ2[0,:],x_circ2[1,:],color='green',label='$Circle2$')
plt.plot(x_circ3[0,:],x_circ3[1,:],color='yellow',label='$Circle3$')

#Labeling the coordinates
tri_coords = np.vstack((u1,A,u2,u3)).T
plt.scatter(tri_coords[0,:], tri_coords[1,:])
vert_labels = ['u1(0,0)','A(a,b)','u2','u3']
for i, txt in enumerate(vert_labels):
    plt.annotate(txt, # this is the text
            (tri_coords[0,i], tri_coords[1,i]), # this is the point to label
            textcoords="offset points", # how to position the text
            xytext=(0,10), # distance from text to points (x,y)
            ha='center') # horizontal alignment can be left, right or center



plt.xlabel('$ X $')
plt.ylabel('$ Y $')
plt.legend()
plt.grid(True) # minor
plt.axis('equal')
plt.title('Locus of center of circle')
plt.savefig('/sdcard/nikhil/matrix/circle/fig.pdf')
#subprocess.run(shlex.split("termux-open /sdcard/nikhil/matrix/circle/fig.pdf"))
#plt.show()



