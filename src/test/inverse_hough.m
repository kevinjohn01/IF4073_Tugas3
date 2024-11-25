nama = input('Masukkan nama jpg: ', 's');
if exist([nama, '.jpg'], 'file') == 0
    error('Tidak ada file dengan nama tersebut!');
end

I = imread([nama, '.jpg']);

[result] = canny_operator(I);

P = hough_transform(result, 180, 200);

P = threshold(P, 0.1 * max(P(:)));
figure; imshow(P, []);

out = inverse_hough_transform(result, P);
figure; imshow(out, []);