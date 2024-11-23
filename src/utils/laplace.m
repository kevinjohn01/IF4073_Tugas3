function outputImage = laplace(image)
    kernel =  [1 1 1; 1 -8 1; 1 1 1];
    output = convolution(double(image), double(kernel));
    outputImage = uint8(mat2gray(output) * 255);
end