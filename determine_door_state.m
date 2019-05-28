function determine_door_state(lidar_plot)
    
    count = 0;
    opened_threshold = 87;
    closed_threshold = 12; 
    
    %plot(lidar_plot);
    nzeros = (426-256+1) - nnz(lidar_plot(256:426)); %number of zeros in lidar scan between -30º and 30º
    for i=256:426
        if lidar_plot(i)>1.5
            count = count + 1;
        end
    end
    meas = nzeros + count
    
    if (meas<=closed_threshold)
        [data,Fs] = audioread('knockknock.mp3');
        disp('PORTA FECHADA');
    elseif (meas>=opened_threshold)
        [data,Fs] = audioread('aberta.mp3');
        disp('PORTA ABERTA');
    else
        [data,Fs] = audioread('entreaberta.mp3');
        disp('PORTA ENTREABERTA');
    end
    
    soundsc(data,Fs);
    
    %fechada=0
    %30º = 14
    %45º = 38
    %60º = 50
    %aberta=66
    
    % x = linspace(-2.0944,2.0944,682);
    % scatter(scan.*sin(x),scan.*cos(x)); 
    
end









