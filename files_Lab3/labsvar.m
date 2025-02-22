

% 1.1 ----------------------------------------

load('spectra.mat'); % Ladda spektraldata

R = ones(size(wavelength)); % Ideal vit yta (100% reflektans)

% Beräkna vitpunkten för CIED65
XYZ_D65 = spectra2xyz(R, CIED65); 

% Visa resultatet
disp('Beräknad vitpunkt för CIED65:');
disp(XYZ_D65);

% Jämför med teoretiska värden
% XYZ_theoretical = [95.04, 100, 108.88]; 
% disp('Teoretiska värden för vitpunkten:');
% disp(XYZ_theoretical);

% Beräkna skillnaden mellan beräknade och teoretiska värden
% diff = XYZ_D65 - XYZ_theoretical;
% disp('Skillnad mellan beräknade och teoretiska värden:');
% disp(diff);

%% 1.2 ----------------------------------------------

% Ladda spektrala data
load('spectra.mat'); 

% Beräkna XYZ för R1 och R2 under CIED65-belysning
[X_R1, Y_R1, Z_R1] = spectra2xyz(R1, CIED65);
[X_R2, Y_R2, Z_R2] = spectra2xyz(R2, CIED65);

% Visa resultaten separat
disp('XYZ-värden för R1 under CIED65:');
disp(['X = ', num2str(X_R1)]);
disp(['Y = ', num2str(Y_R1)]);
disp(['Z = ', num2str(Z_R1)]);

disp('XYZ-värden för R2 under CIED65:');
disp(['X = ', num2str(X_R2)]);
disp(['Y = ', num2str(Y_R2)]);
disp(['Z = ', num2str(Z_R2)]);

% Plotta reflektansfunktionerna
% figure;
% plot(wavelength, R1, 'b', 'LineWidth', 2); % R1 i blått
% hold on;
% plot(wavelength, R2, 'r', 'LineWidth', 2); % R2 i rött
% hold off;

% Lägg till etiketter och titel
% xlabel('Våglängd (nm)');
% ylabel('Reflektans');
% title('Reflektansspektra för R1 och R2');
% legend('R1', 'R2');
% grid on;

%% 1.3

% Ladda spektrala data
load('spectra.mat'); 

% Beräkna XYZ-värden för R1 och R2 under F11-belysning
[X_R1_F11, Y_R1_F11, Z_R1_F11] = spectra2xyz(R1, f11);
[X_R2_F11, Y_R2_F11, Z_R2_F11] = spectra2xyz(R2, f11);

% Visa resultaten separat
disp('XYZ-värden för R1 under F11:');
disp(['X = ', num2str(X_R1_F11)]);
disp(['Y = ', num2str(Y_R1_F11)]);
disp(['Z = ', num2str(Z_R1_F11)]);

disp('XYZ-värden för R2 under F11:');
disp(['X = ', num2str(X_R2_F11)]);
disp(['Y = ', num2str(Y_R2_F11)]);
disp(['Z = ', num2str(Z_R2_F11)]);


%% 1.4 Teorifråga

% Vad har hänt?
% När belysningen ändrades från CIED65 till F11, förändrades färgerna på objekten. 
% Vissa färger blev mer mättade, medan andra ändrade utseende. 
% Detta beror på att F11 har en icke-kontinuerlig spektralfördelning med endast tre smala våglängdsband.

% Vad kallas fenomenet?
% Detta fenomen kallas metamerism. Det innebär att färger kan se lika ut under en ljuskälla men olika under en annan. 
% Eftersom F11 har en begränsad spektral täckning, påverkas färgåtergivningen och vissa färger kan verka felaktiga eller mer mättade jämfört med dagsljus (CIED65).

%% 1.5 

% Ladda spektrala data
load('spectra.mat'); 

% XYZ-värden för objekten från uppgift 1.2 (under CIED65)
[X_R1_CIED65, Y_R1_CIED65, Z_R1_CIED65] = spectra2xyz(R1, CIED65);
[X_R2_CIED65, Y_R2_CIED65, Z_R2_CIED65] = spectra2xyz(R2, CIED65);

% XYZ-värden för objekten från uppgift 1.3 (under F11)
[X_R1_F11, Y_R1_F11, Z_R1_F11] = spectra2xyz(R1, f11);
[X_R2_F11, Y_R2_F11, Z_R2_F11] = spectra2xyz(R2, f11);

% Konvertera XYZ till RGB med myxyz2rgb
[R1_CIED65, G1_CIED65, B1_CIED65] = myxyz2rgb(X_R1_CIED65, Y_R1_CIED65, Z_R1_CIED65);
[R2_CIED65, G2_CIED65, B2_CIED65] = myxyz2rgb(X_R2_CIED65, Y_R2_CIED65, Z_R2_CIED65);
[R1_F11, G1_F11, B1_F11] = myxyz2rgb(X_R1_F11, Y_R1_F11, Z_R1_F11);
[R2_F11, G2_F11, B2_F11] = myxyz2rgb(X_R2_F11, Y_R2_F11, Z_R2_F11);

% Skapa en färgkarta med de fyra RGB-värdena
map = [
    R1_CIED65, G1_CIED65, B1_CIED65;  % R1 under CIED65
    R2_CIED65, G2_CIED65, B2_CIED65;  % R2 under CIED65
    R1_F11, G1_F11, B1_F11;           % R1 under F11
    R2_F11, G2_F11, B2_F11            % R2 under F11
];

% Klipp RGB-värden så att de ligger inom [0,1]
map = min(1, max(0, map));

% Skapa och visa bilden med de fyra färgerna
figure;
image([1 2; 3 4]);
colormap(map);
axis off;
title('Färgåtergivning av R1 och R2 under CIED65 och F11');

% har sparat bilden manuellt och döpte den till fargatergivningR1R2

%% 1.6 Teorifråga

% Färgmatchningsfunktionerna 
% 𝑥(𝜆), 𝑦(𝜆) och 𝑧(𝜆) beskriver hur det mänskliga ögat uppfattar ljus vid olika våglängder. 
% De representerar ögats tre tappreceptorer:

% 𝑥(𝜆) motsvarar röd känslighet.
% 𝑦(𝜆) motsvarar grön känslighet och bestämmer ljushet.
% 𝑧(𝜆) motsvarar blå känslighet.
%Dessa funktioner används i CIEXYZ-systemet för att beräkna tristimulusvärden, 
% vilket gör det möjligt att kvantifiera färg matematiskt.

%% 1.7 Teorifråga

% CIE Y-värdet för en ljuskälla är alltid 100 eftersom normaliseringsfaktorn 𝑘 i ekvation 1.4 säkerställer detta.
% Y-värdet representerar ljusstyrka, och för en helt vit yta är Y = 100 per definition. 
% Detta gör att vi kan jämföra färger och ljuskällor konsekvent i CIEXYZ-färgsystemet.

%% 2.1

% XYZ-värden från tabellen
X_paper = 80.43; Y_paper = 84.00; Z_paper = 96.50;
X_cyan_magenta = 7.40; Y_cyan_magenta = 5.74; Z_cyan_magenta = 40.36;

% Dot-on-dot (50% papper, 50% cyan + magenta)------
X_on = 0.5 * X_paper + 0.5 * X_cyan_magenta;
Y_on = 0.5 * Y_paper + 0.5 * Y_cyan_magenta;
Z_on = 0.5 * Z_paper + 0.5 * Z_cyan_magenta;

disp('XYZ för Dot-on-Dot:');
disp([X_on, Y_on, Z_on]);

% XYZ-värden från tabellen
X_cyan = 25.84; Y_cyan = 42.52; Z_cyan = 80.88;
X_magenta = 37.36; Y_magenta = 18.44; Z_magenta = 27.52;

% Dot-off-dot (50% cyan, 50% magenta) ----------
X_off = 0.5 * X_cyan + 0.5 * X_magenta;
Y_off = 0.5 * Y_cyan + 0.5 * Y_magenta;
Z_off = 0.5 * Z_cyan + 0.5 * Z_magenta;

disp('XYZ för Dot-off-Dot:');
disp([X_off, Y_off, Z_off]);

%% 2.2

% Ladda spektrala data
load('spectra.mat'); 

% XYZ-värden från tabellen
XYZ_none = [80.43, 84.00, 96.50];
XYZ_cyan = [25.84, 42.52, 80.88];
XYZ_magenta = [37.36, 18.44, 27.52];
XYZ_cyan_magenta = [7.40, 5.74, 40.36];

% Tidigare beräknade värden för Dot-on-dot och Dot-off-dot
XYZ_dot_on = [X_on, Y_on, Z_on];
XYZ_dot_off = [X_off, Y_off, Z_off];

% Konvertera XYZ till RGB
[R_none, G_none, B_none] = myxyz2rgb(XYZ_none(1), XYZ_none(2), XYZ_none(3));
[R_cyan, G_cyan, B_cyan] = myxyz2rgb(XYZ_cyan(1), XYZ_cyan(2), XYZ_cyan(3));
[R_magenta, G_magenta, B_magenta] = myxyz2rgb(XYZ_magenta(1), XYZ_magenta(2), XYZ_magenta(3));
[R_cyan_mag, G_cyan_mag, B_cyan_mag] = myxyz2rgb(XYZ_cyan_magenta(1), XYZ_cyan_magenta(2), XYZ_cyan_magenta(3));
[R_dot_on, G_dot_on, B_dot_on] = myxyz2rgb(XYZ_dot_on(1), XYZ_dot_on(2), XYZ_dot_on(3));
[R_dot_off, G_dot_off, B_dot_off] = myxyz2rgb(XYZ_dot_off(1), XYZ_dot_off(2), XYZ_dot_off(3));

% Skapa en färgkarta med de sex RGB-värdena
map = [
    R_none, G_none, B_none;   % Inget tryck (Papper)
    R_cyan, G_cyan, B_cyan;   % Cyan
    R_magenta, G_magenta, B_magenta; % Magenta
    R_cyan_mag, G_cyan_mag, B_cyan_mag; % Cyan & Magenta
    R_dot_on, G_dot_on, B_dot_on; % Dot-on-dot
    R_dot_off, G_dot_off, B_dot_off % Dot-off-dot
];

% Klipp RGB-värden så att de ligger inom [0,1]
map = min(1, max(0, map));

% Skapa och visa bilden med de sex färgerna
figure;
image([1 2 3; 4 5 6]);
colormap(map);
axis off;
title('Färgåtergivning av tryckmetoder');
saveas(gcf, 'color_map_tryck.png')

% Finns det en märkbar skillnad mellan dot-on-dot och dot-off-dot?
% Ja, dot-on-dot (färgöverlagring) är mörkare än dot-off-dot.
% Vilken är mörkare och varför?
% Dot-on-dot är mörkare, eftersom cyan och magenta absorberar mer ljus när de överlappar.
% Vid dot-off-dot ligger cyan och magenta bredvid varandra, vilket reflekterar mer ljus.


%% 2.3 Teorifråga

% myxyz2rgb kan inte användas i alla applikationer eftersom den antar en specifik RGB-färgrymd och vitpunkt.
% Den är enhetsberoende eftersom XYZ är enhetsoberoende, 
% medan RGB beror på skärmens färgegenskaper. Om en annan skärm eller färgrymd används (t.ex. AdobeRGB istället för sRGB) kan färgerna bli felaktiga utan korrekt färgkalibrering.

%% 3.1

% Läs in CMYK-halvtonbilden
[C, M, Y, K] = tiffread('halftone.tif');

% Konvertera till RGB
[R, G, B] = cmyk2rgb(C, M, Y, K);

% Visa RGB-bilden
imshowrgb(R, G, B);
title('RGB-version av halvtonbilden');

% Visa individuella CMYK-kanaler
figure;
subplot(2,2,1); imshow(C); title('Cyan');
subplot(2,2,2); imshow(M); title('Magenta');
subplot(2,2,3); imshow(Y); title('Yellow');
subplot(2,2,4); imshow(K); title('Black');

% Välj centrerad del av CMYK-bilden (256x256)
C1 = C(129:384,129:384);
M1 = M(129:384,129:384);
Y1 = Y(129:384,129:384);
K1 = K(129:384,129:384);

% Beräkna fraktionell täckning med Demichel's ekvationer
fractional_coverage_test1 = Demichel_test(C1, M1, Y1, K1);

% Visa resultaten 
disp('Fraktionell täckning för Test 1 (centrerad sektion):');
disp(fractional_coverage_test1);

% Skiftar cyan-kanalen 10 pixlar nedåt
C2 = C(139:394,129:384); 
M2 = M(129:384,129:384);
Y2 = Y(129:384,129:384);
K2 = K(129:384,129:384);

% Beräkna fraktionell täckning för den skiftade bilden
fractional_coverage_test2 = Demichel_test(C2, M2, Y2, K2);

% Visa resultaten ( test 2 kanske fel värden)
disp('Fraktionell täckning för Test 2 (misregistration, cyan nedåt 10 pixlar):');
disp(fractional_coverage_test2);

%% 3.2 Teorifråga

% Demichels ekvationer fungerar väl för att uppskatta färgtäckning under idealförhållanden (utan misregistration), 
% men har begränsningar vid feljustering av färger (misregistration).
% Vid små förskjutningar ger modellen fortfarande rimliga resultat, 
% men vid större förskjutningar kan täckningsgraderna avvika kraftigt.
%Detta beror på att ekvationerna antar en perfekt geometrisk rasterplacering, 
% vilket inte alltid motsvarar verkliga tryckfel och mispassning mellan färgkanalerna.

%% 3.3 Teorifråga

% Om alla fyra tryckfärger hade samma rastervinkel, 
% skulle moiré-effekter uppstå, vilket skulle skapa synliga mönster och försämra färgåtergivningen.
% Demichels ekvationer skulle inte fungera korrekt i detta fall,
% eftersom de bygger på antagandet att färgseparationerna är slumpmässigt distribuerade. 
% När färgerna överlappar på ett förutsägbart sätt vid samma vinkel, 
% blir modellen ogiltig och kan inte korrekt beskriva fraktionell täckning.

%% 4.1 



