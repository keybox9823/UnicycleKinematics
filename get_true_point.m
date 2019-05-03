function [true_point] = get_true_point(initial_true_point, odometry_point, lidar_plot)
% this function will take the points and the lidar plot to discover and
% correct the position of the robot

    true_point = initial_true_point + odometry_point;
    
    true_point(3) = rem(true_point(3)+4*pi,2*pi);
    if(true_point(3) > pi)
        true_point(3) = true_point(3) - 2*pi;
    end


end