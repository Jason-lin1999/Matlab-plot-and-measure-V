%绘制外部形状，并计算体积

clc 
clear 

m1=300+500*rand(20000,2);

for i=1:100
    m1(200*i-199:200*i,3)=3*i;
end

%默认收缩因子是 0.5。指定更大或更小的收缩因子可相应地收紧或放松包括这些点的边界。
shrinkFactor=0.5;

%返回一个表示包围点 (x,y,z) 的单个相容三维边界的三角剖分。k 的每一行都是以点索引形式定义的三角形。
%v是边界k围住的体积
% [k,v] = boundary(m1,shrinkFactor);

%'FaceAlpha' 表示透明度，范围0-1
% trisurf(k,m1(:,1),m1(:,2),m1(:,3),'Facecolor','red','FaceAlpha',0.9)

%绘制散点图
% scatter3(m1(:,1),m1(:,2),m1(:,3),'k');
% grid on