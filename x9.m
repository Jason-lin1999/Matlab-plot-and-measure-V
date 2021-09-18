%测试案例，示例选择球体
%用Matlab进行物体空间三维点云的体积计算
  
clc
clear

[x,y,z]=sphere(199);
x=4+7*x;           % 圆心:(4,2,0)   半径:7

y=2+7*y;

z=7*z;

x1=x(:);
y1=y(:);
z2=z(:);

z1=[x1,y1,z2];

% surf(x1,y1,z1)
% 
% xlabel('x')
% 
% ylabel('y')
% 
% zlabel('z')
% 
% axis equal
% 
% alpha(0.8)         %设置透明度
% shading flat



% 
% n=200;
% 
% ct=2*pi/n:2*pi/n:2*pi;  %每个点之间的间隔角度
% a=0;        %假设圆心的X轴坐标是0
% b=0;         %假设圆心的Y轴坐标是0
% 
% m1=rand(20000,1);
% m1(:,1)=10;

% for i=1:100
%     m1(200*i-199:200*i,2)=3*i;        
% % end
% 
% for i=1:200
%     x(i)=m1(i)*cos(ct(i))+a;       %通过已知半径转换为200个点的X轴坐标    
%     y(i)=m1(i)*sin(ct(i))+b;       %通过已知半径转换为200个点的Y轴坐标
% end

% x=x';
% y=y';
% 
% %repmat,矩阵向量的复制扩充
% x1=repmat(x,100,1);
% y1=repmat(y,100,1);
% 
% z1=[x1,y1];


% for i=1:100
%     z1(200*i-199:200*i,3)=3*i;        
% end

%默认收缩因子是 0.5。指定更大或更小的收缩因子可相应地收紧或放松包括这些点的边界。
shrinkFactor=0;

%返回一个表示包围点 (x,y,z) 的单个相容三维边界的三角剖分。k 的每一行都是以点索引形式定义的三角形。
%v是边界k围住的体积
[k,v] = boundary(z1,shrinkFactor);

%'FaceAlpha' 表示透明度，范围0-1
trisurf(k,z1(:,1),z1(:,2),z1(:,3),'Facecolor','red','FaceAlpha',0.9)