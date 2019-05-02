function [v,w] = decide_speeds(trajectory, cur_point, cur_lidar_plot, aux_point)
%previousDistance = norm(cur_point - trajectory(1:2,aux_point));
maxRadius = 500;
K1 = 1;
K2 = 1;
K3 = 1;
maxVelocity = 1000;


%{
for i = aux_point+1:size(trajectory)
    xValue = cur_point(1) - trajectory(1,i); 
    yValue = cur_point(2) - trajectory(2,i);
    distance = norm([xValue yValue]);
    if(distance < previousDistance)
        previousDistance = distance;
    elseif
        break;
    end
end
%}


while true
    xValue = cur_point(1) - trajectory(1,aux_point); 
    yValue = cur_point(2) - trajectory(2,aux_point);
    distance = norm([xValue yValue]);

    % TODO - check if last point
    if distance > maxRadius
        break;
    end
    
    aux_point = aux_point + 1;
end

[v,w] = positionTracking(cur_point(3),maxVelocity,trajectory(aux_point),cur_point(1:2),K1,K2,K3);


end





