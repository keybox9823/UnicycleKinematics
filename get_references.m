function [references,states_list] = get_references()

x=0;
y=0;

%0.66
references = [           
%     -2.64       -2.97 %init point  
%     0.66        -2.97 %follow
%     x           y    %turn left
    0.50        0       pi/2
    0.50        1.75    pi/2    %first correction point
    x           y       pi/2    %correction
    0.50        3.94    pi/2 %follow
    x           y       pi/2 % door left (1st door)
    0.50        5.43    pi/2 %second correction point
    x           y       pi/2 %correction
    0.50        6.93    pi/2 %follow
    x           y       pi/2 % door left (2nd door)
    0.50        8.42    pi/2 %third correction point
    x           y       pi/2 %follow    
    0.50        9.92    pi/2 %follow
    x           y       pi/2 % door left (3th door)
    0.50        11.29   pi/2  %fourth correction point
    x           y       pi/2  %correction   
    0.50        12.66   pi/2 %follow
    x           y       pi/2 %door left(4th door)
    0.83        15.14   pi/2 %follow        
    x           y       pi/2 %door front
    x           y       pi/2 %turn right
    %end first corridor
    
    2.02        15.14   0 %follow
    x           y       0 %correct position
    3.06        15.14   0 %follow
    x           y       0 %door left(1st door)
    4.44        15.14   0 %follow
    x           y       0 %correct position
    5.82        15.14   0 %follow
    x           y       0 %door left(2nd door)
    8.16        15.14   0 %follow
    x           y       0 %correct position
    10.08       15.14   0 %follow
    x           y       0 %correct position
    12.59       15.14   0 %follow
    x           y       0 %door left(3rd door)
    13.78       15.14   0 %follow
    x           y       0 %correct position
    14.98       15.14   0 %follow
    x           y       0 %door left (4th door)
    15.15       15.14   0 %follow
    x           y       0 %turn right
    %end second corridor
    
    15.15       13.56   -pi/2 %follow
    x           y       -pi/2 %correct position
    15.15       11.98   -pi/2 %follow
    x           y       -pi/2 %correct position
    15.15       9.81    -pi/2 %follow
    x           y       -pi/2 %door left (1st door)
    15.15       8.15    -pi/2 %follow
    x           y       -pi/2 %correct position
    15.15       6.66    -pi/2 %follow
    x           y       -pi/2 %door left (2nd door)
    15.15       4.71    -pi/2 %follow
    x           y       -pi/2 %correct position
    15.15       2.61    -pi/2 %follow
    x           y       -pi/2 %door left (3rd door)
    15.15       0.84    -pi/2 %follow
    x           y       -pi/2 %turn_right
    %end third corridor
    
    %corrigir door front
    
    
    
    
    
   
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
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.door_forward
    states.turn_right
    %end first corridor
    
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.turn_right
    %end second corridor
    
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.turn_right
    %end third corridor 
    
    %correct door front
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
];

end