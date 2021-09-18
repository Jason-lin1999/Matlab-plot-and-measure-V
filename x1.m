clc
clear

h = 200;
w = 200;

Index = [1:200];
nFrames = 80;


n=200;      %用200个点画圆
ct=2*pi/n:2*pi/n:2*pi;  %每个点之间的间隔角度
a = ceil(w/2);
b = ceil(h/2);         
%rou=xlsread('C:\Users\dell\Desktop\matlab仿真实验\r1.xlsx','A1:A200');       %读取半径值




for j=1:4
%     str=['A',num2str(200*j-199),':','A',num2str(200*j+1)]
    u=200*j-199;
    v=200*j+1;
    rou=xlsread('C:\Users\dell\Desktop\matlab仿真实验\r1.xlsx',strcat('A',num2str(u),':','A',num2str(v)));
    for i=1:n
        I = zeros(h, w);
        [x, y] = meshgrid(1:w, 1:h);
        %j(i)=rou(i)*cos(ct(i))+a;       %通过已知半径转换为200个点的X轴坐标    
        %k(i)=rou(i)*sin(ct(i))+b;       %通过已知半径转换为200个点的Y轴坐标
        I(((x-a).^2 +(y-b).^2)<= (rou(i))^2 ) = 1;
%     I(j(i)^2+k(i)^2 <=((x-a).^2 +(y-b).^2)) = 0;
%     imwrite(I,['E:\Tools2\Matlab R2019a_Windows\R2019a\bin\prac\images\image',num2str(Index(i)),'.png']);
    end
    imwrite(I,['E:\Tools2\Matlab R2019a_Windows\R2019a\bin\prac\images\image',num2str(j),'.png']);
    

end




Box.x = 1;
Box.y = 1;
Box.w = 200;
Box.h = 200;
    
Image = zeros(Box.h,Box.w,4);

for i=1:4
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

% strcat('A',num2str(200*j-199):'A',num2str(200*j+1))



