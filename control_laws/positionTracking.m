function [linearVelocity, angularVelocity] = positionTracking(theta,maxVelocity,reference, position, K1,K2,K3)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% K1, K3 > 0 


xValue = reference(1) - position(1);
yValue = reference(2) - position(2);

error = sqrt(yValue*yValue + xValue*xValue);

phi = atan2(yValue,xValue);
alpha = wrapToPi(phi - theta);


linearVelocity = maxVelocity*tanh(K1*error);
if alpha ~= 0
    angularVelocity = maxVelocity*((1+K2*phi/alpha)*tanh(K1*error)*sin(alpha)/error + K3*tanh(alpha));
else
    angularVelocity = maxVelocity*K2*phi*tanh(K1*error)/error;
end

% K1 = 0.2;
% K2 = 0.2;
% K3 = 0.2;
% maxVelocity = 0.15;
% 
% werror = reference - position;
% error = [cos(position(3)),sin(position(3)),0;...
%         -sin(position(3)),cos(position(3)),0;...
%         0,0,1]*(werror.');
% u=[-K1*error(1);-K2*error(2)-K3*error(3)];
% linearVelocity = abs(u(1))+maxVelocity;
% angularVelocity=-u(2);

end

