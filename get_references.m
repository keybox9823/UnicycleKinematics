function [references,states_list] = get_references()

references = [
    0.825       0
    0.825       6
    0.825       12
];

states_list = [
    states.state0; states.detect_door; states.detect_door
];

end