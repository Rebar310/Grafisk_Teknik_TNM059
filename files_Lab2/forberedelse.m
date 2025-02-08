% I denna  fil svarar vi på alla frågor

% Förberedelseuppgifter 

% 1a)

% Skapa en 4x4 tröskelmatris för 9 grånivåer (normaliserad)
threshold_matrix_9 = [0  3  6  8;
                      4  1  7  5;
                      9  2  4  3;
                      6  8  0  7] / 8;  % Normalisera genom att dela med maxvärdet (8)

% Visa matrisen
disp('4x4 Tröskelmatris för 9 grånivåer:');
disp(threshold_matrix_9);

% 1b)

% 4x4 Tröskelmatris för 17 grånivåer (linjeraster, normaliserad korrekt)
threshold_matrix_17 = [ 0  8  2 10;
                        12  4 14  6;
                        3 11  1  9;
                        15  7 13  5] / 15; % Korrekt normalisering
disp('Korrigerad Tröskelmatris för 17 grånivåer:');
disp(threshold_matrix_17);

% 1c)

% Läs in en gråskalebild
img = imread('example_image.png'); % Byt ut mot din bild
img = double(rgb2gray(img)) / 255; % Konvertera till gråskala och normalisera

% Anropa troskel.m med tröskelmatrisen för 9 grånivåer
binarized_img_9 = troskel(img, threshold_matrix_9);

% Anropa troskel.m med tröskelmatrisen för 17 grånivåer
binarized_img_17 = troskel(img, threshold_matrix_17);

% Visa resultatet
figure;
subplot(1,3,1); imshow(img); title('Originalbild');
subplot(1,3,2); imshow(binarized_img_9); title('Tröskelrastrering (9 grånivåer)');
subplot(1,3,3); imshow(binarized_img_17); title('Tröskelrastrering (17 grånivåer)');


