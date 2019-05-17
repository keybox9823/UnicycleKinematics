function [references,states_list] = get_references()

x=0;
y=0;

references = [           
    -2.64       -2.97 %init point  
    0.66        -2.97 %follow
    x           y    %turn left
    0.66        4.04 %follow
    x           y    % door left
    0.66        7.05   %follow
    x           y    % door left
    0.66        8.70 %follow
    x           y    %door right
    
%     0.825       0
%     0.825       3
%     0.825       3
%     0.825       6
%     0.825       6
%     0.825       9
%     0.825       9
%     0.825       15
%     0.825       15
%     15          15
%     15          15
%     15          0.825
%     15          0.825
%     0.825       0.825
%     0.825       0.825
%     0.825       0.825
    
    
    
    
   
];

states_list = [
    states.state0    
    states.follow_trajectory
    states.turn_left
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.door_right
    
    
    
%     states.door_left 
%     states.follow_trajectory
%     states.door_left
%     states.follow_trajectory 
%     states.door_left
%     states.follow_trajectory
%     states.turn_right
%     states.follow_trajectory
%     states.turn_right
%     states.follow_trajectory
%     states.turn_right
%     states.follow_trajectory
%     states.turn_left
%     states.stop
    
    
];

end