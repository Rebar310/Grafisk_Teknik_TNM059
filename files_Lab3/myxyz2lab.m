function [L,a,b]=myxyz2lab(XYZ,XYZn)
x=XYZ(:,1);
y=XYZ(:,2);
z=XYZ(:,3);

Xn = XYZn(1);
Yn = XYZn(2);
Zn = XYZn(3);

ylim = Yn*0.008856;
L = (y>ylim).*(116*(y/Yn).^(1/3)-16)+(y<=ylim).*(903.3*y/Yn);
ytemp = foo(y/Yn);
a = 500*(foo(x/Xn)-ytemp);
b = 200*(ytemp-foo(z/Zn));
end


function y = foo(x)


y=(x<=0.008856).*(7.787*x+16/116)+(x>0.008856).*x.^(1/3);
end
