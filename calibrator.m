clear all;

addpath("matlab_pioneer");

sp=serial_port_start();
pioneer_init(sp);

pause(2);

% make the robot move
tic
pioneer_set_controls(sp,400,0); % the values of v and w are in????

% make the robot stop when inter is clicked
a = input("enter to stop the robot");
duration = toc;
pioneer_set_controls(sp,0,0);
%serial_port_stop(sp);

% ask user for dx and dy
dx = input('What is the value of dx (forward distance in m)? ');
dy = input('What is the vlaue of dy (lateral disctance in cm)? ');
if isempty(dx) || isempty(dy)
    dx=1;
    dy=1;
end



% calculate and return the offset

w_offset = calculate_offset(dx,dy/100,duration);

disp('The offset for omega is ');
disp(w_offset);

