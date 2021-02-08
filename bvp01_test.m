function bvp01_test(n)
% plot solution of -u''=(3*x + x.^2).*exp(x), u(0)=u(1)=0
% example 2.5 on n points mesh + boundary
% Jan Mandel, Feb 10 2020 
if ~exist('n')
    n=5;
end
f = @(x)(3*x + x.^2).*exp(x);
sol = @(x)x.*(1-x).*exp(x);
[u,x]=bvp01(f,n);
m=1000;
xx=[0:m+1]'/(m+1);
ss = sol(xx);
s = sol(x);
plot([0;x;1],[0;u;0],'o--',xx,ss,'-'); % boundary values not part of solution x
legend('numerical','exact')
err=max(abs(s-u));
title([num2str(n),' points error ',num2str(err)])
end