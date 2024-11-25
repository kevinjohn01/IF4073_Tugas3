function [P] = threshold(P, T)
    [p, q] = size(P);

    for i = 1 : p
        for j = 1 : q
            if P(i, j) > T
                P(i, j) = 1;
            else
                P(i, j) = 0;
            end
        end
    end
end