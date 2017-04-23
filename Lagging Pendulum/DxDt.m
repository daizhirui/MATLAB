function xdot=DxDt(t,y)
zn=0.2;omg0=4*pi*pi;gm=1;omg=pi*pi;
xdot=[y(2);-2*zn*y(2)-omg0*sin(y(1))+gm*omg0*cos(omg*t)];