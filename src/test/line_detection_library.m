nama = input('Masukkan nama jpg: ', 's');
if exist([nama, '.jpg'], 'file') == 0
    error('Tidak ada file dengan nama tersebut!');
end

I = imread([nama, '.jpg']);

[H, lines] = lineDetectionHoughLibrary(I);

% figure; imshow(H);
% figure; imshow(line_I);