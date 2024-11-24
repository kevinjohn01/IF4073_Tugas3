img = imread("img25.jpg");
result = laplace(img);
result2 = laplaceLibrary(img);
figure; imshow(img);
figure; imshow(result);
figure; imshow(result2);