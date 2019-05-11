addpath("matlab_pioneer");
addpath("lidar");

addpath("control_laws");

sp = serial_port_start('COM5');
lidar = SetupLidar('COM14');
pioneer_init(sp);
pause(2);

global references states_list
[references,states_list] = get_references();
cur_ref = 1;

v = 0; cur_v = 0; w = 0; cur_w = 0;

% we keep track of the point given by the odometry and our estimated one
initial_true_point = [ references(1,1) references(1,2) pi/2 ];
true_point = initial_true_point;

delay = 0.1; % 100 ms
global semaphore;

t = timer('TimerFcn','set_semaphore()','StartDelay',delay,'ExecutionMode','fixedDelay');
start(t);
i=0;

global get_lidar_plot_bool
get_lidar_plot_bool = false;
detect_door_bool = false;

while true
    i = 1;
    %%% get sensor values and store old ones
    odometry_point = read_odometry();
    
    if get_lidar_plot_bool
        lidar_plot = get_lidar_plot(lidar);
    else
        lidar_plot = false;
    end
        
    if detect_door_bool
        detect_door();
        detect_door_bool = false;
    end
    
    %%% compute point in alternative coordinate system
    % the following method will transform odometry points into points in
    % our coordinate system plus take the lidar plot to correct position
    true_point = get_true_point(initial_true_point, odometry_point, lidar_plot);
    
    %%% compute what speeds to send
    % deciding what speeds to put on the robot will depend on the state and
    % the 'map'

    [v,w,cur_ref] = decide_speeds(cur_v, cur_w, cur_ref, true_point, get_lidar_plot_bool );
    
    %%% send commands to the robot
    if semaphore == 1
        send_pioneer_comands(sp,v,w);
        cur_v = v; cur_w = w;
        semaphore=0;
    end
    
end

stop(t);
disp('reached the end');
pioneer_close(sp);