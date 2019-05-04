function [v,w,new_cur_ref] = decide_speeds(cur_ref, references, states_list, true_point )

    maxRadius = 0.1; % in meters
    K1 = 100;
    K2 = 0;
    K3 = 100;
    maxVelocity = 0.3;

    %disp("norma");
    disp(norm(true_point(1:2) - references(cur_ref,:)));
    if norm(true_point(1:2) - references(cur_ref,:)) < maxRadius
        cur_ref = cur_ref + 1;
    end
    
    [v, w] = positionTracking(true_point(3),maxVelocity,references(cur_ref,:), true_point, K1,K2,K3);
    new_cur_ref = cur_ref;

end
