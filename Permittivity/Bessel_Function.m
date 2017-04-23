for m=0:1:10
    for i=0:1:10000
        z=i*0.001;
        J=besselj(m,z);
        F(m+1,i+1)=J;
    end
end