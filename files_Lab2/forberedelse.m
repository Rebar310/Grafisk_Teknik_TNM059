% I denna  fil svarar vi på alla frågor

% Förberedelseuppgifter 

% 1.a
T1 =[1 2 5 6; 
     3 4 7 8; 
     5 6 1 2 ; 
     7 8 3 4]/9;

% 1.b
T2 = [1 2 3 4;
     5 6 7 8;
     9 10 11 12;
     13 14 15 16] / 17;
% 1.c
bild = [0.2 0.3 0.1 0.1;
        0.4 0.5 0.1 0.1;
        0.6 0.7 0.1 0.9;
        0.5 0.9 0.4 0.4];

% Tröskelrastrering med T1
B1 = bild >= T1;

disp('Binär matris efter tröskelrastrering med T1:');
disp(B1);

% -------------------------------------------------------
% 2.a

% Vilken rastercellstorlek behövs för 10 gråtoner?
% En 2 × 2 rastercell ger:
% 2^2+1=5graåtoner(för lite)
% En 3 × 3 rastercell ger:
% 3^2+1=10 gråtoner (perfekt)

% 2.b

