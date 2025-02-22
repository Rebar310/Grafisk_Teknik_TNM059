function [C,M,Y,K] = rgb2cmyk(R,G,B)
% rgb2cmyk converts from RGB to CMYK colour space according to Equaiton 1.7
% in the lab material.

K = min(min(1-R,1-B),1-G);
C = (1-R-K)./(1-K);
M = (1-G-K)./(1-K);
Y = (1-B-K)./(1-K);