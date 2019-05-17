function [v,w,cur_ref] = decide_speeds(cur_v,cur_w, cur_ref, true_point, sp )

    global references states_list get_lidar_plot_bool correct_position_bool initial_true_point delta_x delta_y

    maxRadius = 0.1; % in meters
    K1 = 70;
    K2 = 0;
    K3 = 40*pi/180;
    maxVelocity = 0.25;
    
    v=0;w=0;
    
    persistent cur_state
    if isempty(cur_state)
        cur_state = states_list(cur_ref);
    end
    
    persistent cur_substate
    if isempty(cur_substate)
        cur_substate = states.first_substate;
    end
    
    persistent next_substate
    
    persistent inc_ref
    if isempty(inc_ref)
        inc_ref = false;
    end
    
    persistent target_angle
    
    if cur_state == states.no_state
        cur_state = states_list(cur_ref);
    end
    
    % watch out for the next chais of 2 if's; they are not correct!
    %if (cur_substate == states.last_substate && cur_state == states.no_state)
    if inc_ref
        disp('inc_ref');
        cur_ref = cur_ref+1;
        cur_state = states_list(cur_ref);
        cur_substate = states.first_substate;
        inc_ref = false;
    end

    switch (cur_state)
        case states.state0
            disp('about to start');
            inc_ref = true;
            
        % go forward normally
        case states.follow_trajectory
            
            if norm(true_point(1:2) - references(cur_ref,:)) < maxRadius
                cur_state = states.stop;
                next_substate = states.last_substate;
            else
                [v, w] = positionTracking(true_point(3),maxVelocity,references(cur_ref,:), true_point, K1,K2,K3);
            end

        case states.door_left
            switch (cur_substate)
                case states.first_substate
                    cur_substate = states.turn_left;
                case states.turn_left
                    [~, target_angle] = facing_which_side(wrapToPi(true_point(3)+pi/2));
                    cur_state = states.turn;
                    next_substate = states.determine_door_state;
                case states.turn_right
                    [~, target_angle] = facing_which_side(wrapToPi(true_point(3)-pi/2));
                    cur_state = states.turn;
                    next_substate = states.last_substate;
                case states.determine_door_state
                    determine_door_state();
                    cur_substate = states.turn_right;
            end
            
        case states.door_right
            switch (cur_substate)
                case states.first_substate
                    cur_substate = states.turn_right;
                case states.turn_left
                    [~, target_angle] = facing_which_side(wrapToPi(true_point(3)+pi/2));
                    cur_state = states.turn;
                    next_substate = states.last_substate;
                case states.turn_right
                    [~, target_angle] = facing_which_side(wrapToPi(true_point(3)-pi/2));
                    cur_state = states.turn;
                    next_substate = states.determine_door_state;
                case states.determine_door_state 
                    determine_door_state();
                    %cur_substate = states.turn_right;
                    cur_substate = states.turn_left;
            end          
    
        case states.door_left_and_right
            
        case states.door_forward
            determine_door_state();
            inc_ref = true;
            
        case states.correct_position_state
            if false
                inc_ref = true;
                return
            end
            get_lidar_plot_bool = true;
            correct_position_bool = true;
            inc_ref = true;
            disp('Correction State');

            
        % basic turn states
        case states.turn_right
            [~, target_angle] = facing_which_side(wrapToPi(true_point(3)-pi/2));
            cur_state = states.turn;
            cur_substate = states.last_substate;
        case states.turn_left
            [~, target_angle] = facing_which_side(wrapToPi(true_point(3)+pi/2));
            cur_state = states.turn;
            next_substate = states.last_substate;            
            
        % works as a sort of auxilary state
        case states.turn
            
            pioneer_set_controls(sp, 0, 0);
            pause(0.3);
            pioneer_set_heading(sp, (target_angle - initial_true_point(3) )/pi*180);
            pause(2);
            cur_state = states.no_state;
            cur_substate = next_substate;
            if cur_substate == states.last_substate
                inc_ref = true;
            end
            
%             if ( abs(my_ang_diff( target_angle, true_point(3) )) > pi/60  )
%                 v = 0;
%                 w = change_angle(true_point(3),target_angle);
%             else
%                 disp('will stop');
%                 cur_state = states.stop;
%             end
            
            
        % requires its own state because the robot does not immediately stop
        case states.stop
            v=0; w=0;
            if ( cur_v==0 && cur_w==0 )
                cur_state = states.no_state;
                cur_substate = next_substate;
                if cur_substate == states.last_substate
                    true_point(3)
                    inc_ref = true;
                end
                    
            end

        % very last possible state
        case states.last_state
            disp('reached the end');
            return
                   
    end
    
end
