function [references,states_list] = get_references()

x=0;
y=0;

%0.66
references = [


    -2.64       -2.97   0%init point
    0.66        -2.97   0%follow
    x           y       0%turn left

    0.66        0       pi/2
    0.84        1.75    pi/2    %first correction point
    x           y       pi/2    %correction
    0.84        3.94    pi/2 %follow
    x           y       pi/2 % door left (1st door)
    0.84        5.43    pi/2 %second correction point
    x           y       pi/2 %correction
    0.84        6.93    pi/2 %follow
    x           y       pi/2 % door left (2nd door)
    0.84        8.37    pi/2 %follow
    x           y       pi/2 %door right
    x           y       pi/2 %third correction point
    0.84        9.92    pi/2 %follow
    x           y       pi/2 % door left (3th door)
    0.84        11.29   pi/2  %fourth correction point
    x           y       pi/2  %correction
    0.84        12.66   pi/2 %follow
    x           y       pi/2 %door left(4th door)
    0.84        13.75   pi/2 %follow
    x           y       pi/2
    1.14        15.14   pi/2 %follow
    x           y       pi/2 %door front
    x           y       pi/2 %turn right
    %end first corridor

    2.15        15.00   0 %follow
    x           y       0 %correct position
    3.16        15.00   0 %follow
    x           y       0 %door left(1st door)
    4.44        15.00   0 %follow
    x           y       0 %correct position
    6.00        15.00    0 %follow
    x           y       0 %door left(2nd door)
    7.2         15.00   0 %follow
    x           y       0 %correct position
    8.05        15.00   0 %follow
    x           y       0 %door right
    8.16        15.00   0 %follow
    x           y       0 %correct position
    10.08       15.00   0 %follow
    x           y       0 %correct position
    12.69       15.00   0 %follow
    x           y       0 %door left(3rd door)
    13.79       14.80   0 %follow
    x           y       0 %correct position
    14.98       14.80   0 %follow
    x           y       0 %door left (4th door)
    x           y       0 %turn right
    %end second corridor

    14.91       14.00   -pi/2 %follow
    x           y       -pi/2 %correct position
    14.91       13.00   -pi/2 %follow
    x           y       -pi/2 %correct position
    14.91       11.68   -pi/2 %follow
    x           y       -pi/2 %door right
    x           y       -pi/2 %correct position
    14.91       10.21    -pi/2 %follow
    x           y       -pi/2 %door left (1st door)
    14.91       8.61    -pi/2 %follow
    x           y       -pi/2 %door right
    14.91       8.15    -pi/2 %follow
    x           y       -pi/2 %correct position
    14.91       7.36    -pi/2 %follow
    x           y       -pi/2 %door right
    15.15       7.06    -pi/2 %follow
    x           y       -pi/2 %door left (2nd door)
    15.15       5       -pi/2 %follow
    x           y       -pi/2 %correct position
    %15.15      3.32     -pi/2 %follow
    %x          y       -pi/2 %correct position
    15.15       2.81    -pi/2 %follow
    x           y       -pi/2 %door left (3rd door)
    15.15       1.94    -pi/2 %follow_trajectory
    x           y       -pi/2 %correct
    14.80       0.74    -pi/2 %follow
    x           y       -pi/2 %door front
    x           y       -pi/2 %turn_right
    %end third corridor

    %CORRIGIR DOOR FRONT

    12.69       0.84    -pi %follow
    x           y       -pi %correct position
    10.35       0.84    -pi %follow
    x           y       -pi %door left (2nd door)
    8.41        0.84    -pi %follow
    x           y       -pi %correct position
    6.97        0.84    -pi %follow
    x           y       -pi %correct position
    4.84        0.84    -pi %follow
    x           y       -pi %door left (3rd door)
    2.67        0.84    -pi %follow
    x           y       -pi %correct position
    0.40        0.84    -pi %follow
    x           y       -pi %turn left
    0.50        -2.97   -pi/2 %follow
    x           y       -pi/2 %turn right
    -2.64       -2.97   -pi   %follow
    x           y       -pi   %end /stop










];

states_list = [


    states.state0
    states.follow_trajectory
    states.turn_left

    states.follow_trajectory
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.door_right
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_forward
    states.turn_right
    %end first corridor

    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_right
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.turn_right
    %end second corridor

    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_right
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.door_right
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_right
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.correct_position_state
    %states.follow_trajectory
    %states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_forward
    states.turn_right
    %end third corridor

    %correct door front

    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.door_left
    states.follow_trajectory
    states.correct_position_state
    states.follow_trajectory
    states.turn_left
    states.follow_trajectory
    states.turn_right
    states.follow_trajectory
    states.last_state



















];

end
