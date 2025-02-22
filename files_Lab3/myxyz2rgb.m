function [r,g,b] = myxyz2rgb(x,y,z)
% [r,g,b] = myxyz2rgb(x,y,z)
%
%This function converts the CIEXYZ values to RGB assuming a monitor with a
% white point close to CIED65.
% x, y, z are the vectors containg the X, Y and Z values
% r, g, b are the vetors containg the R, G and B values
[n,m] = size(x);

Q = [0.03240479 -0.01537150 -0.00498535; -0.00969256 0.01875992 0.00041556; 0.00055648 -0.00204043 0.01057311];

rgb=min(1,max(0,Q*[x(:)';y(:)';z(:)']));
r=reshape(rgb(1,:),n,m);
g=reshape(rgb(2,:),n,m);
b=reshape(rgb(3,:),n,m);
