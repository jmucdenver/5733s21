function heat_exp(f,n,T)
% finite differences for the heat equation on (0,1) - explicit method
% f function handle
% n points in x
% T max time
% nt points
dx=1/(n+1)
dt=0.50*dx*dx
r=dt/(dx*dx)
nt=ceil(T/dt);
v=zeros(1,n+2);
% vnew=v;
v=f(dx*[0:n+1]);
t=0;
x=dx*[0:n+1];
one=ones(1,n+2);
figure(gcf),clf, hold off   % clear and show figure window
for m=1:nt+1
    plot3(x,t*one,v),xlabel('x'),ylabel('t'),zlabel('v'),grid on,drawnow,hold on
    t = t+dt;
    % need indexing from 1:n+2 instead 0:n+1
    vnew=zeros(1,n+2);
    for j=2:n+1
        vnew(j) = v(j) + dt * (v(j-1)-2*v(j)+v(j+1))/(dx*dx);
    end
    v=vnew;
end
hold off
end