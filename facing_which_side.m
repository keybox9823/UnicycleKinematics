function [side, side_angle] =  facing_which_side( cur_angle )
    
    cur_angle = rem(cur_angle + 4*pi, 2*pi);
    if cur_angle > pi
        cur_angle = cur_angle-2*pi;
    end

    if ( (cur_angle <= pi/4) && (cur_angle >= -pi/4) )
        side = states.facing_right;
        side_angle = 0;
    elseif ( (cur_angle >= pi/4) && (cur_angle <= 3*pi/4) )
        side = states.facing_up;
        side_angle = pi/2;
    elseif ( (cur_angle <= -pi/4) && (cur_angle >= -3*pi/4) )
        side = states.facing_down;
        side_angle = pi;
    else
        side = states.facing_left;
        side_angle = - pi/2;
    end
    
end
    