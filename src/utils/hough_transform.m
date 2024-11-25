function [P] = hough_transform(edge_I, p, q)
    [M, N] = size(edge_I);
    SQRTD = sqrt(M^2 + N^2);
    
    P = zeros(p, q);
    [COS, SIN] = lookup_table(p);

    for k = 1 : M
        for l = 1 : N
            if edge_I(k, l) == 1
                for i = 1 : p
                    r = k * COS(i) + l * SIN(i);

                    r = (r + SQRTD) / (2 * SQRTD) * (q - 1) + 0.5;
                    j = floor(r);
                    
                    if j >= 1 && j <= q
                        % Pemungutan suara
                        P(i, j) = P(i, j) + 1;
                    end
                end
            end
        end
    end
end