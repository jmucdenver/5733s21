function w=laplace_h(v)
% w=laplace_h(v)
% input:
%    v grid values on 0:n+1 by 0:n+1 grid on [0,1]x[0,1]
%      stored in array size (n+2,n+2)
% output:
%    w grid values -laplace operator(v) at interior nodes
%      stored in array size (n+1,n+1) using indices 2:n+1
[m2,n2]=size(v);
if m2 ~=n2, error('need square grid'),end
n=n2-2;
h = 1/(n+1);  % n+2 nodes 0, h, ... , n*h, 1 = (n+1)*h
w = zeros(n,n);
for j=2:n+1
    for k=2:n+1
        % core computations:
        w(j,k)=(1/h^2)*(4*v(j,k)-v(j+1,k)-v(j-1,k)-v(j,k+1)-v(j,k-1));
    end
end
end 