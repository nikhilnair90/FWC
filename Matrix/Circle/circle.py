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
L = np.array(([3,4]))    #point(a,b) on circle 2,3 
X = np.arange(-5,15,1)   #x points to draw locus


#Centre and radius of circle1
u1 = np.array(([0,0]))
r1 = np.array(([2]))


# plotting the locus
y1=(L[0]**2+L[1]**2+r1**2)
y2=2*L[0]
y3=2*L[1]
Y=(y1-y2*X)/y3    #y points to draw locus

plt.plot(X,Y,'r--',label='Locus ');


#Computation of center and radius of circle2      
g =3
t = (y1-y2*g)/y3
u2 = np.array([g,t])
#r2 = math.sqrt(LA.norm(u2)**2 - 4)
r2= LA.norm(u2-L)
#print(r2)

#Computation of center and radius of circle3      
h = 5
k = (y1-y2*h)/y3 
u3 = np.array([h,k]) 
r3=LA.norm(u3-L)
#r3 = math.sqrt(LA.norm(u3)**2 - 4)                                    
#print(r3)

#Generating the circle
x_circ1= circ_gen(u1,r1) 
x_circ2= circ_gen(u2,r2) 
x_circ3= circ_gen(u3,r3)

# use set_position
ax = plt.gca()
ax.spines['top'].set_color('none')
ax.spines['left'].set_position('zero')
ax.spines['right'].set_color('none')
ax.spines['bottom'].set_position('zero')


#Plotting the circle
plt.plot(x_circ1[0,:],x_circ1[1,:],label='$Circle1$')
plt.plot(x_circ2[0,:],x_circ2[1,:],label='$Circle2$')
plt.plot(x_circ3[0,:],x_circ3[1,:],label='$Circle3$')

#Labeling the coordinates
tri_coords = np.vstack((u1,u2,u3,L)).T
plt.scatter(tri_coords[0,:], tri_coords[1,:])
vert_labels = ['u1(0,0)','u2(g,t)','u3(h,k)','L(a,b)']
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
subprocess.run(shlex.split("termux-open /sdcard/nikhil/matrix/circle/fig.pdf"))
#plt.show()



