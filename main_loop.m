clearvars -except lidar
clc


global lidar

global use_lidar
use_lidar = true;

addpath("matlab_pioneer");
addpath("lidar");

addpath("control_laws");
sp = serial_port_start('COM5');

if use_lidar && isempty(lidar)
    lidar = SetupLidar('COM14');
end

pioneer_init(sp);
pause(0.5); %mudei pause

global references states_list
[references,states_list] = get_references();
cur_ref = 1;

v = 0; cur_v = 0; w = 0; cur_w = 0;

% we keep track of the point given by the odometry and our estimated one
global initial_true_point
initial_true_point = [ references(1,1) references(1,2) references(1,3) ];

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

global delta_x_acc delta_y_acc delta_theta_acc
delta_x_acc = 0;
delta_y_acc = 0;
delta_theta_acc = 0;


detect_door_bool = false;

global odometry_points true_points deltas

i = 0;
while true
    %%% get sensor values and store old ones
    odometry_point = read_odometry();
    
    if get_lidar_plot_bool && use_lidar
        lidar_plot = get_lidar_plot();
        get_lidar_plot_bool = false;
        did_plot(i) = 1;
    else
        lidar_plot = 0;
    end
        
    if determine_door_state_bool && use_lidar
        determine_door_state(lidar_plot);
        determine_door_state_bool = false;
    end
    
    %%% compute point in alternative coordinate system
    % the following method will transform odometry points into points in
    % our coordinate system plus take the lidar plot to correct position
    true_point = get_true_point(odometry_point, lidar_plot, cur_ref);
    
    %%% compute what speeds to send
    % deciding what speeds to put on the robot will depend on the state and
    % the 'map'

    [v,w,cur_ref] = decide_speeds(cur_v, cur_w, cur_ref, true_point, sp );
    
    %%% send commands to the robot
    if semaphore == 1
        i = i+1;
        odometry_points(i,:) = odometry_point;
        true_points(i, :) = true_point;
        deltas(i,:) = [ delta_x delta_y delta_theta ];

        send_pioneer_comands(sp,v,w);
        cur_v = v; cur_w = w;
        semaphore=0;
    end
    
    if states_list(cur_ref) == states.last_state
        break;
    end
    
    
 end

stop(t);
disp('reached the end');
pioneer_close(sp);