nama = input('Masukkan nama jpg: ', 's');
if exist([nama, '.jpg'], 'file') == 0
    error('Tidak ada file dengan nama tersebut!');
end

I = imread([nama, '.jpg']);

T = input('Masukkan nilai T: ', 's');
if isnan(str2double(T))
    error('T harus berupa angka!');
else
    T = str2double(T);
end

[H, theta, rho, HT, lines, final] = line_detection(I, T);

figure; imshowHough(H, theta, rho);
figure; imshowHough(HT, theta, rho);
figure; imshow(lines);
figure; imshow(final);