function permittivity = gold_permittivity(wavelength)
  load('gold_refractive_index.mat');%加载金的折射率数据库
  volume=size(gold,1);%计算数据库容量
  wavelength=wavelength*10^6;%转换单位为微米
  for j=1:1:volume
    if wavelength<gold(j,1)
      up(1,1:2)=gold(j,4:5);
      down(1,1:2)=gold(j-1,4:5);
      wavelength_band=gold(j,1)-gold(j-1,1);
      wavelength_distance=wavelength-gold(j-1,1);
      real_part=down(1,1)+(up(1,1)-down(1,1))*wavelength_distance/wavelength_band;
      imaginary_part=down(1,2)+(up(1,2)-down(1,2))*wavelength_distance/wavelength_band;
      permittivity=real_part+imaginary_part*1i;
      break;%得到结果后结束循环
    else
      continue;
    end
  end
end
