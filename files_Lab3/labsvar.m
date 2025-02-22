







% 1.1 ----------------------------------------

% Ladda in spektrala data
load('spectra.mat'); 

% Kontrollera tillgängliga variabler
whos 

% Sätt reflektansen till 1 för att simulera en ideal vit yta
R = ones(size(wavelength)); 

% Anropa spectra2xyz med rätt variabelnamn för CIED65
XYZ_D65 = spectra2xyz(CIED65, R, xyz, wavelength);

% Visa resultatet
disp('Beräknad vitpunkt för CIED65:');
disp(XYZ_D65);

% Jämför med de teoretiska värdena
XYZ_theoretical = [95.04, 100, 108.88]; 
disp('Teoretiska värden för vitpunkten:');
disp(XYZ_theoretical);

% Beräkna skillnaden mellan beräknade och teoretiska värden
diff = XYZ_D65 - XYZ_theoretical;
disp('Skillnad mellan beräknade och teoretiska värden:');
disp(diff);
