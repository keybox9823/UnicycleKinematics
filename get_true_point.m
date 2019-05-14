function [true_point] = get_true_point(initial_true_point, odometry_point, lidar_plot)
% this function will take the points and the lidar plot to discover and
% correct the position of the robot
    

    
    first_ang = initial_true_point(3);
    true_point = initial_true_point(1:2).' + [ cos(first_ang) -sin(first_ang) ; sin(first_ang) cos(first_ang) ] * odometry_point(1:2).' ;
    
    true_point(3,1) = wrapToPi(first_ang+odometry_point(3));
    %{
    true_point(3,1) = rem(first_ang+odometry_point(3)+4*pi,2*pi);
    if(true_point(3,1) > pi)
        true_point(3,1) = true_point(3,1) - 2*pi;
    end
    %}

    true_point = true_point.';

end