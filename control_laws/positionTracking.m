function [linearVelocity, angularVelocity] = positionTracking(theta,maxVelocity,reference, position, K1,K2,K3)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% K1, K3 > 0 


xValue = reference(1) - position(1);
yValue = reference(2) - position(2);

error = sqrt(yValue*yValue + xValue*xValue);

phi = atan2(yValue,xValue);
alpha = rem(phi - theta + 4*pi,2*pi);
if alpha > pi
    alpha = alpha - 2*pi;
end

linearVelocity = maxVelocity*tanh(K1*error);
if alpha ~= 0
    angularVelocity = maxVelocity*((1+K2*phi/alpha)*tanh(K1*error)*sin(alpha)/error + K3*tanh(alpha));
else
    angularVelocity = maxVelocity*K2*phi*tanh(K1*error)/error;
end

end

