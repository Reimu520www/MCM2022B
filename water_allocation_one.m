function [v, u, height, t1, t2] = water_allocation_one(alpha, gama, inflow, Square, beta, density, gravity, height_lowest)
t = 0;
mark = 0;
height = [142 158]; %水位高度 (Glen Canyon Dam, Hoover Dam)
hold on
scatter(t, height);

Volume = zeros(1,2);
Volume(1) = height(1) * Square(1);
Volume(2) = height(2) * Square(2);
disp("Volume2");
disp(Volume);

while(height(1) > height_lowest(1,1) || height(2) > height_lowest(2))
    t = t + 1;
    if(height(1) > height_lowest(1) && height(2) > height_lowest(2))
        v = [0, 0, 0, 0, 4.42*(10^8); 2.38*(10^8), 1.12*(10^9), 1.23*(10^8), 4.45*(10^8), 0];
        u = [8625*(0.3048^3)*3600*24, 3.51*(10^7)];
    elseif(height(1) <= height_lowest(1) && height(2) > height_lowest(2))
        v = [0, 0, 0, 0, 4.42*(10^8); 2.38*(10^8), 1.12*(10^9), 1.23*(10^8), 4.45*(10^8), 0];
        u = [8625*(0.3048^3)*3600*24, 3.51*(10^7)];
        v(1, :) = 0;
    elseif(height(1) > height_lowest(1) && height(2) <= height_lowest(2))
        v = [0, 0, 0, 0, 4.42*(10^8); 2.38*(10^8), 1.12*(10^9), 1.23*(10^8), 4.45*(10^8), 0];
        u = [8625*(0.3048^3)*3600*24, 3.51*(10^7)];
        v(2, :) = 0;
    else
        break;
    end

    if((height(1) <= height_lowest(1) || height(2) <= height_lowest(2)) && mark == 0)
        t1 = t;
    end

    Volume(1) = Volume(1) + inflow - sum(v(1,:)) - sum(u(1));
    Volume(2) = Volume(2) + sum(u(1)) - sum(v(2,:)) - sum(u(2));

    height = Volume ./ Square;
    disp(t);
    disp(height);
    hold on
    scatter(t, height);
end

t2 = t;
end