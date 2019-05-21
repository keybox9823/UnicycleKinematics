function determine_door_state(lidar_plot)
    
    opened_threshold = 55;
    closed_threshold = 8; 
    
    plot(lidar_plot);
    nzeros = (426-256+1) - nnz(lidar_plot(256:426)); %number of zeros in lidar scan between -30� and 30�
    
    if (nzeros<=closed_threshold)
        disp('PORTA FECHADA');
    elseif (nzeros>=opened_threshold)
        disp('PORTA ABERTA');
    else
        disp('PORTA ENTREABERTA');
    end
    
    %fechada=0
    %30� = 14
    %45� = 38
    %60� = 50
    %aberta=66
    
    % x = linspace(-2.0944,2.0944,682);
    % scatter(scan.*sin(x),scan.*cos(x)); 
    
end









