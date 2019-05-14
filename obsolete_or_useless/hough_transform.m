function [rho, theta] = hough_transform(points)
% point are stacked horizontally, i.e. the first line is for x, the second
% for y

    theta_resolution = 5; % in degrees
    rho_resolution = 100; % in millimeters

    function [row,column] = max_matrix(A)
    % returns the row and column of the maximum element of A
        [y,~] = max(A);
        [~,column] = max(y);
        [~,row] = max(A(:,column));
    end

    max_rho = 4000;
    points_in_mm = 1000* points;

    theta_domain = linspace(0, pi, 180/theta_resolution);
    
    hough_space=  zeros(length(theta_domain), max_rho/rho_resolution);
    

    for p = points_in_mm
        for idx = 1:length(theta_domain)
            theta = theta_domain(idx);
            if (norm(p) < 10)
                continue;
            end
            rho = round((p(1) * sin(theta) + p(2) * cos(theta) + max_rho)/rho_resolution);
            if rho >= max_rho / rho_resolution
                continue;
            end
            hough_space(idx, rho) = hough_space(idx, rho) + 1;
        end
    end
       
    [idx,rho] = max_matrix(hough_space);
    rho = rho/1000;
    theta = theta_domain(idx);
    
    rho = rho*rho_resolution;
    theta = theta*theta_resolution;
    
end