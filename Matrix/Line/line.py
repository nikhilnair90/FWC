#To find the orthocenter of a triangle  


#Python libraries for math and graphics
import numpy as np
import matplotlib.pyplot as plt
from numpy import linalg as LA

import sys                                          #for path to external scripts

#local imports
#from line.funcs import *
#from triangle.funcs import *
#from conics.funcs import circ_gen

#if using termux
import subprocess
import shlex
#end if

##1st METHOD
##Input parameters
#B = np.array(([4,0]))
#O = np.array(([0,0]))
#m = np.array(([3,4]))    # m = (A-O)
#Q = O + (m@(B-O)/LA.norm(m)**2)*m
#
#print('Coordinates of point Q')
#print(Q)
#  
##  to calculate scalar L2
#
#  #  x1=3; y1=4;
#  #  x2=3; y2=0;
#  #  x3=4; y3=0;
#  #  x4=1.44; y4=1.92;
#   
#   #the first line AP = A+L1(P-A)
#   #  x1, y1 = A;   x2, y2 = P
#   # AP = ([3,4]) + L1([0,-4])
#
#   #the second line BQ = (B)+L2(Q-B)
#   #   x3, y3 = B;   x4, y4 = Q
#   # BQ = ([4,0]) + L2([-2.56,1.92])
#   # L2 = ((x1-x3)/(x4-x3))
#L2 =( (3 - 4)/(1.44 - 4) )
#print('Scalar L2 is')
#print(L2)
#
## to calculate the point of intersection of AP & BQ which is the orthocenter of the triangle ie      point X
#n = np.array(([-2.56,1.92]))   # n=(Q-B) 
#X = B + (L2*(n))
#print('The orthocenter of the given triangle is')
#print(X)




# 2nd METHOD
A= np.array(([3,4]))
B= np.array(([4,0]))

m1 = np.array(([3,4]))    # Normal vector for BQ
m2 = np.array(([4,0]))    # Normal vector for AP

c1=m1@B
c2=m2@A

X1 = np.block([[m1],[m2]])
X1_inverse = np.linalg.inv(X1)
X2 = np.block([[c1],[c2]])
x = (X1_inverse) @ (X2)

print('The orthocenter of the given triangle is')
print(x)




# To plot the figure

def line_gen(A,B):
    len =10
    dim = A.shape[0]
    x_AB = np.zeros((dim,len))
    lam_1 = np.linspace(0,1,len)
    for i in range(len):
      temp1 = A + lam_1[i]*(B-A)
      x_AB[:,i]= temp1.T
    return x_AB

A = np.array(([ 3,4]))
B = np.array(([ 4,0]))
O = np.array(([ 0,0]))
P = np.array(([ 3,0]))
Q = np.array(([ 1.44,1.92]))
X = np.array(([3,0.75]))

x_AB = line_gen(A,B)
x_BO = line_gen(B,O)
x_OA = line_gen(O,A)
x_AP = line_gen(A,P)
x_BQ = line_gen(B,Q)
 

#Plotting all lines
plt.plot(x_AB[0,:],x_AB[1,:],color='black')
plt.plot(x_BO[0,:],x_BO[1,:],color='black')
plt.plot(x_OA[0,:],x_OA[1,:],color='black')
plt.plot(x_AP[0,:],x_AP[1,:],label='$AP$',linestyle="--")
plt.plot(x_BQ[0,:],x_BQ[1,:],label='$BQ$',linestyle="--")

 
#Labeling the coordinates
tri_coords = np.block([[A],[B],[O],[P],[Q],[X]]).T
plt.scatter(tri_coords[0,:], tri_coords[1,:])
vert_labels = ['A','B','O','P','Q','X(3,0.75)']
for i, txt in enumerate(vert_labels):
     plt.annotate(txt, # this is the text
                  (tri_coords[0,i], tri_coords[1,i]), # this is the point to label
                  textcoords="offset points", # how to position the text
                  xytext=(0,5), # distance from text to points (x,y)
                  ha='center') # horizontal alignment can be left, right or center
 

plt.xlabel('$ X $')
plt.ylabel('$ Y $')
plt.legend(loc='best')
plt.grid() # minor
plt.axis('equal')
plt.title('Orthocenter of Triangle')

#if using termux
plt.savefig('/sdcard/nikhil/matrix/fig.pdf')
#subprocess.run(shlex.split("termux-open /sdcard/nikhil/matrix/fig.pdf"))
#plt.show()
