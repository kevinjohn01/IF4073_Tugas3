function imgout = segmentation(imgin, imgoriginal)
    % referensi: https://www.mathworks.com/help/images/detecting-a-cell-using-image-segmentation.html
    linelength = 3;
    imgin = rgb2gray(imgin);
    imgin = imbinarize(imgin);
    
    dilated = imclearborder(imgin);
    
    se0 = strel('line', linelength, 0);
    se90 = strel('line', linelength, 90);
    BWsdil = imdilate(dilated, [se90 se0]);
    
    BWdfill = imfill(BWsdil, 'holes');
    BWnobord = imclearborder(BWdfill, 4);

    seD = strel('diamond',1);
    BWfinal = imerode(BWnobord,seD);
    BWfinal = imerode(BWfinal,seD);

    filled = bwareaopen(BWfinal, 4000, 8);
    
    imgout = bsxfun(@times, imgoriginal, cast(filled, 'like', imgoriginal));
end