img = imread("img\1-5.bmp");
result = roberts(img);
%result2 = robertsLibrary(img);
segmented = segmentation(result,img);
figure; imshow(img);
figure; imshow(result);
figure; imshow(result2);
figure; imshow(segmented);