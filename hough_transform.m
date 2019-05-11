function [rho1, theta1, rho2, theta2] = hough_transform(points)
% point are stacked horizontally, i.e. the first line is for x, the second
% for y

    function [row,column] = max_matrix(A)
        [y,~] = max(A);
        [~,column] = max(y);
        [~,row] = max(A(:,column));
    end

    max_rho = 4000;

    theta_domain = linspace(0, pi, 181);
    
    hough_space_left =  zeros(length(theta_domain), max_rho);
    hough_space_right = zeros(length(theta_domain), max_rho);
    

    for p = points(:,1:342)
        for idx = 1:length(theta_domain)
            theta = theta_domain(idx);
            rho = round(p(1) * sin(theta) + p(2) * cos(theta)) + max_rho/2;
            if rho >= max_rho
                continue;
            end
            hough_space_left(idx, rho) = hough_space_left(idx, rho) + 1;
        end
    end
    
    for p = points(:,343:682)
        for idx = 1:length(theta_domain)
            theta = theta_domain(idx);
            rho = round(p(1) * sin(theta) + p(2) * cos(theta)) + max_rho/2;
            if rho >= max_rho
                continue;
            end
            hough_space_right(idx, rho) = hough_space_right(idx, rho) + 1;
        end
    end    
    
    [idx,rho1] = max_matrix(hough_space_left);
    theta1 = theta_domain(idx);
    [idx,rho2] = max_matrix(hough_space_left);
    theta2 = theta_domain(idx);
    
end