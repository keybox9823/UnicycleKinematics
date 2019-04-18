% In this file we simulate a position following algorithm

hold on;

% pchip
% spline
% cscvn <- perfect! but cannot be used because we don't have access to the
%   toolbox :(
% solution: use pchip or spline to iterate over x and y seperatly (t as an
%   arguments

% define beacons
beacons = [ 0 10 10 0 0; 0 0 10 10 0 ];



plot(beacons,'ro','LineWidth',2);