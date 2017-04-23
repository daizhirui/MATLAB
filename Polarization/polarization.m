figure(1);
width=800;
height=800;
left=50;
bottem=50;
set(gcf,'position',[left,bottem,width,height])
M=hsv(8);
for i=0:1:7
    b=i*pi/12;
    for t=0:0.001:2*pi
        e=cos(b)*cos(t+pi/2);
        o=sin(b)*cos(t);
        plot(e,o,'o','color',M(i+1,:));
        hold on;
    end
end
xlabel('x','fontsize',20);
ylabel('y','fontsize',20);
saveas(gcf,'polarization.jpeg');