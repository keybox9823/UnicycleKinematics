function [actual_point] = read_odometer()

read_point = pioneer_read_odometry();
actual_point = [-1,15,0] + read_point;

end


