% [ x y angle ]
%start_point = [ 0.825 0 ];
start_point = [ 0 0  ];
start_angle = pi/2+pi/9 ;
%end_point = [ 0.825 14.475 ];
end_point = [ 0 5 ];

cur_point = start_point;
cur_angle = start_angle;

v_max = 0.35;

figure(1);
hold on;
scatter([ 0 0 15 15], [0 15 15 0]);

dt = 0.01;
t = 0;
idx = 1;
results = zeros(1000/dt, 2) ;
while t < 1000
    
    [l_v, a_v] = positionTracking(cur_angle,0.35,end_point, cur_point, 0.3,0.3,0.3);
    
    % update point
    cur_point = cur_point + dt * l_v * [ cos(cur_angle) sin(cur_angle) ];
    cur_angle = rem(cur_angle + dt * a_v + 4*pi,2*pi);
    if cur_angle > pi
        cur_angle = cur_angle - 2*pi;
    end
    
    if( norm(cur_point-end_point) < 0.02 ) 
        break;
    end
    
    t = dt + t;
    results(idx,:)=cur_point;
    idx=idx+1;
    
end

scatter(results(:,1),results(:,2));
