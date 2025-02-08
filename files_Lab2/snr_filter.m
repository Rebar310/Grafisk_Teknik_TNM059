function R=snr_filter(X,Y)

%   R = SNR(X, Y) computes the signal to noise ratio (SNR) in dB.
%   The signal X and the noise Y are first filtered by a filter
%   representing the eye.

f=MFTsp(15,0.0847,500);
% Denna funktion returnerar ett l�gpass filter som representerar �gat. I
% detta fall betraktningsavst�ndet har satts till 500 mm och punkternas
% storlek till 0.0847. Observera att punktens storlek motsvarar ett tryck
% i 300 dpi. (0.0847 = 1/300 * 25.4)


s=conv2(X,f);
% �gats filter �r applicerat till signalen (originalbilden)

n=conv2(Y,f);
% �gats filter �r applicerat till "noise"-en (skillnaden mellan originalbilden och rasterbilden)


R=mysnr(s,n);
% Man r�knar snr mellan signalen och noise-en efter att de har g�tt genom
% �gats filter
end

function f=MFTsp(N,d,dis)

% f=MFTsp(N,d,dis)
% N decides the size of the filter 
% d is the dot size, which is 0.0847 mm for 300 dpi
% dis is the viewing distance in mm 

F=MTF(N,d,dis);
F2=fftshift2(F);
f2=real(ifft2(F2));
f=fftshift(f2);
end


function M=MTF(N,DELTA,DIS);

%MTF(N,DELTA,DIS) generates the human modulation-transfer function (size NxN)
%	with the sample spacing DELTA and the viewing distance DIS. Thus, the
%	 MTF is given in image frequencies. (DELTA=the physical size of a pixel
%	in millimeters, DIS is also in millimeters)

%	From Sullivan, J. Opt. Soc. Am. - Vol. 10 - No. 8,
%	Implemented by Fredrik Nilsson 970724

a=2.2;
b=0.192;
c=0.114;
d=1.1;
w=0.7;
fmax=6;

M=zeros(N,N);
my=((N+1)/2);
mx=((N+1)/2);
for m=1:N
  for n=1:N
    f_i=sqrt((m-my)^2+(n-mx)^2)/(N*2*DELTA);
    %f_i in images frequencies! Max freq. (N-1)/(2*N*DELTA)
    %f_i should be divided with N*DELTA but to correspond to the figures
    %in Sullivans article, the extra term 2 is necessary

    f_v=(pi/180)*f_i/(asin(1/sqrt(1+DIS^2)));
    %f_v is in cycles per visual degree

    alpha=atan2((m-my),(n-mx));
    s=((1-w)/2)*cos(4*alpha)+((1+w)/2);
    %f_v is scaled with s to obtain the angular dependence
    f_v=f_v/s;

    if f_v>fmax
      M(m,n)=a*(b+c*f_v)*exp(-(c*f_v)^d);
    else
      M(m,n)=1;
    end;
  end;
end;
end

function out=fftshift2(in)

[nr, nc]=size(in);

out=zeros(nr,nc);
n=(nr+1)/2;

out(1:n,1:n)=in(n:2*n-1,n:2*n-1);
out(1:n,n+1:nr)=in(n:nc,1:n-1);

out(n+1:nr,1:n)=in(1:n-1,n:nc);
out(n+1:nr,n+1:nc)=in(1:n-1,1:n-1);
end
