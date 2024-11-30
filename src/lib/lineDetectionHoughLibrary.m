function [H, theta, rho, line_I] = lineDetectionHoughLibrary(I)
    BW = canny_operator(I);

    % Hitung transformasi Hough
    [H, theta, rho] = hough(BW);
    
    % Temukan hasil pemungutan suara yang memperoleh suara 
    % terbanyak dengan menggunakan fungsi houghpeaks
    P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
    
    % Identifikasi puncak-puncak suara
    %x = theta(P(:,2));
    %y = rho(P(:,1));
    %plot(x,y,'s','color','black');

    % Temukan garis-garis dengan fungsi houghlines
    lines = houghlines(BW, theta, rho, P, 'FillGap', 10, 'MinLength',40);
    
    % Membuat citra dengan garis-garis hasil deteksi Hough
    line_I = I;
    max_len = 0;
    
    for k = 1:length(lines)
        xy = [lines(k).point1; lines(k).point2];
        
        % Gambar garis pada citra baru
        line_I = insertShape(line_I, 'Line', [xy(1,1), xy(1,2), xy(2,1), xy(2,2)], ...
                             'Color', 'green', 'LineWidth', 2);
        
        % Tentukan titik akhir dari segmen garis terpanjang
        len = norm(lines(k).point1 - lines(k).point2);
        if (len > max_len)
            max_len = len;
            xy_long = xy;
        end
    end
    
    % Sorot segmen garis terpanjang
    line_I = insertShape(line_I, 'Line', [xy_long(1,1), xy_long(1,2), xy_long(2,1), xy_long(2,2)], ...
                         'Color', 'red', 'LineWidth', 4);
end