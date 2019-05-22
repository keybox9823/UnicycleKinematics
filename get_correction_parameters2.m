function [rho, theta] = get_correction_parameters2(rho1, rho2, angle)

    a = [ -rho1*sin(angle) rho1*cos(angle) ];
    b = [ rho2*sin(angle) rho2*cos(angle) ];

    %m = 1/tan(angle) * (rho2- rho1) / (rho2+rho1);
    m = ( b(2)- a(2) ) / ( b(1) - a(1) )
    
    ord = a(2)-m*a(1);
    
    termo1 = 1/(m+1/m)^2;
    termo2 = 1/(m^2+m)^2;
    rho = ord*sqrt(termo1+termo2);
    %rho = abs( b(1)*a(2) - b(2)*a(1) ) / sqrt( (b(2)-a(2))^2 + (b(1)-a(1))^2);

    theta = wrapToPi(atan(m));

end