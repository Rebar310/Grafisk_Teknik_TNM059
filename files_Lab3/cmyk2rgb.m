function [R,G,B] = cmyk2rgb(C,M,Y,K)
% cmyk2rgb converts from CMYK to RGB colour space according to Equaiton 1.8
% in the lab material.

R = (1-K).*(1-C);
G = (1-K).*(1-M);
B = (1-K).*(1-Y);