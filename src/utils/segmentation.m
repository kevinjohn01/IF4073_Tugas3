function imgout = segmentation(imgin, imgoriginal)
    % referensi: https://www.mathworks.com/help/images/detecting-a-cell-using-image-segmentation.html

    linelength = 6; % Panjang elemen struktural untuk dilasi garis
    minObjectSize = 4000; % Ukuran minimum untuk area yang dipertahankan

    %Cek tipe data imgin
    if ~islogical(imgin)
        if size(imgin, 3) == 3
            imgin = rgb2gray(imgin); % Konversi ke grayscale jika input RGB
        end
        % Thresholding global untuk gambar biner
        imgin = imbinarize(imgin);
    end
    
    % 2. Clear border untuk menghilangkan objek di tepi gambar
    %dilated = imclearborder(imgin);
    dilated = imgin;

    % 3. Penguatan garis (Dilasi dan Closing)
    % Menggunakan elemen struktural garis untuk memperjelas tepi
    se0 = strel('line', linelength, 0); % Garis horizontal
    se90 = strel('line', linelength, 90); % Garis vertikal
    BWdilated = imdilate(dilated, [se90 se0]); % Dilasi untuk menyambungkan garis

    % Closing untuk menutup celah di dalam objek
    BWclosed = imclose(BWdilated, strel('disk', 2)); % Disk dengan radius 2 piksel

    % 4. Pengisian lubang
    BWfilled = imfill(BWclosed, 'holes'); % Mengisi area kosong di dalam objek

    % 5. Penghapusan objek kecil yang tidak relevan
    BWfiltered = bwareaopen(BWfilled, minObjectSize);

    % 6. Masking ke gambar asli
    imgout = bsxfun(@times, imgoriginal, cast(BWfiltered, 'like', imgoriginal));

    % Visualisasi hasil setiap langkah
    figure;
    subplot(2, 3, 1); imshow(imgin); title('Input (Logical/Binary)');
    subplot(2, 3, 2); imshow(dilated); title('Cleared Borders');
    subplot(2, 3, 3); imshow(BWdilated); title('Dilated Edges');
    subplot(2, 3, 4); imshow(BWclosed); title('Closed Edges');
    subplot(2, 3, 5); imshow(BWfiltered); title('Final Binary Mask');
    subplot(2, 3, 6); imshow(imgout); title('Segmented Output');
end
