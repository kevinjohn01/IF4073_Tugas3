function [out] = inverse_hough_transform(edge_I, P)
    [M, N] = size(edge_I);
    [p, q] = size(P);

    [COS, SIN] = lookup_table(q);

    out = zeros(M, N);
    SQRTD = sqrt(M^2 + N^2);

    for k = 1 : q
        for l = 1 : p
            y = 0;
            x = 0;

            if P(l, k) == 1
                for i = 1 : N
                    r = (l * 2.0 * SQRTD / (p - 1)) - SQRTD;
                    
                    if SIN(k) == 0
                        y = y + 1;
                    else
                        y = (r - (i * COS(k))) / SIN(k);
                    end
                    
                    y = y + 0.5;
                    j = floor(y);
                    
                    if j >= 1 && j <= M
                        out(j, i) = 1;
                    end
                end

                for j = 1 : M
                    r = (l * 2.0 * SQRTD / (p - 1)) - SQRTD;
                    
                    if COS(k) == 0
                        x = x + 1;
                    else
                        x = (r - (j * SIN(k))) / COS(k);
                    end
                    
                    x = x + 0.5;
                    i = floor(x);
                    
                    if i >= 1 && i <= N
                        out(j, i) = 1;
                    end
                end
            end
        end
    end
end