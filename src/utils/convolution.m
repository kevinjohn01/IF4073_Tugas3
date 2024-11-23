function outputImage = convolution(image, convMatrix, grayscale)
    [rows, cols, colorChannels] = size(image);
    [rowsConv, colsConv] = size(convMatrix);
    
    outputImage = zeros(rows, cols, 'uint8');

    for i = ((rowsConv+1)/2):(rows-((rowsConv-1)/2))
        for j = ((colsConv+1)/2):(cols-((colsConv-1)/2))
            for k = 1:colorChannels
                temp = 0;
                startIdxRow = i-(rowsConv+1)/2;
                startIdxCols = j-(colsConv+1)/2;
                for a = 1:rowsConv
                    for b = 1:colsConv
                        temp = temp + image(a + startIdxRow,b + startIdxCols,k)*convMatrix(a,b);
                    end
                end
                
                if temp < 0
                    outputImage(i,j,k) = 0;
                elseif temp > 255
                    outputImage(i,j,k) = 255;
                else
                    outputImage(i,j,k) = uint8(temp);
                end
            end
        end
    end

    if grayscale == true
        if size(outputImage, 3) == 3
            outputImage = rgb2gray(outputImage);
        end
    end
end