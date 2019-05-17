function [rho, theta] = get_rho_theta(lidar_plot)
    
    rho1 = lidar_plot( 654 );
    rho2 = lidar_plot( 540 );
    
    angle = 20 / 180 * pi;

    [rho, theta] = get_correction_parameters(rho1, rho2, angle);
    theta = -theta;
    
end