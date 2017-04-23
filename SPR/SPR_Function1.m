function R = SPR_Function1(lumda,in,q,em,ep,ed)

%******************************变量说明*********************************
%lumda--入射光波长、in--入射角、q--金膜厚度
%em--金膜介电常数实部 ep--棱镜介电常数 ed--待测液体介电常数
%SPR_FUNCTION1 Summary of this function goes here
%*******坐标系说明：x-界面法向 z-平行于界面 y-垂直于纸面向上*******

%**************************中间量初始化******************************
pow=power(2*pi/lumda,2);
k_z=sqrt(ep)*2*pi*sin(in)/lumda;
k_z2=k_z*k_z;
k_mx=sqrt(pow*em-k_z2);
k_px=sqrt(pow*ep-k_z2);
k_dx=sqrt(pow*ed-k_z2);
%*********************************************************************

%**************************计算TM（p）波******************************
r_pm=(em*k_px-ep*k_mx)/(em*k_px+ep*k_mx);
r_md=(ed*k_mx-em*k_dx)/(ed*k_mx+em*k_dx);
r_pmd=(r_pm+r_md*exp(2*1i*k_mx*q))/(1+r_pm*r_md*exp(2*1i*k_mx*q));
RTM=power(abs(r_pmd),2);
%********************************************************************

%**************************计算TE（s）波*****************************
r_pm=(k_px-k_mx)/(k_px+k_mx);
r_md=(k_mx-k_dx)/(k_mx+k_dx);
r_pmd=(r_pm+r_md*exp(2*1i*k_mx*q))/(1+r_pm*r_md*exp(2*1i*k_mx*q));
RTE=power(abs(r_pmd),2);
%********************************************************************

%输出结果
R=[RTM,RTE];
end

