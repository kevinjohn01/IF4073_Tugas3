function outputImage = roberts(image)
    image = double(image);
    [rows, cols, colorChannel] = size(image);
    
    % Kernel X dan Y untuk algoritma roberts
    Rx = [1 0; 0 -1]; % Horizontal gradient
    Ry = [0 1; -1 0]; % Vertical gradient
    
    
    % Konvolusi citra terhadap masing-masing kernel
    Jx = conv2(image, Rx, "same");
    Jy = conv2(image, Ry, "same");
    
    % Menghitung Jedge
    Jedge = sqrt(Jx.^2 + Jy.^2);
    
    % Normalize gradient magnitude to range 0-255
    outputImage = uint8(mat2gray(Jedge) * 255);
end