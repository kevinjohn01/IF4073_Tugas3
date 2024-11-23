function [result] = prewitt_operator(I)
    mask_x = [-1,0,1; -1,0,1; -1,0,1];
    mask_y = [1,1,1; 0,0,0; -1,-1,-1];
    
    I = double(I);
    [M, N, C] = size(I);

    X = 3;  % Ukuran mask
    Y = 3;  % Ukuran mask

    % Menyiapkan matriks citra keluaran seukuran I
    result = zeros(M, N, C);
    
    for k = 1 : C
        for i = 1 : M - X + 1
            for j = 1 : N - Y + 1
                
                sx = 0; sy = 0;
                a = 0;
                for u = i : (i + X-1)
                    a = a + 1;
                    b = 0;
                    for v = j : (j + Y-1)
                        b = b + 1;
                        sx = sx + mask_x(a,b) * I(u,v);
                        sy = sy + mask_y(a,b) * I(u,v);
                    end
                end
                
                magnitude = sqrt(sx^2 + sy^2);

                if (magnitude < 0)
                    magnitude = 0;
                elseif (M > 255)
                    magnitude = 255;
                end
    
                result((i + floor(X/2)), (j + floor(Y/2)), k) = magnitude;
            end
        end
    end


    for i = 1 : M
        for j = 1 : N
            for k = 1 : C
                if (i <= floor(X/2) || j <= floor(Y/2) || i > M - floor(X/2) || j > N - floor(Y/2))
                    result(i, j, k) = I(i, j, k);
                end
            end
        end
    end
    
    result = uint8(result);
end