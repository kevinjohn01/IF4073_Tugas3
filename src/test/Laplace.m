img = imread("img\img16.jpg");
result = laplace(img);
result2 = laplaceLibrary(img);
segmented = segmentation(result,img);
figure; imshow(img);
figure; imshow(result);
figure; imshow(result2);
figure; imshow(segmented);