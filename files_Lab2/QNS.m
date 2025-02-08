function out=QNS(org, rast);
%
% Finds and shows the QNS (quantization noise) for halftoned images in 
% the frequency domain.
%
% out=QNS(org, rast);
% 
% out is the QNS.
%
% org is the original image
%
% rast is the halftoned image

orgBild=org(16:end-15,16:end-15);
rastBild=rast(16:end-15,16:end-15);
% removes the possible artifacts from the edges of the halftone


bild_tot = fft2(orgBild-rastBild);
% fft2: Two-dimensional discrete Fourier transform
bild_tot = fftshift(bild_tot);
% fftshift: shift zero-frequency component of discrete Fourier to the
% center of the spectrum

out= (abs(bild_tot)).^2;
out=1-out/50000;
imshow(out)
% The lighter the pixels are shown, the smaller the pixel values are