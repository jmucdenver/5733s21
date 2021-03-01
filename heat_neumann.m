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
show
for k=1:n
    sol = sol + c(k+1)*exp(-(k*pi)^2*tt).*cos(k*pi*xx);
    show
end
    function show
    clf
    mesh(xx,tt,sol)
    mins=min(min(sol(:)),mins);maxs=max(max(sol(:)),maxs);
    axis([0,1,0,T,mins,maxs])
    title(['n=',num2str(k)])
    xlabel('x')
    ylabel('time')
    zlabel('u')
    drawnow
    input('>');
    end
end


