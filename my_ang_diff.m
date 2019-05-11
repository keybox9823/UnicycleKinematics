function [diff] = my_ang_diff(second,first)
% takes angles between -pi and pi and returns an angle between -pi and pi
% i. e. the smallest angle between them

    first = rem(first+4*pi, 2*pi);
    second = rem(second+4*pi, 2*pi);
    if first > pi
        first = first-2*pi;
    end
    if second > pi
        second = second-2*pi;
    end

    diff = second - first;
    if diff > pi
        diff = diff - 2*pi;
    elseif diff < -pi
        diff = diff + 2*pi;
    end
    
end