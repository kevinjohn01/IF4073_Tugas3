function [COS, SIN] = lookup_table(m)
    COS = zeros(1, m);
    SIN = zeros(1, m);

    for i = 1 : m
        th = i * pi/(m-1) - pi/2;

        COS(i) = double(cos(double(th)));
        SIN(i) = double(sin(double(th)));
    end
end