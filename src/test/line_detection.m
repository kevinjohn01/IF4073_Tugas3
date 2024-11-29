nama = input('Masukkan nama jpg: ', 's');
if exist([nama, '.jpg'], 'file') == 0
    error('Tidak ada file dengan nama tersebut!');
end

I = imread([nama, '.jpg']);

[result] = canny_operator(I);

P = hough_transform(result, 180, 0);
theta = linspace(-90, 89, 180);
[M, N] = size(I);
max_rho = sqrt(M^2 + N^2);
rho = linspace(-max_rho, max_rho, 2*max_rho);

imshowHough(P, theta, rho);

P = threshold(P, 0.3*max(P(:)));
imshowHough(P, theta, rho);

P = inverse_hough_transform(result, P);
figure; imshow(P);