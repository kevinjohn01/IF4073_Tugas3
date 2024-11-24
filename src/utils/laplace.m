function output = laplace(image)
    % Define Laplace kernel
    kernel = [0 1 0; 1 -4 1; 0 1 0];
    % Convert to grayscale if RGB
    
    % Apply convolution
    output = convolution(double(image), double(kernel));
    % Normalize to 0-255
    output = uint8(mat2gray(output) * 255);
end