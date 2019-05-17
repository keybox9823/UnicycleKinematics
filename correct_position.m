function [true_point] = correct_position(lidar_plot, true_point, odometry_point, first_ang)

  
    global delta_x delta_y delta_theta

    % coordinates of the top right corner of the corridor, necessary to
    % correct position
    top_right_corner = [ 15 10 ];
    ang_threshold = 15/180*pi;
    dist_threshold = 0.4;
    
    [rho, theta] = get_rho_theta(lidar_plot);
    rho
    disp('theta');
    theta/pi*180

    corridor = find_corridor(true_point);
    
    switch(corridor)
        
        case states.corridor1

            true_angle_lidar = wrapToPi(theta + pi/2);
            
            if abs( wrapToPi(true_angle_lidar - true_point(3)) ) > ang_threshold 
                disp('NAO CORRIGIU - (ANGLE)');
                return
                
            end

            true_dist_lidar = rho;

            if abs( true_point(1) - true_dist_lidar ) > dist_threshold
                disp('NAO CORRIGIU - (DIST)');
                return
            end
            
            vec = [ cos(first_ang) -sin(first_ang) ; sin(first_ang) cos(first_ang) ]^-1 * [ true_dist_lidar - true_point(1)  ; 0];
            delta_x = delta_x + vec(1);
            delta_y = delta_y + vec(2);
            %delta_x = delta_x + ( true_point(1) - true_dist_lidar );
            
            delta_theta = wrapToPi(delta_theta + ( true_angle_lidar - true_point(3) ) );
            
            true_point(1) = true_dist_lidar;
            true_point(3) = true_angle_lidar;    
            disp('true_angle_lidar');
            disp(true_point(3));
            true_point(1)
                
        case states.corridor2
            
            true_angle_lidar = theta;
            
            if abs( wrapToPi(true_angle_lidar - true_point(3)) ) > ang_threshold 
                return
            end
            
            true_dist_lidar = top_right_corner(2) - rho;

            if abs( true_point(1) - true_dist_lidar ) > dist_threshold
                return
            end
            
            true_point(2) = true_dist_lidar;            
            true_point(3) = true_angle_lidar;
            
        case states.corridor3
            
            true_angle_lidar = theta - pi/2;
            
            if abs( wrapToPi(true_angle_lidar - true_point(3)) ) > ang_threshold 
                return
            end
            
            true_dist_lidar = top_right_corner(1) - rho;

            if abs( true_point(1) - true_dist_lidar ) > dist_threshold
                return
            end
            
            true_point(1) = true_dist_lidar;            
            true_point(3) = true_angle_lidar;

        case states.corridor4
            
             true_angle_lidar = theta - pi;
            
            if abs( wrapToPi(true_angle_lidar - true_point(3)) ) > ang_threshold 
                return
            end
            
            true_dist_lidar = top_right_corner(2) - rho;

            if abs( true_point(1) - true_dist_lidar ) > dist_threshold
                return
            end
            
            true_point(2) = true_dist_lidar;            
            true_point(3) = true_angle_lidar;

    end

    
    
%     first_ang = initial_true_point(3);
%     initial_true_point = true_point(1:2).' - [ cos(first_ang) -sin(first_ang) ; sin(first_ang) cos(first_ang) ] * odometry_point(1:2).' ;
%     initial_true_point(3) = wrapToPi(true_point(3) - odometry_point(3));
%     
%     initial_true_point = initial_true_point.';
    
    disp('DID A CORRECTION');

end