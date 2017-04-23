tspan=[0,50];
x0=[0;0];
[tt,yy]=ode45(@DxDt,tspan,x0);
plot(tt,yy(:,1),'-k')
xlabel('t'),ylabel('theta'),title('theta-t')
%plot(yy(:,1),yy(:,2),'-k')
%xlabel('x'),ylabel('v'),title('œ‡ŒªÕº')