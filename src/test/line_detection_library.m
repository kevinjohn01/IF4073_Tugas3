nama = input('Masukkan nama jpg: ', 's');
if exist([nama, '.jpg'], 'file') == 0
    error('Tidak ada file dengan nama tersebut!');
end

I = imread([nama, '.jpg']);

[H, theta, rho, line_I] = lineDetectionHoughLibrary(I);

imshowHough(H, theta, rho);
figure; imshow(line_I);