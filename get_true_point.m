function [true_point] = get_true_point(odometry_point, lidar_plot)
% this function will take the points and the lidar plot to discover and
% correct the position of the robot

    global initial_true_point correct_position_bool
    
    global delta_x delta_y delta_theta

    first_ang = initial_true_point(3);
    true_point = initial_true_point(1:2).' + [ cos(first_ang) -sin(first_ang) ; sin(first_ang) cos(first_ang) ] * (odometry_point(1:2).' + [delta_x; delta_y]);
    true_point(3) = wrapToPi(first_ang + odometry_point(3) + delta_theta);
    true_point = true_point.';

    if correct_position_bool
        disp('true point before correction');
        disp(true_point);
        [true_point] = correct_position(lidar_plot, true_point, odometry_point, first_ang);
        disp('true point after correction');
        disp(true_point);
    end
    
    correct_position_bool = false;
    
end
