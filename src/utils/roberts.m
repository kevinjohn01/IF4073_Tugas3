function outputImage = roberts(image)
    image = double(image);
    [rows, cols, colorChannel] = size(image);
    
    % Kernel X dan Y untuk algoritma roberts
    Rx = [1 0; 0 -1]; % Horizontal gradient
    Ry = [0 1; -1 0]; % Vertical gradient
    
    % matriks output
    Jx = zeros(rows-1, cols-1, colorChannel);
    Jy = zeros(rows-1, cols-1, colorChannel);
    
    % Konvolusi citra terhadap masing-masing kernel
    for k = 1:colorChannel
        for i = 1:(rows-1)
            for j = 1:(cols-1)
                % Mengambil submatrix berukuran 2x2
                subMatrix = image(i:i+1, j:j+1);
                
                % Kalikan dengan kernel
                Jx(i, j, k) = sum(sum(subMatrix .* Rx));
                Jy(i, j, k) = sum(sum(subMatrix .* Ry));
            end
        end
    end
    
    % Menghitung Jedge
    Jedge = sqrt(gradX.^2 + Jy.^2);
    
    % Normalize gradient magnitude to range 0-255
    outputImage = uint8(mat2gray(Jedge) * 255);
end
