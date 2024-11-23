function outputImage = laplaceOfGaussian(image,sigma)
    % Generate LoG kernel
    sizeKernel = ceil(6 * sigma);

    % size of the kernel must be an odd integer
    if mod(sizeKernel, 2) == 0
        sizeKernel = sizeKernel + 1;
    end

    % kernel generation
    [x, y] = meshgrid(-floor(sizeKernel/2):floor(sizeKernel/2));
    LoG = (x.^2 + y.^2 - 2*sigma^2) .* exp(-(x.^2 + y.^2) / (2*sigma^2));
    LoG = LoG / (2 * pi * sigma^4); % Normalize kernel
    
    % Apply convolution
    output = convolution(double(image), double(LoG), true);
    % Normalize to 0-255
    outputImage = uint8(mat2gray(output) * 255);
end