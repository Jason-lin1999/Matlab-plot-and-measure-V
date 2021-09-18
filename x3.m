%产生随机数程序

%方案1
% clc
% clear
% k=1;
% for i=1:200
%    
%     a=300+500*rand(1);
%     xlswrite('C:\Users\dell\Desktop\matlab仿真实验\try2.xlsx',a,'sheet1',['A',num2str(k)]);
%     k=k+1;
% end


%方案2
clc
clear 
a=300+500*rand(200,200);
a(:,1)