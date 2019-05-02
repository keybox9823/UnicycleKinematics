function [ v, w ] = linear_control( position, reference)

K1 = 2;
K2 = 4;
K3 = 2;

vref = 100;

error = reference - position;

v = -K1 * error(1);
w = -K2 * sign(vref) * error(2) - K3 * error(3); 


end