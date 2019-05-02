function [rho1, theta1, rho2, theta2, rho3, theta3] = hough_transform(points)
% point are stacked horizontally, i.e. the first line is for x, the second
% for y

    max_rho = 7000;

    theta_domain = linspace(0, pi, 180);
    
    hough_space = zeros(length(theta_domain), max_rho);

    for p = points
        for idx = 1:length(theta_domain)
            theta = theta_domain(idx);
            rho = round(p(1) * sin(theta) + p(2) * cos(theta)) + max_rho/2;
            if rho >= max_rho
                continue;
            end
            hough_space(idx, rho) = hough_space(idx, rho) + 1;
        end
    end
    
end