%***********************����workspace**********************
save('current.mat');
disp('����workspace......');
clear;
disp('����workspace��ϣ�');

%************************�趨ɨ������************************
angle_step=0.0001;%�Ƕ�ɨ�貽��
angle_scan=[30,80];
angle_begin=angle_scan(1,1)/180*pi;
angle_end=angle_scan(1,2)/180*pi;

length_step=0.1*10^(-9);%����ɨ�貽��
length_scan=[300,800];%��λnm,�������䣺300��1700
length_begin=length_scan(1,1)*10^(-9);%��λm
length_end=length_scan(1,2)*10^(-9);%��λm

%*************************������ʼ��*************************
%����Ⲩ��ȱʡֵ
default_lumda=632.8*10^(-9);%��λm
%�����ȱʡֵ
default_angle=70*pi/180;%������,������������P33
%��Ĥ���ȱʡֵ
default_thickness=40*10^(-9);%��λm
%��Ĥ��糣��
e_metal=-11.74+1.2611i;
%e_metal=-25+1.44i;%����P30 gold��糣��
%�⾵�����ʡ���糣��
n_prism=1.515;
e_prism=n_prism^2;
%������Ʒ�����ʡ���糣��
default_n_sample=1;%ȱʡֵ
%default_n_sample=1.3317;%ˮ
%default_n_sample=1.329;%����P30
e_sample=default_n_sample^2;

%***********************�������������ʼ��**********************
%�Ƕ�ɨ��������
k=(angle_end-angle_begin)/angle_step;
if (k-round(k))>0
    length=round(k)+1;
else
    length=round(k);
end
angle_result=zeros(length,3);

%����ɨ��������
k=(length_end-length_begin)/length_step;
if (k-round(k))>0
    length=round(k)+1;
else
    length=round(k);
end
length_result=zeros(length,3);

%************************��ʼɨ��************************
%�Ƕ�ɨ��
disp('��ʼ�Ƕ�ɨ��');
k=1;
for theta=angle_begin:angle_step:angle_end
    angle_result(k,1)=theta*180/pi;
    angle_result(k,2:3)=SPR_Function1(default_lumda,theta,default_thickness,e_metal,e_prism,e_sample);
    k=k+1;
end
disp('�Ƕ�ɨ����ϣ�');

%����ɨ��
disp('��ʼ����ɨ��');
k=1;
for lumda=length_begin:length_step:length_end
    length_result(k,1)=lumda*10^9;
    e_metal=gold_permittivity(lumda);
    e_prism=prism_refractive_index(lumda);
    length_result(k,2:3)=SPR_Function1(lumda,default_angle,default_thickness,e_metal,e_prism,e_sample);
    k=k+1;
end
disp('����ɨ����ϣ�');

%*************************���ͼ��*************************
%�Ƕ�ɨ����
figure(1)
plot(angle_result(:,1),angle_result(:,2),'-k','color','b')
hold;
plot(angle_result(:,1),angle_result(:,3),'-k','color','r')

%����ɨ����
figure(2)
plot(length_result(:,1),length_result(:,2),'-k','color','b')
hold;
plot(length_result(:,1),length_result(:,3),'-k','color','r')

