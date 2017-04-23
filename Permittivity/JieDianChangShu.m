x=0.01:0.01:500;
y=0.01:0.01:1;
a=8.854187817*10^(-12);
b=pi;
n=1;
spot=zeros(length(x)*100,3);
for i=1:1:50000
    for j=1:1:100
        spot(n,1)=x(1,i);
        spot(n,2)=y(1,j);
        spot(n,3)=2*a*sqrt(x(1,i))/b*(log(b*sqrt(x(1,i))/y(1,j)+1)+1);
        n=n+1;
    end
end

for k=1:1:length(spot(:,1))
    R=spot(k,1)/500;
    G=spot(k,2);
    B=spot(k,3)/spot(length(spot(:,1)),3);
    plot3(spot(k,1),spot(k,2),spot(k,3),'o','color',[R,G,B]);
    k
    hold on;
end