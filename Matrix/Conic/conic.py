import numpy as np
import matplotlib.pyplot as plt
from numpy import linalg as LA
import math
import sys                                #for path to external scripts

#if using termux
import subprocess                                 
import shlex


# input parametrs
a=3
b=2
theta=math.pi/4


#Generating points on an ellipse
def ellipse_gen(a,b):
    theta = np.linspace(0,2*np.pi,100)
    x_ellipse = np.zeros((2,100))
    x_ellipse[0,:] = a*np.cos(theta)
    x_ellipse[1,:] = b*np.sin(theta)
    return x_ellipse


#Generating ellipse
elli = ellipse_gen(a,b)

#Tangent to the ellipse
q1= a*np.cos(theta)
q2= b*np.sin(theta)
Q=np.array(([q1,q2]))

X=np.arange(0,4.31,0.1)
Y=((a*b)**2 - ((b**2)*q1*X))/((a**2)*q2)


# use set_position
ax = plt.gca()
ax.spines['top'].set_color('none')                
ax.spines['left'].set_position('zero')
ax.spines['right'].set_color('none') 
ax.spines['bottom'].set_position('zero')


#Plotting the ellipse
plt.plot(elli[0,:],elli[1,:],'green',label='Ellipse')

#plotting the tangent
plt.plot(X,Y,'red',label='Tangent')

#shading the area
plt.fill_between(X,Y,0,color='orange', alpha=0.5)


P=np.array(([0,b/np.sin(theta)]))
R=np.array(([a/np.sin(theta),0]))
O=np.array(([0,0]))

#Labeling the coordinates
tri_coords = np.vstack((P,Q,R,O)).T
plt.scatter(tri_coords[0,:], tri_coords[1,:])
vert_labels = ['P','Q','R','O']
for i, txt in enumerate(vert_labels):
       plt.annotate(txt,					 # this is the text
                 (tri_coords[0,i], tri_coords[1,i]), # this is the point to label
                 textcoords="offset points", 		# how to position the text
                 xytext=(0,10),				 # distance from text to points (x,y)
                 ha='center') 			# horizontal alignment can be left, right or center

plt.xlabel('$ X $')
plt.ylabel('$ Y $')
plt.legend()
plt.grid(True) # minor
plt.axis('equal')
plt.title('Min. area of triangle formed by the tangent')
plt.savefig('/sdcard/nikhil/matrix/conic/fig.pdf')
subprocess.run(shlex.split("termux-open /sdcard/nikhil/matrix/conic/fig.pdf"))
#plt.show()

