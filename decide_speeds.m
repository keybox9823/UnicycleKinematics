function [v,w,cur_ref] = decide_speeds(cur_v,cur_w, cur_ref, true_point )

    global references states_list get_lidar_plot_bool
    
    maxRadius = 0.1; % in meters
    K1 = 100;
    K2 = 0;
    K3 = 100;
    maxVelocity = 0.3;
    
    persistent cur_state
    if isempty(cur_state)
        cur_state = references(cur_ref);
    end
    
    persistent cur_substate
    if isempty(cur_substate)
        cur_substate = states.first_substate;
    end
    
    persistent target_angle
    
    % watch out for the next chais of 2 if's; it's correct!
    if cur_substate == states.last_substate
        cur_ref = cur_ref+1;
        cur_state = references(cur_ref);
        cur_substate = states.first_substate;
    end
    
    if cur_state == states.no_state
        cur_state = states_list(cur_ref);
    end
    
    switch (cur_state)
        % go forward normally
        case states.follow_trajectory
            if norm(true_point(1:2) - references(cur_ref,:)) < (maxVelocity+0.1)
                get_lidar_plot_bool = false;
            else
                get_lidar_plot_bool = true;
            end
                
            if norm(true_point(1:2) - references(cur_ref,:)) < maxRadius
                cur_state = states.stop;
            else
                [v, w] = positionTracking(true_point(3),maxVelocity,references(cur_ref,:), true_point, K1,K2,K3);
            end
        
        case states.door_left
            if (cur_substate == states.first_substate )
                cur_substate = states.turn_left;
            elseif (cur_substate == states.turn_left)
                [~, target_angle] = facing_which_side(true_point(3)+pi/2);
                cur_state = turn;
                cur_substate = states.determine_door_state;
            elseif ( cur_substate == states.turn_right)
                [~, target_angle] = facing_which_side(true_point(3)-pi/2);
                cur_state = turn;
                cur_substate = states.last_substate;
            elseif ( cur_substate == states.determine_door_state )
                determine_door_state();
                cur_substate = states.turn_right;
            end
            
        case states.door_right
            if (cur_substate == states.first_substate )
                cur_substate = states.turn_right;
            elseif (cur_substate == states.turn_left)
                [~, target_angle] = facing_which_side(true_point(3)+pi/2);
                cur_state = turn;
                cur_substate = states.last_substate;
            elseif ( cur_substate == states.turn_right)
                [~, target_angle] = facing_which_side(true_point(3)-pi/2);
                cur_state = turn;
                cur_substate = states.determine_door_state;
            elseif ( cur_substate == states.determine_door_state )
                determine_door_state();
                cur_substate = states.turn_right;
            end          
            
        case states.door_left_and_right
            
        case states.door_forward
            determine_door_state();
            cur_substate = states.last_substate;
            
        % basic turn states
        case states.turn_right
            [~, target_angle] = facing_which_side(true_point(3)-pi/2);
            cur_state = turn;
            cur_substate = states.last_substate;
        case states.turn_left
            [~, target_angle] = facing_which_side(true_point(3)+pi/2);
            cur_state = turn;
            cur_substate = states.last_substate;            
            
        % works as a sort of auxilary state
        case states.turn
            if ( abs(my_ang_diff( target_angle, true_point(3) ) > pi/15 ) )
                v=0;
                w = change_angle(target_angle,true_point(3));
            else
                cur_state = states.stop;
            end
            
        % requires its own state because the robot does not immediately stop
        case states.stop
            v=0; w=0;
            if ( cur_v==0 && cur_w==0 )
                cur_state = states.no_state;
            end
            
        % very last possible state
        case states.end
            disp('reached the end');
            return
    end
    
end
