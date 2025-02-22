function plot_deltaE
% This function plots the deltaE color difference between the color of the twenty objects 
% in chips20 under Tungsten60W and plank90K (shown with blue), under Tungsten60W and CIED65 (shown with red) 
% and under plank90K and CIED65 (shown with black).

load spectra
xyz2=xyz(5:65,:);
illum=[Tungsten60W(5:65,:),plank90K(5:65,:),CIED65(5:65,:)];


for j=1:3
    illumination=illum(:,j);
    k=100/sum(illumination.*xyz2(:,2));
    XYZn(1)=k*sum(ones(61,1).*illumination.*xyz2(:,1));
    XYZn(2)=k*sum(ones(61,1).*illumination.*xyz2(:,2));
    XYZn(3)=k*sum(ones(61,1).*illumination.*xyz2(:,3));
    for i=1:20
        reflectance=chips20(i,:)';
        XYZ(i,1)=k*sum(reflectance.*illumination.*xyz2(:,1));
        XYZ(i,2)=k*sum(reflectance.*illumination.*xyz2(:,2));
        XYZ(i,3)=k*sum(reflectance.*illumination.*xyz2(:,3));
    end
    [L(:,j),a(:,j),b(:,j)] = myxyz2lab(XYZ,XYZn); 
    XYZ(20,:)

end

    L(20,:)
    a(20,:)
    b(20,:)
figure

deltaE1=sqrt((L(:,1)-L(:,2)).^2+(a(:,1)-a(:,2)).^2+(b(:,1)-b(:,2)).^2);
plot(1:20,deltaE1)
axis([1 20 0 22])
title('DeltaE color difference of 20 objects under different illuminaitons')
xlabel('Objects 1 to 20')
ylabel('deltaELab')
hold on
deltaE1=sqrt((L(:,1)-L(:,3)).^2+(a(:,1)-a(:,3)).^2+(b(:,1)-b(:,3)).^2);
plot(1:20,deltaE1,'r')

deltaE1=sqrt((L(:,2)-L(:,3)).^2+(a(:,2)-a(:,3)).^2+(b(:,2)-b(:,3)).^2);
plot(1:20,deltaE1,'k')
legend('Tungsten and plank90k','Tungsten and D65','plank90k and D65','Location','North')
