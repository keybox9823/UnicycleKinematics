function [diff] = my_ang_diff(second,first)
% takes angles between -pi and pi and returns an angle between -pi and pi
% i. e. the smallest angle between them

    first = wrapTo2Pi(first);
    second = wrapTo2Pi(second);
    diff = wrapToPi(second-first);
    
end