function out=tabellrast3(in)
m=2;
n=4;
  [nr,nc]=size(in);
  
  ar=mod(nr,m);
  ac=mod(nc,m);
  
  ar1=(ar~=0)*(m-ar);
  ac1=(ac~=0)*(m-ac);
  
  in1=zeros(nr+ar1,nc+ac1);
  in1(1:nr,1:nc)=in;
 
 k=1;
  for i=1:m:nr+ar1
      l=1;
      for j=1:m:nc+ac1
          mm(k:k+n-1,l:l+n-1)=mean(mean(in1(i:i+m-1,j:j+m-1)));
          l=l+n;
          
      end
      k=k+n;
  end
  
  
tr=[1 9 3 11; 13 5 15 7; 4 12 2 10; 16 8 14 6]/17;
  out=troskel(mm,tr);
  
 