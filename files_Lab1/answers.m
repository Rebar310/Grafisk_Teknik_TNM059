%% Fråga 1.1

a = 5;         % Bytes 8, class double
% whos a
b = uint8(a);  % Bytes 1, class uint8
% whos b

% a/4 = 1.2500
% b/4 = 1       avrunder till närmaste heltal vilket blir 1
% b/12 = 0      eftersom b/12 egentligen blir 0.333 så avrundar den till 0

% svaret avrundas till närmaste heltal om det inte är i exakt binärt format

%% Fråga 1.2

k = imread('kvarn.tif');
% whos k
% minneskrav för k = 512x512x1(byte) = 262144 bytes

k2 = double(k);
% whos k2
% minneskrav för k2 = 512x512x8(byte) = 2 097 152 bytes

% minnesskilldnad = 2097152-262144 = 1 835 008

%% Fråga 1.3

%imshow(k); % visar bilden korrekt
% För uint8-bilder: imshow tolkar bildens värden mellan 0 och 255, 
% där 0 motsvarar svart och 255 motsvarar vitt. Värdena i bilden kommer att tolkas och visas i det intervallet.

%imshow(k2); % visar en helvit bild
% För double-bilder: imshow tolkar bildens värden mellan 0 och 1, där 0 motsvarar svart och 1 motsvarar vitt. 
% Om värdena i en double-bild är större än 1, kommer dessa värden att tolkas som vitt, 
% vilket innebär att bilder med värden större än 1 kommer att visas som helvita.

%% Fråga 1.4

%imshow(k/225) % denna blir helt svart
% När du delar k med 255, kommer divisionen att ge resultat i decimalformat. 
% Men eftersom k är en uint8-bild, utförs divisionen också på ett sätt som resulterar i heltalsvärden efter avrundning. 
% Detta betyder att värden som är mindre än 255 (men större än 0) kommer att avrundas till 0, 
% och endast de pixelvärden som är exakt 255 kommer att bli 1. Alla andra värden kommer att avrundas till 0.

%imshow(k2/225) % denna blir nu rätt bild
%När du konverterade k till double, bildades en ny bild k2 där varje pixelvärde är ett flyttal mellan 0 och 255 (i double-format).
%När du delar k2 med 255, sker divisionen utan att avrundas till heltal eftersom k2 är av datatypen double. 
% Därmed behålls alla decimaler som resulterar från divisionen.

%% Fråga 2.1

map = [1 1 0;    % Gult (Röd + Grön)
       1 0 0;    % Röd
       0 1 1;    % Cyan (Grön + Blå)
       0.2 0.2 0.2; % Mörkgrå
       1 0 1;    % Magenta (Röd + Blå)
       0.7 0.7 0.7]; % Ljusgrå

image([1, 2, 3; 4, 5, 6])   % Rutmönster (2x3)
colormap(map)                % Använd definierad färgpalett

%%  Fråga 3.1

N=[1 2 3; 4 5 6; 7 8 9; 10 11 12; 13 14 15];
N(1:3:end, 1) % hämta var tredje rad, med start från 1 till slutet, kolumn 1
N(1:3:end, :) % -||- , hämta alla kolumner

%% Fråga 3.2
% .* står för elementvis multiplikation
% För att elementvisa operationer ska kunna utföras måste matriserna vara exakt lika stora 
v1=[1, 1, 1, 1];
v2=[0.5, 0.25, 0, 0.25];
v3=[0.25, 0.5, 0, 0.5, 1];

s1=sum(v1 .* v2) 
% s2=sum(v1 .* v3)  % denna funkar ej då vektorerna inte är lika stora

%% 4.1

m6=[1 2 3; 4 5 6; 7 8 9];
m7=[-2 3 1; 0 2 -7; 1 3 6];

% 1 = sant, 0 = falskt

u1= m6>3 % kollar varje element i vektorn om det är större än 3, om ja så blir det en etta
u2= (m6 > 3 & m7==-7)
u3= (m6 > 3 | m7==-7)
u4= ( (m6+m7) >= 4 & m6>5)

%% 5.1

% Läs in färgbilden och konvertera till double och normera
fargbild = imread('Butterfly.tif');  % Läs in bilden
fargbild = im2double(fargbild);      % Konvertera till double och normera mellan 0 och 1

% Konvertera RGB till gråskalebild (genom att ta medelvärdet av R, G och B)
mygray = (fargbild(:, :, 1) + fargbild(:, :, 2) + fargbild(:, :, 3)) / 3;

% Visa den gråskalebild som skapats
imshow(mygray);

% Om du vill spara den gråskalebild som en .png-fil
imwrite(mygray, 'mygray.png');


%% 6.

% Sampla ner mygray från uppgift 5.1
b61 = mygray(1:2:end, 1:2:end);

% Läs in bilden mygray
mygray = imread('mygray.png');  % Om bilden finns på den angivna platsen

% Gör om bilden till en dubbeltyp och normalisera till intervallet [0,1]
mygray = double(mygray) / 255;

% Använd samplaner-funktionen för att sampla ner bilden
b62 = samplaner(mygray);

% Visa den ursprungliga och den nedsamplade bilden
figure;
subplot(1,2,1);
imshow(mygray);
title('Originalbild (mygray)');

subplot(1,2,2);
imshow(b62);
title('Nedsamplad bild (b62)');

% Storlekskontroll
size_b1 = size(b61)
size_original = size(mygray)
size_downsampled = size(b62)

% 6.3
b63_nearest = imresize(b61, size(mygray), 'nearest');
%Här samplas bilden upp med hjälp av nearest neighbor interpolation till 
% samma storlek som originalbilden.

b63_linear = imresize(b61, size(mygray), 'bilinear');
%Denna rad använder bilineär interpolation för att sampla upp bilden.

b63_cubic = imresize(b61, size(mygray), 'bicubic');
% Här används bicubisk interpolation, vilket ger en mer komplex 
% beräkning för att uppskatta pixelvärden.

% Visa de tre uppsamplade bilderna
figure;

subplot(2, 2, 1);
imshow(b63_nearest);
title('Nearest Neighbor Interpolation');

subplot(2, 2, 2);
imshow(b63_linear);
title('Bilinear Interpolation');

subplot(2, 2, 3);
imshow(b63_cubic);
title('Bicubic Interpolation');

subplot(2, 2, 4);
imshow(mygray);
title('Originalbild');

%% 6.4

% Läs in färgbilden och normalisera till intervallet [0, 1]
mycolorimage = imread('Butterfly.tif');
mycolorimage = double(mycolorimage) / 255;

b64_down = imresize(mycolorimage, 0.5, 'nearest');

b64_up = imresize(b64_down, 2, 'nearest');

% Visa originalbilden och den rekonstruerade bilden
figure;
subplot(1, 2, 1);
imshow(mycolorimage);
title('Originalbild (mycolorimage)');

subplot(1, 2, 2);
imshow(b64_up);
title('Rekonstruerad bild (b64)');

% 6.5

% Separera de tre kanalerna (R, G, B)
R = mycolorimage(:, :, 1);
G = mycolorimage(:, :, 2);
B = mycolorimage(:, :, 3);

% Sampla ner R och B med faktor 0.5
R2 = imresize(R, 0.5, 'nearest');
B2 = imresize(B, 0.5, 'nearest');

% Sampla upp R2 och B2 med faktor 2 för att få tillbaka originalstorleken
R2 = imresize(R2, 2, 'nearest');
B2 = imresize(B2, 2, 'nearest');

% Återskapa den nyskapade bilden
b65 = cat(3, R2, G, B2);

% Visa den ursprungliga och rekonstruerade bilden
figure;
subplot(1, 2, 1);
imshow(mycolorimage);
title('Originalbild (mycolorimage)');

subplot(1, 2, 2);
imshow(b65);
title('Rekonstruerad bild (b65)');

% 6.6

