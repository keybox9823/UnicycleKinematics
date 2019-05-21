global odometry_points true_points deltas


figure
plot(odometry_points(:,1));
hold on
plot(true_points(:,2));
figure
plot(odometry_points(:,2));
hold on
plot(true_points(:,1));
% figure
% plot(odometry_points(:,3));
% figure
% plot(true_points(:,1));
% figure
% plot(true_points(:,2));
% figure
% plot(true_points(:,3));
% 
 figure
 plot(deltas(:,1));
 figure
 plot(deltas(:,2));
 figure
 plot(deltas(:,3));
