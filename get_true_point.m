function [true_point] = get_true_point(odometry_point,lidar_plot,cur_ref )
% this function will take the points and the lidar plot to discover and
% correct the position of the robot

    global initial_true_point correct_position_bool use_lidar
    
    %global delta_x delta_y delta_theta
    
    global delta_x_acc delta_y_acc delta_theta_acc
    %global delta_x delta_y
    global references
    
    first_ang = initial_true_point(3);
    true_point = initial_true_point(1:2).' + [ cos(first_ang) -sin(first_ang) ; sin(first_ang) cos(first_ang) ] * (odometry_point(1:2).' + [delta_x_acc; delta_y_acc]);
   %% true_point(3) = wrapToPi(first_ang + odometry_point(3) + delta_theta_acc);
    true_point(3) = wrapToPi(first_ang + odometry_point(3));
    true_point = true_point.';

    if correct_position_bool && use_lidar
%         disp('true point before correction')
%         disp(true_point)
%         disp('angle in degrees');
%         disp(true_point(3)/pi*180);
        [true_point] = correct_position(lidar_plot, true_point, odometry_point, first_ang);
        [v, w] = positionTracking(true_point(3),0.25,references(cur_ref+1,:), true_point, 80,0,80*pi/180);
%         v
%         w
%         true_point
%         references(cur_ref+1,:)
        %pause;
%         disp('true_point after correction');
%         disp(true_point)
%         disp(true_point(3)/pi*180);
    end
    
    correct_position_bool = false;
    
end
