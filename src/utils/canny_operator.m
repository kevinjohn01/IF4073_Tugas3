function [result] = canny_operator(I)
    % Mengonversi citra ke grayscale
    if (size(I,3) == 3)
        I = rgb2gray(I);
    end

    % Fungsi bawaan operator Canny
    result = edge(I, 'Canny');
end