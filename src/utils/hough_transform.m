function [P] = hough_transform(edge_I, q, p)
    [M, N] = size(edge_I);
    SQRTD = sqrt(M^2 + N^2);
    
    p = floor(p + 2*SQRTD);

    P = zeros(p, q);
    [COS, SIN] = lookup_table(q);

    for k = 1 : M
        for l = 1 : N
            if edge_I(k, l) == 1
                for i = 1 : q
                    r = l * COS(i) + k * SIN(i);

                    r = (r + SQRTD) / (2 * SQRTD) * (p - 1) + 0.5;
                    j = floor(r);
                    
                    if j >= 1 && j <= p
                        % Pemungutan suara
                        P(j, i) = P(j, i) + 1;
                    end
                end
            end
        end
    end
end