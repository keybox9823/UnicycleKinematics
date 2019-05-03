addpath("matlab_pioneer");

[references,states_list] = get_references();
cur_ref = 1;

v = 0;
w = 0;

% we keep track of the point given by the odometry and our estimated one
odometry_point  =  [ 0 0 0 ];
true_point = [ references(1,1) references(1,2) pi/2 ];

delay = 0.1; % 100 ms
t = timer('TimerFcn','semaphore=1','StartDelay',delay,'ExecutionMode','fixedDelay');
start(t);


while true
   
    %%% get sensor values and store old ones
    old_odometry_point = odometry_point;
    odometry_point = read_odometry();
    lidar_plot = get_lidar_plot();
    
    %%% compute point in alternative coordinate system
    % the following method will transform odometry points into points in
    % our coordinate system plus take the lidar plot to correct position
    old_true_point = true_point;
    true_point = get_true_point(odometry_point, old_odometry_point, old_true_point, lidar_plot);
    
    %%% compute what speeds to send
    % deciding what speeds to put on the robot will depend on the state and
    % the 'map'
    [v,w,cur_ref] = decide_speeds(cur_ref, references, states_list, true_point );
    
    %%% send commands to the robot
    if semaphore == 1
        send_pioneer_comands(v,w);
        semaphore=0;
    end
    
end

stop(t);
disp('reached the end');