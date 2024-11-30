function outputImage = laplaceOfGaussian(image,sigma)
    % Kernel konvolusi citra (-3*sigma sampai 3*sigma) 
    sizeKernel = ceil(6 * sigma);
    disp(sizeKernel);

    % ukuran kernel harus ganjil
    if mod(sizeKernel, 2) == 0
        sizeKernel = sizeKernel + 1;
    end

    % membuat kernel untuk operasi LoG berdasarkan STD
    [x, y] = meshgrid(-floor(sizeKernel/2):floor(sizeKernel/2));

    % membuat mask LoG
    LoG = (x.^2 + y.^2 - 2*sigma^2) .* exp(-(x.^2 + y.^2) / (2*sigma^2));
    LoG = LoG / (2 * pi * sigma^4); % Normalisasi kernel
    
    % Proses konvolusi
    output = convolution(double(image), double(LoG));
    
    % Normalisasi citra
    outputImage = uint8(mat2gray(output) * 255);
end