clearvars -except lidar
clc

global lidar

addpath("matlab_pioneer");
addpath("lidar");

addpath("control_laws");
sp = serial_port_start('COM5');

if isempty(lidar)
    lidar = SetupLidar('COM14');
end

pioneer_init(sp);
pause(2);

global references states_list
[references,states_list] = get_references();
cur_ref = 1;

v = 0; cur_v = 0; w = 0; cur_w = 0;

% we keep track of the point given by the odometry and our estimated one
global initial_true_point
initial_true_point = [ references(1,1) references(1,2) pi/2 ];

true_point = initial_true_point;

delay = 0.1; % 100 ms
global semaphore;

t = timer('TimerFcn','set_semaphore()','StartDelay',delay,'ExecutionMode','fixedDelay');
start(t);
i=0;

global get_lidar_plot_bool
get_lidar_plot_bool = false;

global correct_position_bool
correct_position_bool = false;

global determine_door_state_bool
determine_door_state_bool = false;

global delta_x delta_y delta_theta
delta_x = 0;
delta_y = 0;
delta_theta = 0;

detect_door_bool = false;

global odometry_points true_points

i = 0;
while true
    pause(0.001);
    i = i+1;
    %%% get sensor values and store old ones
    odometry_point = read_odometry();
    
    if get_lidar_plot_bool
        lidar_plot = get_lidar_plot();
        get_lidar_plot_bool = false;
        did_plot(i) = 1;
    else
        lidar_plot = 0;
    end
        
    if determine_door_state_bool
        determine_door_state(lidar_plot);
        detect_door_state_bool = false;
    end
    
    %%% compute point in alternative coordinate system
    % the following method will transform odometry points into points in
    % our coordinate system plus take the lidar plot to correct position
    true_point = get_true_point(odometry_point, lidar_plot);
    
    %%% compute what speeds to send
    % deciding what speeds to put on the robot will depend on the state and
    % the 'map'

    [v,w,cur_ref] = decide_speeds(cur_v, cur_w, cur_ref, true_point, sp );
    
    %%% send commands to the robot
    if semaphore == 1
        send_pioneer_comands(sp,v,w);
        cur_v = v; cur_w = w;
        semaphore=0;
    end
    
    true_points(round(i/100+1), :) = true_point;
    odometry_points(round(i/100+1), :) = odometry_point;
    
end

stop(t);
disp('reached the end');
pioneer_close(sp);