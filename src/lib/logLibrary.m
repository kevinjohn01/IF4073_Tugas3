function edgeImage = logLibrary(image, sigma)
    % Ukuran kernel berdasarkan sigma
    kernelSize = ceil(6 * sigma);
    if mod(kernelSize, 2) == 0
        kernelSize = kernelSize + 1;
    end

    % Buat kernel LoG
    [x, y] = meshgrid(-floor(kernelSize/2):floor(kernelSize/2));
    LoGKernel = (x.^2 + y.^2 - 2*sigma^2) .* exp(-(x.^2 + y.^2) / (2*sigma^2));
    LoGKernel = LoGKernel / sum(abs(LoGKernel(:))); % Normalisasi

    % Alokasikan ruang untuk hasil
    edgeImage = zeros(size(image), 'like', image);

    % Proses setiap kanal warna
    for c = 1:size(image, 3)
        edgeImage(:, :, c) = uint8(conv2(double(image(:, :, c)), LoGKernel, 'same'));
    end
end
