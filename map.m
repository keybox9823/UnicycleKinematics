function [map] = map()
    
    map = [
        %x1     y1      x2      y2
        %outer lines
        0       0       0       10
        0       10      9       10
        9       10      9       0
        9       0       0       0
        %inner lines
        2       2       2       8
        2       8       8       8
        8       8       8       2
        8       2       2       2
    ];
    
    hold on
    for line = 1:size(map,1)
        A = map(line,1:2);
        B = map(line,3:4);
        plot([A(1) B(1)],[A(2) B(2)],'LineWidth',2);
    end

end