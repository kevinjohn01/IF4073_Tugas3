function [] = imshowHough(H, theta, rho)
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
end