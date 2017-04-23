%***********************����workspace**********************
save('current.mat');
disp('����workspace......');
clear;
disp('����workspace��ϣ�');

%************************�趨ɨ������************************
angle_step=0.001;%�Ƕ�ɨ�貽��
angle_scan=[30,85];
angle_begin=angle_scan(1,1)/180*pi;
angle_end=angle_scan(1,2)/180*pi;

length_step=1*10^(-9);%����ɨ�貽��
length_scan=[300,1600];%��λnm,�������䣺300��1700
length_begin=length_scan(1,1)*10^(-9);%��λm
length_end=length_scan(1,2)*10^(-9);%��λm

%*************************������ʼ��*************************
%��Ĥ���ȱʡֵ
default_thickness=50*10^(-9);%��λm
%��Ĥ��糣��
%e_metal=-12.997+1.0341i;
e_metal=-25+1.44i;%����P30 gold��糣��
%�⾵�����ʡ���糣��
n_prism=1.515;
e_prism=n_prism^2;
%������Ʒ�����ʡ���糣��
%default_n_sample=1;%ȱʡֵ
default_n_sample=1.329;%����P30
e_sample=default_n_sample^2;

%***********************�������������ʼ��**********************
%�Ƕ�ɨ��ά������
j=(angle_end-angle_begin)/angle_step;
if (j-round(j))>0
    length1=round(j)+1;
else
    length1=round(j);
end
x_result=zeros(length1,1);

%����ɨ��ά������
j=(length_end-length_begin)/length_step;
if (j-round(j))>0
    length2=round(j)+1;
else
    length2=round(j);
end
y_result=zeros(length2,1);

TM_result=zeros(length2,length1);
TE_result=zeros(length2,length1);

%************************��ʼɨ��************************
j=1;
for theta=angle_begin:angle_step:angle_end %�Ƕ�ɨ��
    x_result(j,1)=theta*180/pi;
    k=1;
    for lumda=length_begin:length_step:length_end %����ɨ��
        y_result(k,1)=lumda*10^9;
        e_metal=gold_permittivity(lumda);
        e_prism=prism_refractive_index(lumda);
        R=SPR_Function1(lumda,theta,default_thickness,e_metal,e_prism,e_sample);
        TM_result(k,j)=R(1,1);
        TE_result(k,j)=R(1,2);
        k=k+1;
    end
    disp(j);
    j=j+1;
end

%*************************���ͼ��*************************
%ͼ�����
fontSize=15;
%***********************TM-ɨ����**********************
figure(1)
surf(x_result(:,1),y_result(:,1),TM_result);
xlabel('\theta(��)'),ylabel('\lambda(nm)'),zlabel('Reflectivity'),title('SPR Result-TM Mode');
set(gca,'FontSize',fontSize);
hold;
saveas(gcf,'SPR Result-TM-01.jpg');

figure(2)
surf(x_result(:,1),y_result(:,1),TM_result,'EdgeColor','none');
xlabel('\theta(��)'),ylabel('\lambda(nm)'),zlabel('Reflectivity'),title('SPR Result-TM Mode');
set(gca,'FontSize',fontSize);
hold;
saveas(gcf,'SPR Result-TM-02.jpg');
%***********************TE-ɨ����**********************
figure(3)
surf(x_result(:,1),y_result(:,1),TE_result);
xlabel('\theta(��)'),ylabel('\lambda(nm)'),zlabel('Reflectivity'),title('SPR Result-TE Mode');
set(gca,'FontSize',fontSize);
hold;
saveas(gcf,'SPR Result-TE-01.jpg');

figure(4)
surf(x_result(:,1),y_result(:,1),TE_result,'EdgeColor','none');
xlabel('\theta(��)'),ylabel('\lambda(nm)'),zlabel('Reflectivity'),title('SPR Result-TE Mode');
set(gca,'FontSize',fontSize);
hold;
saveas(gcf,'SPR Result-TE-02.jpg');

