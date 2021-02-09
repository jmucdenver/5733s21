function [u,x]=bvp01(f,n)
% [u,x]=bvp(f,n)
% solve -u''=f, u(0)=u(1)=0 on uniform mesh x(0) to x(n+1)=1
% in
%   f  function handle
%   n  mesh size, nodes x(0)=0 to x(n+1)=1
% out
%   u  vector of solution values at nodes x
%   x  coordinates of the nodes

% Jan Mandel, Feb 8 2021

h=1/(n+1);
x=[1:n]'/(n+1); 
b=h*h*f(x);
e = ones(n,1);
A = spdiags([-e 2*e -e], -1:1, n, n);
u=A\b;
end
