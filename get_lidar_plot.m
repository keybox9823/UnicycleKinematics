function plt = get_lidar_plot(lidar)

    scan = LidarScan(lidar);
    
    % 10000 will be our choice for 
    scan(scan==0) = 7000;
    scan = scan / 1000;
    
    theta_resol = 1;
    
    
    plt(1,:) = linspace(-2*pi/3,2*pi/3,360/theta_resol);
    
    %plt(2,:) = fliplr(scan);
    plt(2,:) = scan;

end
