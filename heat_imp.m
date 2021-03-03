function heat_imp(f,n,T)
% finite differences for the heat equation on (0,1) - explicit method
% f function handle
% n points in x
% T max time
% nt points
dx=1/(n+1)
dt=dx
nt=ceil(T/dt);
v=zeros(n+2,1);
vnew=v;
v(2:n+1)=f(dx*[1:n]);
t=0;
x=dx*[0:n+1]';
one=ones(size(v));
figure(gcf),clf, hold off   % clear and show figure window
C=dx*dx/dt;
A=spdiags(ones(n,1)*[-1,2+C,-1],[-1:1],n,n);
for m=1:nt+1
    plot3(x,t*one,v),xlabel('x'),ylabel('t'),zlabel('v'),grid on,drawnow,hold on
    t = t+dt;
    % need indexing from 1:n+2 instead 0:n+1
    % solve for j=2:n
    % vnew(j) = v(j) + (vnew(j-1)-2*vnew(j)+vnew(j+1))*(dt/(dx*dx));
    % C= (dx*dx)/dt
    % (-vnew(j-1)+(2+C)*vnew(j)-vnew(j+1))=v*C
    v(2:n+1)=A\v(2:n+1)*C;
end
hold off
end