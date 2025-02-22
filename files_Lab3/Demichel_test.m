function out=Demichel_test(C,M,Y,K)
%
% out=Demichel_test(C,M,Y,K)
% This function calculates the fractional coverages using Demichel's
% equations.
% C, M, Y and K are the matrices of the same size, representing the Cyan,
% Magenta, Yellow and Black channels.
%
% out is a 16 x 1 matrix consisting of the fractional coverages for, No ink,
% Only C, Only M, Only Y, Only K, (C & M), (C & Y), (C & K), (M & Y), (M &
% K), (Y & K), (C & M & Y), (C & M & K), (C & Y & K), (M & Y & K), (C & M &
% Y & K).

[nr,nc]=size(C);

out(1,1)=sum(sum(~C  & ~M & ~Y & ~K))/(nr*nc);
out(2,1)=sum(sum(C   & ~M & ~Y & ~K))/(nr*nc);
out(3,1)=sum(sum(~C  &  M & ~Y & ~K))/(nr*nc);
out(4,1)=sum(sum(~C  & ~M &  Y & ~K))/(nr*nc);
out(5,1)=sum(sum(~C  & ~M & ~Y & K))/(nr*nc);
out(6,1)=sum(sum(C   &  M & ~Y & ~K))/(nr*nc);
out(7,1)=sum(sum(C   & ~M &  Y & ~K))/(nr*nc);
out(8,1)=sum(sum(C   & ~M & ~Y & K))/(nr*nc);
out(9,1)=sum(sum(~C  &  M &  Y & ~K))/(nr*nc);
out(10,1)=sum(sum(~C &  M & ~Y & K))/(nr*nc);
out(11,1)=sum(sum(~C & ~M &  Y & K))/(nr*nc);
out(12,1)=sum(sum(C  &  M &  Y & ~K))/(nr*nc);
out(13,1)=sum(sum(C  &  M & ~Y & K))/(nr*nc);
out(14,1)=sum(sum(C  & ~M &  Y & K))/(nr*nc);
out(15,1)=sum(sum(~C &  M &  Y & K))/(nr*nc);
out(16,1)=sum(sum(C  &  M &  Y & K))/(nr*nc);






