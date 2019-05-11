function lidar = SetupLidar(com)
    lidar=serial(com,'baudrate',115200);
    set(lidar,'Timeout',0.1);   
    set(lidar,'InputBufferSize',40000);
    set(lidar,'Terminator','CR');
    
    fopen(lidar);
    pause(0.1);
    fprintf(lidar,'SCIP2.0');
    pause(0.1);
    fscanf(lidar);
    fprintf(lidar,'VV');
    pause(0.1);
    fscanf(lidar);
    fprintf(lidar,'BM');
    pause(0.1);
    fscanf(lidar); 
end