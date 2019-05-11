function plt = get_lidar_plot(lidar)

    scan = LidarScan(lidar);
    
    % 10000 will be our choice for 
    scan(scan==0) = 10000;
    scan = scan / 1000;
    
    plt(1,:) = linspace(-2*pi/3,2*pi/3,682);
    plt(2,:) = fliplr(scan);
    

end
