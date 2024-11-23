function outputImage = laplace(image, kernel)

    output = convolution(double(image), double(kernel));
    % Normalize to 0-255
    outputImage = uint8(mat2gray(output) * 255);
end