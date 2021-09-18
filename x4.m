clc
clear
%图片大小200*200
h = 200;
w = 200;

Index = [1:200];
n=200;      %用200个点画圆
ct=2*pi/n:2*pi/n:2*pi;  %每个点之间的间隔角度
a = ceil(w/2);
b = ceil(h/2);         


% 生成数据
num_matrix=0+100*rand(200,200);

% num_matrix=rand(200,200);
% num_matrix(:,:)=50;




for j=1:n
    rou=num_matrix(:,j);
    for i=1:n
        I = zeros(h, w);
        [x, y] = meshgrid(1:w, 1:h);
        I(((x-a).^2 +(y-b).^2)<= (rou(i))^2 ) = 1;
    end
    imwrite(I,['E:\Tools2\Matlab R2019a_Windows\R2019a\bin\prac\images\image',num2str(j),'.png']);
end

%建立模型读取数据
Box.x = 1;
Box.y = 1;
Box.w = 200;
Box.h = 200;
    
Image = zeros(Box.h,Box.w,200);

for i=1:200
filename = ['E:\Tools2\Matlab R2019a_Windows\R2019a\bin\prac\images\image',num2str(Index(i)),'.png'];
im = imread(filename);
Image(:,:,i) = squeeze((im(Box.y:Box.y+Box.h-1,Box.x:Box.x+Box.w-1)));
end

%图像插值
[x,y,z] = size(Image);
[hx,hy,hz] = meshgrid(1:y, 1:x, 1:z);
hr = interp3(Image, hx, hy, hz, 'cubic');

%高斯滤波
W = fspecial('gaussian',[10,10],1);
for i=1:z
imdata = squeeze(hr(:,:,i));
imdata = imfilter(imdata,W,'symmetric');
hr(:,:,i) = imfilter(imdata,W,'symmetric');
end

%三维成像
Image = smooth3(hr(:,:,1:1:end));

fw=20;
p=patch(isosurface(Image,fw))
view(3);

% strcat('A',num2str(200*j-199):'A',num2str(200*j+1))



