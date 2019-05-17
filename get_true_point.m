function [true_point] = get_true_point(odometry_point, lidar_plot)
% this function will take the points and the lidar plot to discover and
% correct the position of the robot

    global initial_true_point correct_position_bool

    first_ang = initial_true_point(3);
    true_point = initial_true_point(1:2).' + [ cos(first_ang) -sin(first_ang) ; sin(first_ang) cos(first_ang) ] * odometry_point(1:2).' ;
    true_point(3,1) = wrapToPi(first_ang+odometry_point(3));
    true_point = true_point.';

    if correct_position_bool
        [true_point] = correct_position(lidar_plot, true_point, odometry_point);
    end
    correct_position_bool = false;
    

end
