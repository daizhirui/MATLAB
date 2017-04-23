%***********************清理workspace**********************
save('current.mat');
disp('清理workspace......');
clear;
disp('清理workspace完毕！');

%************************设定扫描区间************************
angle_step=0.0001;%角度扫描步长
angle_scan=[30,80];
angle_begin=angle_scan(1,1)/180*pi;
angle_end=angle_scan(1,2)/180*pi;

length_step=0.1*10^(-9);%波长扫描步长
length_scan=[300,800];%单位nm,可用区间：300～1700
length_begin=length_scan(1,1)*10^(-9);%单位m
length_end=length_scan(1,2)*10^(-9);%单位m

%*************************变量初始化*************************
%入射光波长缺省值
default_lumda=632.8*10^(-9);%单位m
%入射角缺省值
default_angle=70*pi/180;%弧度制,数据来自文献P33
%金膜厚度缺省值
default_thickness=40*10^(-9);%单位m
%金膜介电常数
e_metal=-11.74+1.2611i;
%e_metal=-25+1.44i;%文献P30 gold介电常数
%棱镜折射率、介电常数
n_prism=1.515;
e_prism=n_prism^2;
%待测样品折射率、介电常数
default_n_sample=1;%缺省值
%default_n_sample=1.3317;%水
%default_n_sample=1.329;%文献P30
e_sample=default_n_sample^2;

%***********************结果矩阵容量初始化**********************
%角度扫描结果矩阵
k=(angle_end-angle_begin)/angle_step;
if (k-round(k))>0
    length=round(k)+1;
else
    length=round(k);
end
angle_result=zeros(length,3);

%波长扫描结果矩阵
k=(length_end-length_begin)/length_step;
if (k-round(k))>0
    length=round(k)+1;
else
    length=round(k);
end
length_result=zeros(length,3);

%************************开始扫描************************
%角度扫描
disp('开始角度扫描');
k=1;
for theta=angle_begin:angle_step:angle_end
    angle_result(k,1)=theta*180/pi;
    angle_result(k,2:3)=SPR_Function1(default_lumda,theta,default_thickness,e_metal,e_prism,e_sample);
    k=k+1;
end
disp('角度扫描完毕！');

%波长扫描
disp('开始波长扫描');
k=1;
for lumda=length_begin:length_step:length_end
    length_result(k,1)=lumda*10^9;
    e_metal=gold_permittivity(lumda);
    e_prism=prism_refractive_index(lumda);
    length_result(k,2:3)=SPR_Function1(lumda,default_angle,default_thickness,e_metal,e_prism,e_sample);
    k=k+1;
end
disp('波长扫描完毕！');

%*************************输出图像*************************
%角度扫描结果
figure(1)
plot(angle_result(:,1),angle_result(:,2),'-k','color','b')
hold;
plot(angle_result(:,1),angle_result(:,3),'-k','color','r')

%波长扫描结果
figure(2)
plot(length_result(:,1),length_result(:,2),'-k','color','b')
hold;
plot(length_result(:,1),length_result(:,3),'-k','color','r')

