pb=7900;
po=960;
g=9.794;
d=1.003/1000;
u=0.92;
j=1;
for i=0:0.000001:0.005
    v(j,1)=i;
    v(j,2)=(pb-po)*g*d^2/18/u*(1-exp(-18*u*i/pb/d^2));
    v(j,3)=(pb-po)*g*d^2/18/u*(i+1/(18*u/pb/d^2)*(exp(-18*u*i/pb/d^2)-1));
    j=j+1;
end
figure(1);
plot(v(:,1),v(:,2),'-o');
xlabel('t/s');
ylabel('v/(m/s)');
set(gca,'Fontsize',20);
saveas(gcf,'falling speed.jpeg');
figure(2);
plot(v(:,1),v(:,3),'-o');
xlabel('t/s');
ylabel('x/m');
set(gca,'Fontsize',20);
saveas(gcf,'falling distance.jpeg');