close all;
clear all;
obj=imread('D:\pictures\ball.jpg');
imshow(obj);
red=obj(:,:,1);
green=obj(:,:,2);   %divide the image based on RGB 
blue=obj(:,:,3);

figure(1)
subplot(221);
imshow(obj);
title('original image');
subplot(222);
imshow(red);
title('red image');
subplot(223);
imshow(blue);
title('blue image');
subplot(221);
imshow(green);
title('green image');

figure(2)
level=0.37;
bw2=im2bw(blue,level);   %Threshold the blue plane
subplot(221);
imshow(bw2);
title('blue plane thresholded');
% Noise removal
fill=imfill(bw2,'holes');   %fill any holes
subplot(222);
imshow(fill);
title('holes filled');

cl=imclearborder(fill);         %removes any bolbs on the border of the image
subplot(223);
imshow(cl);
title('Remove bolbs on border');


 se=strel('disk',7);  %Remove blobs that are smaller than 7 pixels across
open=imopen(fill,se);
subplot(224);
imshow(open);
title('Remove small bolbs');

diameter=regionprops(open,'MajorAxisLength')  % Measure the Diameter

figure(3)
imshow(obj);
d=imdistline;%Line to physically measure the ball 


