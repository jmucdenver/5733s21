function heat_neumann(f,n,T,N)
% compute and display the solution of the Neumann problem for the 
% heat equation
% in:
% f  function handle, must return matrix same dimension
% n  number of cosine terms 
% T  length of the time interval
% N  number of points to display in x and in t
figure(1)
c=cos_fourier(f,n);
[xx,tt]=ndgrid(linspace(0,1,N),linspace(0,T,N));
sol=c(1)*ones(size(xx))*0.5;
k=0;
mins=0;maxs=eps;
figure(2)
% show
for k=1:n
    sol = sol + c(k+1)*exp(-(k*pi)^2*tt).*cos(k*pi*xx);
    tit=['n=',num2str(k)];
    show
end
tt_save=tt;
xx_save=xx;
sol_save=sol;
figure(3)
for t=2:N
    xx=xx_save(:,1:t);
    tt=tt_save(:,1:t);
    sol=sol_save(:,1:t);
    tit=['time=',num2str(tt(1,end))]
    show
end
% mesh(sol)
    function show
    mesh(xx,tt,sol)
    mins=min(min(sol(:)),mins);maxs=max(max(sol(:)),maxs);
    axis([0,1,0,T,mins,maxs])
    title(tit)
    xlabel('x')
    ylabel('time')
    zlabel('u')
    drawnow
    pause(0.5)
    end
end


