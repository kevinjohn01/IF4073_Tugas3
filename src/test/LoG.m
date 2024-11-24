img = imread("img\img26.jpg");
result = roberts(img);
result2 = logLibrary(img,1.4);
segmented = segmentation(result,img);
figure; imshow(img);
figure; imshow(result);
figure; imshow(result2);
figure; imshow(segmented);