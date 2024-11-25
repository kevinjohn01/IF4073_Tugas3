function [out] = inverse_hough_transform(edge_I, P)
    [M, N] = size(edge_I);
    [p, q] = size(P);

    [COS, SIN] = lookup_table(p);

    out = zeros(M, N);
    SQRTD = sqrt(M^2 + N^2);

    for k = 1 : p
        for l = 1 : q
            y = 0;

            if P(k, l) == 1
                for i = 1 : M
                    r = (l * 2.0 * SQRTD / (q - 1)) - SQRTD;
                    
                    if SIN(k) == 0
                        y = y + 1;
                    else
                        y = (r - (i * COS(k))) / SIN(k);
                    end
                    
                    y = y + 0.5;
                    j = floor(y);
                    
                    if j >= 1 && j <= N
                        if edge_I(i, j) == 1
                            % Pemungutan suara
                            out(i, j) = out(i, j) + 1;
                        end
                    end
                end
            end
        end
    end
end