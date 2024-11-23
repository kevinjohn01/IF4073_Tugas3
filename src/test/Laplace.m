img = imread("img\7-2.jpg");
result = laplace(img,[1 1 1; 1 -8 1; 1 1 1]);
figure; imshow(result);