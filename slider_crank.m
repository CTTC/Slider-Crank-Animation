function [theta2,s3,omega2,v3,alpha2,a3]=slider_crank(theta1,...
    omega1,alpha1,l1,l2,e)
% Compute the displacement of the slider 3 and angular displacement of link 2
theta2=asin((e-l1*sin(theta1))/l2);
s3=l1*cos(theta1)+l2*cos(theta2);
% Compute the angular velocity of link 2 and velocity of slider 3
A=[l2*sin(theta2) 1;-l2*cos(theta2) 0];
B=[-l1*sin(theta1);l1*cos(theta1)];
omega=A\(omega1*B);
omega2=omega(1);
v3=omega(2);
% Compute angular acceleration of link 2 and acceleration of slider 3
At=[omega2*l2*cos(theta2) 0;omega2*l2*sin(theta2) 0];
Bt=[-omega1*l1*cos(theta1);-omega1*l1*sin(theta1)];
alpha=A\(-At*omega+alpha1*B+omega1*Bt);
alpha2=alpha(1);
a3=alpha(2);
end

