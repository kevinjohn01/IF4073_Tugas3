I = imread('img35.jpg');
imshow(I);

BW = edge(rgb2gray(I),'canny');
figure, imshow(BW);

% Hitung transformasi Hough
[H,theta,rho] = hough(BW);
rho
theta
% Tampilkan H
figure
imshow(imadjust(mat2gray(H)),[],...
'XData',theta,...
'YData',rho,...
'InitialMagnification','fit');
xlabel('\theta (degrees)')
ylabel('\rho')
axis on
axis normal
hold on
colormap(hot)
%Temukan hasil pemungutan suara yang memperoleh suara 
% terbanyak dengan menggunakan fungsi houghpeaks
P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
%Identifikasi puncak-puncak suara
x = theta(P(:,2));
y = rho(P(:,1));
plot(x,y,'s','color','black');

%Temukan garis-garis dengan fungsi houghlines
lines = houghlines(BW,theta,rho,P,'FillGap',5,'MinLength',7);

% Tampilkan citra semula dengan garis-garis hasil deteksi Hough
figure, imshow(I), hold on
max_len = 0;
for k = 1:length(lines)
xy = [lines(k).point1; lines(k).point2];
plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
% Plot beginnings and ends of lines
plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
% Determine the endpoints of the longest line segment
len = norm(lines(k).point1 - lines(k).point2);
if ( len > max_len)
max_len = len;
xy_long = xy;
end
end
% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');