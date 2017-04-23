function R = SPR_Function1(lumda,in,q,em,ep,ed)

%******************************����˵��*********************************
%lumda--����Ⲩ����in--����ǡ�q--��Ĥ���
%em--��Ĥ��糣��ʵ�� ep--�⾵��糣�� ed--����Һ���糣��
%SPR_FUNCTION1 Summary of this function goes here
%*******����ϵ˵����x-���淨�� z-ƽ���ڽ��� y-��ֱ��ֽ������*******

%**************************�м�����ʼ��******************************
pow=power(2*pi/lumda,2);
k_z=sqrt(ep)*2*pi*sin(in)/lumda;
k_z2=k_z*k_z;
k_mx=sqrt(pow*em-k_z2);
k_px=sqrt(pow*ep-k_z2);
k_dx=sqrt(pow*ed-k_z2);
%*********************************************************************

%**************************����TM��p����******************************
r_pm=(em*k_px-ep*k_mx)/(em*k_px+ep*k_mx);
r_md=(ed*k_mx-em*k_dx)/(ed*k_mx+em*k_dx);
r_pmd=(r_pm+r_md*exp(2*1i*k_mx*q))/(1+r_pm*r_md*exp(2*1i*k_mx*q));
RTM=power(abs(r_pmd),2);
%********************************************************************

%**************************����TE��s����*****************************
r_pm=(k_px-k_mx)/(k_px+k_mx);
r_md=(k_mx-k_dx)/(k_mx+k_dx);
r_pmd=(r_pm+r_md*exp(2*1i*k_mx*q))/(1+r_pm*r_md*exp(2*1i*k_mx*q));
RTE=power(abs(r_pmd),2);
%********************************************************************

%������
R=[RTM,RTE];
end

