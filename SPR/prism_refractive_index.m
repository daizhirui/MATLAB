function [ permittivity ] = prism_refractive_index( wavelength )
%PRISM_REFRACTIVE_INDEX Summary of this function goes here
%本函数根据输入的波长（单位m）返回棱镜的介电常数；
%如果需要得到折射率，可根据n=sqrt(permittivity)修改；
%   Detailed explanation goes here
wavelength=wavelength*10^6;%转换单位为微米
l=power(wavelength,2);
item1=1.1515019*l/(l-0.010598413);
item2=0.118583612*l/(l+0.011822519);
item3=1.126301359*l/(l-129.617662);
permittivity=item1+item2+item3+1;
end

