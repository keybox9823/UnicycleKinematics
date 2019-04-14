function [plot_values] = virt_lidar_plot(rob, map)

    max_range = 5;

    function dist = measure_dist(A,B,C,D)
        P = intersect_lines(A,B,C,D);
        if isempty(P)
            dist = max_range+1;
            return
        end
        er=1e-5;
        cond1 = min(A(1),B(1))-er<=P(1) && P(1)<=max(A(1),B(1))+er;
        cond2 = min(A(2),B(2))-er<=P(2) && P(2)<=max(A(1),B(2))+er;
        cond3 = min(C(1),D(1))-er<=P(1) && P(1)<=max(C(1),D(1))+er;
        cond4 = min(C(2),D(2))-er<=P(2) && P(2)<=max(C(1),D(2))+er;
        
        if cond1 && cond2 && cond3 && cond4
            dist = norm(P-A);
        else
            dist = max_range+1;
        end
    end

    A = rob(1:2);
    phi = rob(3);
    
    ang_domain = -100:100;
    dist_values = zeros(size(ang_domain));
    for j = 1:length(ang_domain)
        ang = ang_domain(j);
        rad_ang = (phi + ang) / 180 * pi;
        B = A + max_range*[ cos(rad_ang) sin(rad_ang) ];
        min_dist = max_range+1;
        for line = 1:size(map,1)
            C = map(line,1:2);
            D = map(line,3:4);
            cur_dist = measure_dist(A,B,C,D);
            if cur_dist < min_dist
                min_dist = cur_dist;
            end
        end
        if min_dist < max_range
            dist_values(j) = min_dist;
        else
            dist_values(j) = 0;
        end
    end
    
    %plot(ang_domain,dist_values);

    plot_values = [ ang_domain;dist_values];
end