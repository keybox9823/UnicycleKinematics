function [references,states_list] = get_references()

x=0;
y=0;

references = [           
    -2.64       -2.97 %init point  
    0.66        -2.97 %follow
    x           y    %turn left
    0.66        2    %first correction point
    x           y    %correction
    0.66        4.04 %follow
    x           y    % door left (1st door)
    0.66        5.24 %second correction point
    x           y    %correction
    0.66        7.05   %follow
    x           y    % door left (2nd door)
    0.66        8.70 %follow
    x           y    %door right (3rd door)
    0.66        8.25 %third correction point
    x           y    %correction
    0.66        10.05 %follow
    x           y    % door left (4th door)
    0.66        11.25 %fourth correction point
    x           y    %correction
    0.66        13.05 %follow
    x           y     %door left(5th door)
    x           y     %stop
    
   
];

states_list = [
    states.state0    
    states.follow_trajectory
    states.turn_left
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory    
    states.door_left
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory    
    states.door_left
    states.follow_trajectory
    states.door_right
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.stop
    
];

end