img = imread("img\img26.jpg");
result = laplace(img);
segmented = segmentation(result,img);
figure; imshow(img);
figure; imshow(result);
figure; imshow(segmented);