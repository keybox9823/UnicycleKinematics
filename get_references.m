function [references,states_list] = get_references()

x=0;
y=0;

%0.66
references = [           
%     -2.64       -2.97 %init point  
%     0.66        -2.97 %follow
%     x           y    %turn left
    0.50        0       pi/2
    0.50        2       pi/2    %first correction point
    x           y       pi/2    %correction
    0.50        4.04    pi/2 %follow
    x           y       pi/2 % door left (1st door)
    0.50        5.24    pi/2 %second correction point
    x           y       pi/2 %correction
    0.50        7.05    pi/2 %follow
    x           y       pi/2 % door left (2nd door)
    0.50        8.70    pi/2 %follow
    x           y       pi/2 %door right (3rd door)
    0.50        10.05   pi/2 %follow
    x           y       pi/2 % door left (4th door)
    0.50        11.25   pi/2  %fourth correction point
    x           y       pi/2  %correction
    0.50        13.05   pi/2 %follow
    x           y       pi/2 %door left(5th door)
    x           y       pi/2 %stop
    
   
];

states_list = [
%     states.state0    
%     states.follow_trajectory
%     states.turn_left

    states.state0
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
    states.door_left
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.stop
    
];

end