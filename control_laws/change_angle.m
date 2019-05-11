function [angular_velocity] = change_angle(cur_angle, desired_angle)
    
    ang_diff = my_ang_diff(desired_angle, cur_angle);
    
    % for now, the controler for the angular velocity is just the sign of
    % the angle difference times a max angular velocity
    angular_velocity = sign(ang_diff) * pi/6;
    % with an angular velocity of pi/6 the maximum error angle is 3º

end