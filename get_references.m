function [references,states_list] = get_references()

references = [
    0.825       0
    0.825       3
    0.825       3
    0.825       6
    0.825       6
    0.825       9
    0.825       9
    0.825       15
    0.825       15
    15          15
    15          15
    15          0.825
    15          0.825
    0.825       0.825
    0.825       0.825
    0.825       0.825
    
    
    
    
   
];

states_list = [
    states.state0 
    states.follow_trajectory 
    states.door_left 
    states.follow_trajectory
    states.door_left
    states.follow_trajectory 
    states.door_left
    states.follow_trajectory
    states.turn_right
    states.follow_trajectory
    states.turn_right
    states.follow_trajectory
    states.turn_right
    states.follow_trajectory
    states.turn_left
    states.stop
    
    
];

end