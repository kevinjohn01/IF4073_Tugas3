function output = laplace(image)
    % Kernel Laplace
    kernel = [1 1 1; 1 -8 1; 1 1 1];
    
    % konvolusi
    % fungsi ini didefinisikan sendiri pada file convolution.m
    output = convolution(double(image), double(kernel));

    % Normalize to 0-255
    output = uint8(mat2gray(output) * 255);
end