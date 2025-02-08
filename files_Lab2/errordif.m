function out=errordif(in,filt)

% ***********************************************************
% out=errordif(in,filt)
%
% "in" är den originala gråskalebilden.
% "out" är den rastrerade bilden.
% "filt" är felfiltret.
%
% "errordif" rastrerar inbilden med felspridningsmetoden.
% Felfiltret måste också presenteras som en matris som är minst 2 x 3 stor. 
% T. ex. felfiltret Floyd-Steinberg som finns i Figur 3.19a (sidan 29) 
% i kompendiet kan presenteras enligt:
%
% filt=[0 0 7;
%       3 5 1]/16;
%
% Observera att felfiltret ska vara minst 2 x 3 stort, och den sista nollan
% i rad 1 anger positionen för x i felfiltren. T.ex. om du ska presentera ett
% filter som ska sprida felet åt höger med vikten 0.3 och nerår med vikten
% 0.7, dvs. detta filter, [ x   0.3
%                          0.7     ], i den här funktionen bör du definiera
% det enligt:
%
% filt=[0  0    0.3;
%       0  0.7   0
%*************************************************************
[nr,nc]=size(in);
[nrf,ncf]=size(filt);
x=floor(ncf/2);
out=ones(nr+nrf-1,nc+ncf-1);
in1=out;
in1(1:nr,1+x:nc+x)=in;

for i=1:nr
   for j=1+x:nc+x
      out(i,j)= in1(i,j)>=0.5;
      e=out(i,j)-in1(i,j);
      
      in1(i:i+nrf-1,j-x:j+x)=in1(i:i+nrf-1,j-x:j+x)-e*filt;
   end;
end;

out=out(1:nr,1+x:nc+x);