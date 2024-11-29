function [H, theta, rho, HT, lines, final] = line_detection(I, T)    
    % Deteksi tepi dengan operator Canny
    [result] = canny_operator(I);
    
    % Transformasi Hough terhadap citra tepi
    H = hough_transform(result, 180, 0);


    % Mendaftarkan theta dan rho yang digunakan sebagai parameter
    % justifikasi penampilan gambar dengan fungsi imshowHough
    theta = linspace(-90, 89, 180);
    [M, N] = size(I);
    SQRTD = sqrt(M^2 + N^2);
    rho = linspace(-SQRTD, SQRTD, 2*SQRTD);
    

    % Pengambangan terhadap hasil transformasi Hough
    HT = threshold(H, T);
    
    % Transformasi Hough balikan terhadap hasil pengambangan
    % Hasil: garis-garis yang terdeteksi pada citra tepi
    lines = inverse_hough_transform(result, HT);
    
    % Menambahkan garis-garis pada citra semula
    final = im2double(I) + lines;
end