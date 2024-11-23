nama = input('Masukkan nama bmp: ', 's');
if exist([nama, '.bmp'], 'file') == 0
    error('Tidak ada file dengan nama tersebut!');
end

I = imread([nama, '.bmp']);

[result] = sobel_operator(I);


figure; imshow(I); title('Citra Semula');
figure; imhist(I); title('Histogram Citra Semula');

figure; imshow(result); title('Citra Hasil Operator Sobel');
figure; imhist(result); title('Histogram Citra Hasil Operator Sobel');