function showRGB_20
% This function displays the colors of the twenty objects in chips20
% under three different illuminations, Tungsten60W, plank90K 
% and CIED65 (shown black). 
load spectra
xyz2=xyz(5:65,:);
illum=[Tungsten60W(5:65,:),plank90K(5:65,:),CIED65(5:65,:)];


for j=1:3
    illumination=illum(:,j);
    k=100/sum(illumination.*xyz2(:,2));
    for i=1:20
        reflectance=chips20(i,:)';
        XYZ(i,1)=k*sum(reflectance.*illumination.*xyz2(:,1));
        XYZ(i,2)=k*sum(reflectance.*illumination.*xyz2(:,2));
        XYZ(i,3)=k*sum(reflectance.*illumination.*xyz2(:,3));
    end
    
    [r,g,b] = myxyz2rgb(XYZ(:,1),XYZ(:,2),XYZ(:,3));
    
    rgb=[r,g,b];
    
    showRGB(rgb)
    
end