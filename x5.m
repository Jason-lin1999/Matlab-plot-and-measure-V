%利用高度间隔，重构三维图像

clc
clear 

m1=300+200*rand(201,201);
m2=300+200*rand(201,201);

t2=0:0.2:40;

t2Final=repmat(t2,201,1);

% t1=t2Final';
% surf(m1,m2,t2Final');
mesh(m1,m2,t2Final');

view(3);

