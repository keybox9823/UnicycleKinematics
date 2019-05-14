function [odometry_point] = read_odometry()

returned = pioneer_read_odometry();
size(returned);

odometry_point(1:2) = returned(1:2)/1000;

real_angle = wrapToPi(returned(3) * 2*pi / 4096);
%{
real_angle = returned(3) * 2*pi / 4096;
if(real_angle > pi )
    real_angle = real_angle - 2*pi;
end
%}

odometry_point(3) = real_angle;

end