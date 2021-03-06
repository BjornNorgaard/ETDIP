%Medianfilter, hvordan virker det i MatLAb
%Se GW3e fig 5.10 p. 328
%HKa sep. 2015

clear, close all;

% Load image
image = imread('cameraman.tif');

% Corrupt the image with salt and pebr noise
p=.2 % Parameter sets the power of the noise 

curruptedImage = image;
x = rand(size(image));
curruptedImage(find(x < p/2)) = 0;            % Min value
curruptedImage(find(x >= p/2 & x < p)) = 255; % Max (saturated) value
figure, imshow(curruptedImage); title('Original with salt and pebber noise');

J0 = medfilt2(curruptedImage,[3,3]);
figure, imshow(J0); title('Median filtrering 1 time');
pause;

J1 = medfilt2(J0,[3,3]);
figure, imshow(J1); title('Median filtrering 2 times');
pause;

J2 = medfilt2(J1,[3,3]);
figure, imshow(J2); title('Median filtrering 3 times'); % Note more and more bluring
