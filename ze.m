
%%

map = [
        %x1     y1      x2      y2
        %outer lines
        0       0       16      0
        16      0       16      16
        16      16      0       16
        0       16      0       15.59
        0       14.72   0       0
        %inner lines
        2       2       14      2
        14      2       14      14
        14      14      2       14
        2       14      2       2
    ];
    
    hold on
    for line = 1:size(map,1)
        A = map(line,1:2);
        B = map(line,3:4);
        plot([A(1) B(1)],[A(2) B(2)],'LineWidth',2);
    end




%%
points1=[0 15.15;1.118 13.91; 1.229 10.06];
points1=transpose(points1);
points=[0 15.15;1 15;1.2 12;1 8;1 1;8 1;15 1;15 8;15 15;8 15;1 15;-1 15];
points = transpose(points);
[ m, n ] = size ( points );
[ m1, n1 ] = size ( points1 );
s=(1:n);
s1=(1:n1);
t = ( 1 : 0.05 : n );
t1= ( 1 : 0.05 : n1 );
u = spline ( s, points(1,:), t );
v = spline ( s, points(2,:), t );
[~,size1] = size(u);
vaux=v;

for i=1:size1
   if(v(1)>10.06)
       v(1)=[];
       u(1)=[];
       i
   else
       break;
   end
end

u1 = spline ( s1, points1(1,:), t1 );
v1 = spline ( s1, points1(2,:), t1 );
%clf


plot ( u, v, 'Color', 'r', 'LineWidth', 2 )
plot ( u1, v1, 'Color', 'r', 'LineWidth', 2 )
hold on
plot( points(1,:), points(2,:), 'b.', 'MarkerSize', 15 );
axis equal;
grid on;
title ( 'Spline interpolant treating index as independent variable.' );
hold off;
