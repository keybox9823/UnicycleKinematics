function [corridor]  = find_corridor(true_point)

x = true_point(1);
y = true_point(2);


if x < 1.70
    corridor = states.corridor1;
    disp('CORRIDOR1');
elseif y > 14
    corridor = states.corridor2;
    disp('CORRIDOR2');
elseif x > 14
    corridor = states.corridor3;
    disp('CORRIDOR3');
else
    corridor = states.corridor4;
    disp('CORRIDOR4');
end