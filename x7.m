clc
clear 

n=200;      %用200个点画圆
ct=2*pi/n:2*pi/n:2*pi;  %每个点之间的间隔角度

m1=10*rand(100,200)+10;
% m1(:)=10;


for j=1:100
    for i=1:n
    x(i)=m1(j,i)*cos(ct(i));       %通过已知半径转换为200个点的X轴坐标    
    y(i)=m1(j,i)*sin(ct(i));       %通过已知半径转换为200个点的Y轴坐标
    end
    
    plot(x,y);
    axis equal;
    axis off;
    set(gcf, 'Color', 'w');
    f = getframe(gca);
    f = frame2im(f);
    imwrite(f,['E:\Tools2\Matlab R2019a_Windows\R2019a\bin\prac\images\image',num2str(j),'.png']);
end

Box.x = 1;
Box.y = 1;
Box.w = 1000;
Box.h = 1000;
    
Image = zeros(Box.h,Box.w,100);

for i=1:100
filename = ['E:\Tools2\Matlab R2019a_Windows\R2019a\bin\prac\images\image',num2str(i),'.png'];
im = imread(filename);
Image(:,:,i) = squeeze((im(Box.y:Box.y+Box.h-1,Box.x:Box.x+Box.w-1)));
end

[x,y,z] = size(Image);
[hx,hy,hz] = meshgrid(1:y, 1:x, 1:z);
hr = interp3(Image, hx, hy, hz, 'cubic');



Image = smooth3(hr(:,:,1:1:end));

fw=20;
p=patch(isosurface(Image,fw))
axis on
view(3);


% p=polyfit(x,y,2);
% 
% y1=polyval(p,x);
% 
% plot(x,y1)

% fig=figure;

% plot(x,y);
% axis equal;
% axis off;
% set(gcf, 'Color', 'w')
% f = getframe(gca);
% f = frame2im(f);
% imwrite(f, 'f.jpg');


% frame=getframe(fig);
% img=frame2im(frame);
% imwrite(img,'a.png');