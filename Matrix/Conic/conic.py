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

#defining function
def f(theta):
 return (a*b)/np.sin(2*theta);
 
#defining derivative of f(theta)
df=lambda theta:-2*a*b*(np.cos(2*theta)/(np.sin(2*theta))**2);

#minimum area using gradient descent
cur_x=1
previous_step_size=1
iters=0
precision=0.000000001
alpha=0.0001
max_iters=100000000

while (previous_step_size>precision)&(iters<max_iters):
 prev_x=cur_x
 cur_x-=alpha*df(prev_x)
 previous_step_size=abs(cur_x-prev_x)
 iters+=1
min_val=f(cur_x)
print('minimum area of triangle is',min_val,"at","Theta  =",cur_x*(180/math.pi), 'degrees')




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
V=np.block([[b**2,0],[0,a**2]])


# use set_position
ax = plt.gca()
ax.spines['top'].set_color('none')                
ax.spines['left'].set_position('zero')
ax.spines['right'].set_color('none') 
ax.spines['bottom'].set_position('zero')


#Plotting the ellipse
plt.plot(elli[0,:],elli[1,:],'green',label='Ellipse')

#plotting the tangent
C=(a*b)**2
A=V@Q
e1=np.array(([1,0]))
e2=np.array(([0,1]))

r = C/(A@e1)
R = r*e1
p = C/(A@e2)
P = p*e2

plt.axline(R,P, color='red',label='Tangent')


#shading the area
plt.fill_between(R,P,0,color='orange', alpha=0.5)


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
#plt.savefig('/sdcard/nikhil/matrix/conic/fig2.pdf')
#subprocess.run(shlex.split("termux-open /sdcard/nikhil/matrix/conic/fig2.pdf"))
#plt.show()

