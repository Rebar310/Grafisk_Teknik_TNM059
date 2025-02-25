
% Uppgift 1.1 -----------------------------------

I = imread('kvarn.tif'); % Läs in bilden
I = double(I) / 255; % Normera bilden till intervallet [0,1]

b11 = I >= 0.5;
imwrite(b11, 'b11.tif', 'Resolution', 150);

% Eftersom vi har en binär bild där varje pixel endast kan 
% vara svart (0) eller vit (1), betyder det att bilden representerar 2 grånivåer.

%% 1.2 ------------------------------------------

load('troskelmatriser.mat'); % Ladda tröskelmatriserna tr1, tr2, tr3
disp(tr1); % Visa tröskelmatris 1
disp(tr2); % Visa tröskelmatris 2

num_gray_levels_tr1 = numel(unique(tr1));
num_gray_levels_tr2 = numel(unique(tr2));

tr1 = tr1 / max(tr1(:)); % Normera tr1
tr2 = tr2 / max(tr2(:)); % Normera tr2

% Denna bilden kommer vi använda fler gånger
I = imread('kvarn.tif'); % Läs in bilden
I = double(I) / 255; % Normera bilden till intervallet [0,1]

b12_tr1 = troskel(I, tr1);
b12_tr2 = troskel(I, tr2);

imwrite(b12_tr1, 'b12_tr1.tif', 'Resolution', 150);
imwrite(b12_tr2, 'b12_tr2.tif', 'Resolution', 150);

% Om tr1 har färre unika värden, betyder det att den producerar färre grånivåer, 
% vilket leder till mer tydliga rasterpunkter.
% Om tr2 har fler nivåer, blir övergångarna i bilden mjukare.
% Mindre tröskelmatris → större rasterpunkter, lägre upplösning.
% Större tröskelmatris → mindre rasterpunkter, högre upplösning

% 1.3 -----------------------------------------

disp(tr3); % Visa tröskelmatrisen tr3

%räkna gråskalenivåer
num_gray_levels_tr3 = numel(unique(tr3));

tr3 = tr3 / max(tr3(:)); % Normera tr3
b13 = troskel(I, tr3);
imwrite(b13, 'b13.tif', 'Resolution', 150);

% Om tr3 har en större matrisstorlek än tr2 → Mindre rasterpunkter och högre detalj.
% Om tr3 har färre nivåer → Större rasterpunkter och mer grovt mönster.

% Om tr3 använder en annan fördelning av tröskelvärden, kan rasterpunkterna placeras annorlunda,
% t.ex. linjära mönster, cirkulära rasterpunkter, eller en mer oregelbunden struktur.

% 1.4 ---------------------------------------------

% Linjeraster innebär att tröskelvärdena är strukturerade i rader, vilket skapar horisontella linjer i rasterbilden
tr_linjeraster = [  1  2  3  4;
                    5  6  7  8;
                    9 10 11 12;
                   13 14 15 16] / 17; % Normerad till [0,1]
%normering 16 eller 17?
% Spiralraster innebär att tröskelvärdena följer en spiralformad ordning:
tr_spiralraster = [  6  7  8  9;
                      5  1  2 10;
                      4 12  3 11;
                     16 15 14 13] / 17; % Normerad till [0,1]

% Rastera bilden med de nya tröskelmatriserna
b14_linjeraster = troskel(I, tr_linjeraster);
b14_spiralraster = troskel(I, tr_spiralraster);

% spara bilderna
imwrite(b14_linjeraster, 'b14_linjeraster.tif', 'Resolution', 150);
imwrite(b14_spiralraster, 'b14_spiralraster.tif', 'Resolution', 150);

% 1.5  ------------ Teorifrågor ------------

% ??? Hur relateras tröskelmatrisens storlek till LPI?
% (LPI = Lines Per Inch, dvs. linjer per tum i rastertryck)

% Storleken på en tröskelmatris påverkar linjetätheten (LPI) i rasterbilder 
% genom att bestämma storleken på rastercellerna. En större tröskelmatris skapar större rasterpunkter, 
% vilket innebär att färre rasterpunkter får plats per tum och därmed leder till ett lägre LPI. 
% Å andra sidan ger en mindre tröskelmatris mindre rasterpunkter, vilket resulterar i ett högre LPI eftersom fler rasterpunkter får plats på samma yta.

% 1.6 
% ??? Givet en tröskelmatris: Förklara hur man tar reda på antalet grånivåer som tröskelmatrisen 
% representerar. Ledning: läs sidan 16 (speciellt sista stycket) i kompendiet

% Antalet grånivåer som en tröskelmatris kan representera beror på antalet unika värden i matrisen. 
% Genom att räkna antalet unika tröskelvärden och addera ett får man det totala antalet grånivåer som matrisen kan återge. 
% Ju fler unika värden tröskelmatrisen har, desto fler nyanser av grått kan rasterbilden återge, vilket påverkar bildens detaljrikedom och tonalitet.

%% 2.1 ---------------------------------------------------------------------

I = imread('kvarn.tif'); % Läs in bilden
I = double(I) / 255; % Normera bilden till intervallet [0,1]

b21 = tabellrast(I);
imwrite(b21, 'b21.tif', 'Resolution', 150);

num_gray_levels = numel(unique(b21));

%% 2.2 ------------------------------------------------------------------

I = imread('kvarn.tif'); % Läs in bilden
I = double(I) / 255; % Normera bilden till intervallet [0,1]

b22 = tabellrast2(I);
imwrite(b22, 'b22.tif', 'Resolution', 150);

% 2.3 Teori uppgift-----------------------------------------------

% Skillnaden mellan de två tabellrastreringarna, trots att båda använder en 4 × 4 rastertabell 
% och därmed kan representera samma antal grånivåer, ligger i hur tröskelvärdena i rastertabellen 
% är strukturerade och applicerade på bilden.

% I b21 (genererad med tabellrast) påverkar tabellens specifika utformning placeringen av rasterpunkterna 
% på ett sätt som kan ge en jämnare fördelning av nyanser, medan b22 (genererad med tabellrast2) använder 
% en annan tabellstruktur, vilket kan resultera i en annorlunda visuell textur och mönster i rasterpunkternas fördelning.

% Den största skillnaden är att olika rastertabeller leder till olika mönster i rasterbilden,
% även om antalet grånivåer är detsamma. Detta innebär att kontrasten, detaljåtergivningen och 
% hur tydliga rasterpunkterna är kan skilja sig mellan de två bilderna, vilket kan ses genom att 
% studera placeringen av ljusare och mörkare punkter i respektive bild.

% 2.4 -----------------------------------------------------------------

b24 = tabellrast3(I);
imwrite(b24, 'b24.tif', 'Resolution', 150);

% kolla grånivåer ( 16 olika?? ) 
num_gray_levels = numel(unique(b24));

% Hur stor blir den nya bilden? (dubbelt)
[orig_height, orig_width] = size(I);
[new_height, new_width] = size(b24);

% Funktionen tabellrast3 använder 2 × 2 omgivningar i inbilden som index till en 4 × 4 rastertabell.
% Detta innebär att varje ursprunglig pixel blir en 2 × 2 block av pixlar i den rastrerade bilden.
% Om originalbilden är 512 × 512 pixlar, och varje pixel expanderas till en 2 × 2 rastercell, blir resultatbilden 1024 × 1024 pixlar.
% Detta beror på att varje pixel i originalbilden skapar 4 nya pixlar i den rastrerade bilden.

% 3.1 ------------------------------------------------

floyd_steinberg = [0 0 7; 3 5 1] / 16; % checka kompendiet 
b31 = errordif(I, floyd_steinberg);
imwrite(b31, 'b31.tif', 'Resolution', 150);

% 3.2 ----------------------------------------------------

jarvis_judice_ninke = [0 0 0 7 5; 3 5 7 5 3; 1 3 5 3 1] / 48; % checka kompendiet
b32 = errordif(I, jarvis_judice_ninke);
imwrite(b32, 'b32.tif', 'Resolution', 150);

% 3.3 (Teori) -------------------------------------------------

% Skillnaderna mellan bilderna b31 (Floyd-Steinberg) och b32 (Jarvis, Judice och Ninke) 
% ligger främst i hur felet sprids över bildytan, vilket påverkar skärpa, 
% detaljåtergivning och förekomst av störande strukturer.

% Bilden b31, som använder Floyd-Steinberg-metoden, tenderar att vara skarpare eftersom felet 
% sprids över färre pixlar, vilket bibehåller mer av de ursprungliga detaljerna i bilden. 
% Dock kan denna metod introducera mer synliga störande strukturer i ljusa delar och mellantonsområden, 
% särskilt i homogena ytor där ditheringseffekten kan bli tydlig och skapa ett kornigt utseende.

% Bilden b32, som använder Jarvis, Judice och Ninke-metoden, har en mjukare övergång mellan toner 
% eftersom felet sprids över ett större område. Detta gör att bilden ser mindre skarp ut men samtidigt minskar 
% synliga artefakter i ljusa områden och mellantoner. Störningar i homogena ytor blir ofta mindre tydliga, 
% men eftersom fler pixlar påverkas av felet kan vissa partier få en lätt suddig effekt.

% Sammanfattningsvis är b31 skarpare men kan ha mer synliga störningar i jämna ytor, 
% medan b32 har en mjukare tonövergång och färre artefakter, men kan verka något suddigare.

%% 3.4 -------------------------------------------------------------------
I = imread('kvarn.tif'); % Läs in originalbilden
I = double(I) / 255; % Normera pixelvärden till [0,1]

% ( denna inte helt fungerande ännu)

filter1 = [0 0 1; 0 0 0]; % Felet sprids endast åt höger
filter2 = [0 0 0.5; 0.5 0 0]; % Felet sprids åt höger och nedåt

b34_1 = errordif(I, filter1); % Rastrering med filter 1
b34_2 = errordif(I, filter2); % Rastrering med filter 2

imwrite(b34_1, 'b34_1.tif', 'Resolution', 150);
imwrite(b34_2, 'b34_2.tif', 'Resolution', 150);

% Filter 1 sprider felet endast åt höger.
% Filter 2 sprider felet åt höger och nedåt.

% 3.5 (Teori )-------------------------------------------------------------
% dubbelkolla i kompendiet

% Ormmönster uppstår när felspridningsalgoritmen skapar slingrande eller vågiga mönster i bilden.
% Syns mest i mellantoner där dithering är aktiv men pixelvariationerna är subtila.
% Detta sker eftersom felet sprids systematiskt, vilket ibland kan skapa regelbundna, men oönskade, kurviga mönster som ögat lätt uppfattar.

% Bandning innebär att övergångar mellan olika gråskalor blir onaturligt skarpa och stegvisa, istället för en jämn gradient.
% Syns mest i skuggor och högdagrar, där övergångar i bildens ljusare eller mörkare områden blir mer distinkta än de borde vara.
% Eftersom dithering fördelar felet, kan det leda till att vissa områden samlar för mycket av en viss ton, vilket skapar tydliga steg (band) istället för mjuka övergångar.

%% 3.6 ----------------------------------------------------------

I = imread('kvarn.tif'); % Läs in originalbilden
I = double(I) / 255; % Normera pixelvärden till [0,1]

k = 0.1; % Justerbar brusnivå (experimentera med olika värden mellan 0 och 1)
brus = (rand(size(I)) - 0.5) * k; % Genererar brus i intervallet [-k/2, k/2]

I_brus = I + brus; % Lägg till bruset till inbilden
I_brus = max(0, min(1, I_brus)); % Se till att inga pixelvärden går utanför [0,1]

floyd_steinberg = [0 0 7; 3 5 1] / 16;
b36 = errordif(I_brus, floyd_steinberg);

imwrite(b36, 'b36.tif', 'Resolution', 150);

% Om k ≈ 0, liknar bilden b31, där artefakter som ormmönster och bandning är tydliga.
% Om k ≈ 1, blir ditheringen mycket brusig och förlorar kvalitet.
% En bra balans brukar hittas runt k = 0.05 till 0.2 beroende på bilden

%% 4.0 -----------------------------------------------

I = imread('kvarn.tif'); % Läs in originalbilden
I = double(I) / 255; % Normera pixelvärden till [0,1]

b40 = imcdp(I);
imwrite(b40, 'b40.tif', 'Resolution', 150);

% Skärpa
% IMCDP (b40) bevarar skarpare detaljer och har en mer kontrollerad placering av rasterpunkter.
% Floyd-Steinberg (b31) tenderar att ha mer utsmetade detaljer pga. den slumpmässiga spridningen av felet.

%Minskning av artefakter
% IMCDP (b40) hanterar artefakter bättre och undviker tydliga ormmönster och bandning.
% Floyd-Steinberg (b31) kan ha mer synliga ditheringmönster, särskilt i homogena områden.

% Struktur och tonalitet
% IMCDP (b40) kontrollerar punktplaceringen iterativt, vilket gör att övergångarna i bilden blir jämnare.
% Floyd-Steinberg (b31) kan ibland ge ett mer slumpmässigt brus i mellantoner

%% 5.1 -------------------------------------------------------------------

I = imread('kvarn.tif'); % Läs in originalbilden
I = double(I) / 255; % Normera pixelvärden till [0,1]

b11 = imread('b11.tif'); % Enkel tröskling
b31 = imread('b31.tif'); % Floyd-Steinberg
b40 = imread('b40.tif'); % IMCDP

b11 = double(b11) / 255;
b31 = double(b31) / 255;
b40 = double(b40) / 255;

noise_b11 = I - b11;
noise_b31 = I - b31;
noise_b40 = I - b40;

snr_b11 = mysnr(I, noise_b11);
snr_b31 = mysnr(I, noise_b31);
snr_b40 = mysnr(I, noise_b40);



%% 5.2 ------------------------------------------------

I = imread('kvarn.tif'); % Läs in originalbilden
I = double(I) / 255; % Normera pixelvärden till [0,1]

b11 = imread('b11.tif'); % Enkel tröskling
b31 = imread('b31.tif'); % Floyd-Steinberg
b40 = imread('b40.tif'); % IMCDP

b11 = double(b11) / 255;
b31 = double(b31) / 255;
b40 = double(b40) / 255;

noise_b11 = I - b11;
noise_b31 = I - b31;
noise_b40 = I - b40;

snr_b11_filtered = snr_filter(I, noise_b11);
snr_b31_filtered = snr_filter(I, noise_b31);
snr_b40_filtered = snr_filter(I, noise_b40);


%% 5.3 ----------------------------------------------------

I = imread('kvarn.tif'); % Läs in originalbilden
I = double(I) / 255; % Normera pixelvärden till [0,1]

b11 = imread('b11.tif'); % Enkel tröskling
b31 = imread('b31.tif'); % Floyd-Steinberg
b40 = imread('b40.tif'); % IMCDP

b11 = double(b11) / 255;
b31 = double(b31) / 255;
b40 = double(b40) / 255;

qns_b11 = QNS(I, b11);
qns_b31 = QNS(I, b31);
qns_b40 = QNS(I, b40);

imwrite(qns_b11, 'qns_b11.tif', 'Resolution', 150);
imwrite(qns_b31, 'qns_b31.tif', 'Resolution', 150);
imwrite(qns_b40, 'qns_b40.tif', 'Resolution', 150);

%% Del 3 Färgraster 
% test 1

I = imread('musicians.tif'); % Läs in färgbilden
I = double(I) / 255; % Normalisera till [0,1]

b_errordif = fargraster(I, 'errordif'); % Rastrering med felspridning
b_imcdp = fargraster(I, 'imcdp'); % Rastrering med IMCDP

% Visa resultaten
figure, imshow(b_errordif), title('Färgrastrering med felspridning');
figure, imshow(b_imcdp), title('Färgrastrering med IMCDP');

% Spara resultaten
imwrite(b_errordif, 'musicians_errordif.tif', 'Resolution', 150);
imwrite(b_imcdp, 'musicians_imcdp.tif', 'Resolution', 150);

%% test 2
I = imread('Butterfly.tif');
I = double(I) / 255; % Normalisera till [0,1]

b_errordif = fargraster(I, 'errordif');
b_imcdp = fargraster(I, 'imcdp');

figure, imshow(b_errordif), title('Butterfly - Felspridning');
figure, imshow(b_imcdp), title('Butterfly - IMCDP');

imwrite(b_errordif, 'Butterfly_errordif.tif', 'Resolution', 150);
imwrite(b_imcdp, 'Butterfly_imcdp.tif', 'Resolution', 150);


