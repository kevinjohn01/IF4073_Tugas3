function edgeImage = laplaceLibrary(image)
    % Definisi kernel Laplace
    laplaceKernel = [0 -1 0; -1 4 -1; 0 -1 0];

    % Alokasikan ruang untuk hasil
    edgeImage = zeros(size(image), 'like', image);

    % Proses setiap kanal warna
    for c = 1:size(image, 3)
        edgeImage(:, :, c) = uint8(conv2(double(image(:, :, c)), laplaceKernel, 'same'));
    end
end

