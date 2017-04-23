function [ permittivity ] = prism_refractive_index( wavelength )
%PRISM_REFRACTIVE_INDEX Summary of this function goes here
%��������������Ĳ�������λm�������⾵�Ľ�糣����
%�����Ҫ�õ������ʣ��ɸ���n=sqrt(permittivity)�޸ģ�
%   Detailed explanation goes here
wavelength=wavelength*10^6;%ת����λΪ΢��
l=power(wavelength,2);
item1=1.1515019*l/(l-0.010598413);
item2=0.118583612*l/(l+0.011822519);
item3=1.126301359*l/(l-129.617662);
permittivity=item1+item2+item3+1;
end

