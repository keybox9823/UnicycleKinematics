function [odometry_point] = read_odometry()

returned = pioneer_read_odometry();
odometry_point(1:2) = returned(1:2)/1000;
odometry_point(3) = wrapToPi(returned(3) * 2*pi / 4096);

end