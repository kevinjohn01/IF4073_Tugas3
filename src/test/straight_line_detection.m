nama = input('Masukkan nama jpg: ', 's');
if exist([nama, '.jpg'], 'file') == 0
    error('Tidak ada file dengan nama tersebut!');
end

I = imread([nama, '.jpg']);

[result] = canny_operator(I);

P = hough_transform(result, 180, 200);
theta = linspace(-90, 89, 180);
[M, N] = size(I);
max_rho = sqrt(M^2 + N^2);
rho = linspace(-792, 792, 1585);

figure; 
% imshow(P, []);
imshow(imadjust(mat2gray(P)),[],...
    'XData',theta,...
    'YData',rho,...
    'InitialMagnification','fit');
    xlabel('\theta (degrees)')
    ylabel('\rho')
    axis on
    axis normal
    hold on
    colormap(hot)

[H, t, r] = hough(result);
figure;
imshow(imadjust(mat2gray(H)),[],...
    'XData',t,...
    'YData',r,...
    'InitialMagnification','fit');
    xlabel('\theta (degrees)')
    ylabel('\rho')
    axis on
    axis normal
    hold on
    colormap(hot)


P = houghpeaks(H, 5, 'threshold', ceil(0.3*max(P(:))));

x = theta(P(:,2));
y = rho(P(:,1));
% plot(x,y,'s','color','black');

lines = houghlines(result, theta, rho, P, 'FillGap', 5, 'MinLength', 7);
size(lines, 2)

figure, imshow(I), hold on;

if ~isempty(lines)
    max_len = 0;
    for k = 1:length(lines)
        xy = [lines(k).point1; lines(k).point2];
        plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
        % Plot beginnings and ends of lines
        plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
        plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
        % Determine the endpoints of the longest line segment
        len = norm(lines(k).point1 - lines(k).point2);
        if (len > max_len)
            max_len = len;
            xy_long = xy;
        end
    end
    % highlight the longest line segment
    plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');
end