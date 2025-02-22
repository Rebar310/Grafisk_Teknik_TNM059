% This function plots the CIELAB values for the twenty objects in chips20
% under three different illuminations, Tungsten60W (shown red), plank90K (shown blue)
% and CIED65 (shown black).
function plot_Lab
% This function plots the CIELAB values for the twenty objects in chips20
% under three different illuminations, Tungsten60W (shown red), plank90K (shown blue)
% and CIED65 (shown black). The CIELAB for the light sources are shown
% using green circles.
load spectra
xyz2=xyz(5:65,:);
illum=[Tungsten60W(5:65,:),plank90K(5:65,:),CIED65(5:65,:)];

figure
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
        
        [L,a,b] = myxyz2lab([XYZ(i,1),XYZ(i,2),XYZ(i,3)],XYZn);
        
        if j==1
            col='r*';
            col2='ro';
        elseif j==2
            col='b+';
            col2='bo';
        else
            col='kx';
            col2='ko';
        end
        plot3(a,b,L,col)
        hold on
    end
    [L,a,b] = myxyz2lab([XYZn(1),XYZn(2),XYZn(3)],XYZn);
    plot3(a,b,L,col2)
    
    % Create zlabel
    zlabel('L');
    
    % Create ylabel
    ylabel('b');
    
    % Create xlabel
    xlabel('a');
    
end
