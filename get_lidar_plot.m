function plt = get_lidar_plot()

    global lidar
    scan = LidarScan(lidar);
    
    % 10000 will be our choice for 
    scan(scan==0) = 7000;
    scan = scan / 1000;
    plt(1,:) = scan;

end
