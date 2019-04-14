function [P] = intersect_lines(A,B,C,D)
% inputs are: A,B,C,D = [x,y] return is P =[x,y]
    
    a1 = B(2)-A(2);
    b1 = A(1)-B(1);
    c1 = a1*A(1)+b1*A(2);
    
    a2 = D(2)-C(2);
    b2 = C(1)-D(1); 
    c2 = a2*C(1)+b2*C(2);
    
    det = a1*b2 - a2*b1;
    
    if det == 0
        P = [];
    else
        x = (b2*c1-b1*c2)/det;
        y = (a1*c2-a2*c1)/det;
        P = [x,y];      
    end
            
end
