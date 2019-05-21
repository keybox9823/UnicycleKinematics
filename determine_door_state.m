function determine_door_state(lidar_plot)
    
    opened_threshold = 55;
    closed_threshold = 8; 
    
    plot(lidar_plot);
    nzeros = (426-256+1) - nnz(lidar_plot(256:426)); %number of zeros in lidar scan between -30º and 30º
    
    if (nzeros<=closed_threshold)
        disp('PORTA FECHADA');
    elseif (nzeros>=opened_threshold)
        disp('PORTA ABERTA');
    else
        disp('PORTA ENTREABERTA');
    end
    
    %fechada=0
    %30º = 14
    %45º = 38
    %60º = 50
    %aberta=66
    
    % x = linspace(-2.0944,2.0944,682);
    % scatter(scan.*sin(x),scan.*cos(x)); 
    
end









