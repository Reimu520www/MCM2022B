alpha = zeros(2,5);
gama = zeros(2,5);
inflow = 0;
Square = [658*(10^6) 640*(10^6)];% 面积(Glen Canyon Dam, Hoover Dam)
beta = zeros(1,2);
density = 1;
gravity = 9.7979;
height_lowest = [110, 119];

[v, u, height, t1, t2] = water_allocation_one(alpha, gama, inflow, Square, beta, density, gravity, height_lowest);
disp("height");
disp(height);