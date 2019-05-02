addpath("matlab_pioneer");

states = get_states();
state = 1;

while true
    pause(0.01);
    
    %cur_point = read_odometer();
    cur_point = simulate_read_odometer();
    cur_lidar_plot = get_lidar_plot();
    [v,w,aux_point, state] = decide_speeds(trajectory, cur_point, cur_lidar_plot, state);
    send_pioneer_comands(v,w);
    
end

disp('reached the end');