function [result] = canny_operator(I)
    % Mengonversi citra ke grayscale
    I_gray = rgb2gray(I);

    % Fungsi bawaan operator Canny
    result = edge(I_gray, 'Canny');
end