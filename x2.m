clc
clear
h = 128;
w = 128;
r1 = 10;
r2 = 12;
Index = [1:80];
nFrames = 80;

for i=1:80
I = zeros(h, w);
[x, y] = meshgrid(1:w, 1:h);
%a,b是中心坐标
a = ceil(w/2);
b = ceil(h/2);
I( r1^2 <=((x-a).^2 +(y-b).^2)) = 1;
% I(((x-a).^2 +(y-b).^2) <= r1^2 ) = 0.5;
I(((x-a).^2 +(y-b).^2)>= r2^2 ) = 0;
imwrite(I,['E:\Tools2\Matlab R2019a_Windows\R2019a\bin\prac\images\image',num2str(Index(i)),'.png']);
end


Box.x = 1;
Box.y = 1;
Box.w = 128;
Box.h = 128;
    
Image = zeros(Box.h,Box.w,nFrames);

for i=1:nFrames
filename = ['E:\Tools2\Matlab R2019a_Windows\R2019a\bin\prac\images\image',num2str(Index(i)),'.png'];
im = imread(filename);
Image(:,:,i) = squeeze((im(Box.y:Box.y+Box.h-1,Box.x:Box.x+Box.w-1)));
end

[x,y,z] = size(Image);
[hx,hy,hz] = meshgrid(1:y, 1:x, 1:z);
hr = interp3(Image, hx, hy, hz, 'cubic');

Image = smooth3(hr(:,:,1:1:end));

fw=20;
p=patch(isosurface(Image,fw))
view(3);