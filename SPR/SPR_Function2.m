function [R] = SPR_Function2(lumda,in,q,em,ep,ed)
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
k_zm=2*pi*sqrt(em)/lumda*sin(in);

r_pm_TM=(em*k_px-ep*k_mx)/(em*k_px+ep*k_mx);
r_pm_TE=(k_px-k_mx)/(k_px+k_mx);

del_beta_TM=r_pm_TM*exp(2i*k_zm*q)*4*pi/lumda*power(ed*em/(ed+em),3/2)/(ed-em);
del_beta_TE=r_pm_TE*exp(2i*k_zm*q)*4*pi/lumda*power(ed*em/(ed+em),3/2)/(ed-em);

del_n_spef_TM=real(del_beta_TM*lumda/2/pi);
del_n_spef_TE=real(del_beta_TE*lumda/2/pi);

n_spef_TM=real(sqrt(ed*em/(ed+em)))+del_n_spef_TM;
n_spef_TE=real(sqrt(ed*em/(ed+em)))+del_n_spef_TE;

n_p=sqrt(ep);
beta_sp0=2*pi/lumda*sqrt(ed*em/(ed+em));
gama_i=imag(beta_sp0)*lumda/2/pi;

gama_rad_TM=imag(del_beta_TM)*lumda/2/pi;
gama_rad_TE=imag(del_beta_TE)*lumda/2/pi;
%*********************************************************************

RTM=1-4*gama_i*gama_rad_TM/(power(n_p*sin(in)-n_spef_TM,2)+power(gama_i+gama_rad_TM,2));
RTE=1-4*gama_i*gama_rad_TE/(power(n_p*sin(in)-n_spef_TE,2)+power(gama_i+gama_rad_TE,2));

R=[RTM,RTE];

end

