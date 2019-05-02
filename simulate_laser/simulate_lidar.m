close all;
clear all;
% the robot has 3 values: x,y,phi
%rob = [ 1.5 1.5 -90 ];
%rob = [ 1.5 1.5 0 ];
rob = [ 3 1 -180 ];

figure(1)
hold on
the_map = map();
plot(rob(1), rob(2),'ro','LineWidth',2);
plot([rob(1) rob(1)+cos(rob(3)/180*pi) ], [rob(2) rob(2)+sin(rob(3)/180*pi)]);

plt_values = virt_lidar_plot(rob,the_map);

figure(2)
plot(plt_values(1,:),plt_values(2,:));
