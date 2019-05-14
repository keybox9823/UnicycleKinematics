function [rho1, theta1, rho2, theta2] = apply_hough(polar_points)
% points are in polar form, i.e. theta for first line and rho for second

    [x,y] = pol2cart(polar_points(1,:),polar_points(2,:));
    
    points = vertcat(x,y);

    % points on the right
    [rho1, theta1] = hough_transform(points(:,1:342));
    % points on the left
    [rho2, theta2] = hough_transform(points(:,343:682));
    
end