%% defining initial conditions for euler angles 
clear 
clc
close all

% load("gyrodata.mat")

% load("angulardata.mat");
% 
% p = AngularVelocity.X;
% q = AngularVelocity.Y;
% r = AngularVelocity.Z;
% t =  AngularVelocity.Timestamp;

phi0 = 0;
theta0 = 0.0059;
psi0 = 0 ;

 % rotating vector from north east down frame to body frame  

c1v = [cos(phi0) sin(phi0) 0 ;
    -sin(phi0) cos(phi0) 0 ;
    0 0 1];

c21 = [ cos(theta0) 0 -sin(theta0) ;
    0 1 0 ;
    sin(theta0) 0 cos(theta0)];

cb2 = [1 0 0 ; 
    0 cos(psi0) sin(phi0);
    0 -sin(phi0) cos(phi0) ];

cbv0 = cb2 * c21 * c1v;
    
% t = ( 0:length(p)-1)';

% x = zeros(length(p),1);
% y = zeros(length(p),1);
% z = zeros(length(p),1);

% load simdata ;
% 
% x = simdata(:,[1,2]);
% y = simdata(:,[1,4]);
% z = simdata(:,[1,4]);
% 
% X = x(1:100,:);
% Y = y(1:100,:);
% Z = z(1:100,:);

% Calculating the euler angles using Quaternions 
% quaternions is 4/1 matrix with containa scalar part which has the info
% about the angle \theta ( here theta angle is when rotated can bring the
% object to body axis with individual rotation about x y z axis) 
% other three are vectors which represent the axis about which the rotation
% need to be made 

q0 = angle2quat(psi0,theta0,phi0);

% function to convert quaternion to angle 
% function phi = fcn(q) 
% 
% [ psi , theta , phi] = quat2angle(q'); % in simulink we q as colum vectior but for input in function we need it to be row vector 
% 
% phi = [phi,theta,psi];
% 
% end 

load simdata ;

x = simdata(:,[1,2]);
y = simdata(:,[1,3]);
z = simdata(:,[1,4]);

X = x(1:75,:);
Y = y(1:75,:);
Z = z(1:75,:);

%% finding Euler angles of new recorded data gyro sensor 
load('angular_velocity.mat');

p = AngularVelocity.X;
q = AngularVelocity.Y;
r = AngularVelocity.Z;
t = AngularVelocity.Timestamp;

p = smooth(p) ;
q = smooth(q) ;
r = smooth(r) ; 

t = linspace(0,100,331)';