tic;
disp('solve by \')
u = A\f;  
toc, tic;
disp('Cholesky without reordering')
R = chol(A);
nonz=nnz(R);
un = R\(R'\f);
err = norm(u-un,inf)
toc, tic;
disp('Cholesky with symrcm reordering')
q = symrcm(A);
R = chol(A(q,q));
nonz=nnz(R);
un = R\(R'\f);
un(q)=un;
err = norm(u-un,inf)
toc, tic;
