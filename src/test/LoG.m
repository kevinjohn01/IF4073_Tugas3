img = imread("img\1-1.jpg");
result = laplaceOfGaussian(img,2);
result2 = logLibrary(img,1.4);
figure; imshow(img);
figure; imshow(result);
figure; imshow(result2);