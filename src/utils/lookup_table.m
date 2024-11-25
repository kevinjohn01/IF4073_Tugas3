function [COS, SIN] = lookup_table(m)
    R_to_D = 0.017453;

    COS = zeros(1, m);
    SIN = zeros(1, m);

    for i = 1 : m
        th = i * 180/(m-1) - 90;
        th = th * R_to_D;

        COS(i) = double(cos(double(th)));
        SIN(i) = double(sin(double(th)));
    end
end