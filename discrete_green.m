e=ones(n,1);h=1/(n+1);A=spdiags([-e,2*e,-e],[-1:1],n,n)/h^2;A=full(A);norm(inv(A),inf)