function [v,w,new_cur_ref] = decide_speeds(cur_ref, references, states_list, true_point )

    maxRadius = 0.05; % in meters
    K1 = 1;
    K2 = 0;
    K3 = 1;
    maxVelocity = 0.35;

    if norm(true_point(1:2) - references(cur_ref)) < maxRadius
        cur_ref = cur_ref + 1;
    end
    
    [v, w] = positionTracking(true_point(3),maxVelocity,references(cur_ref), true_point, K1,K2,K3);

    new_cur_ref = cur_ref;

end
