function wave_bvp(f,g,n,T,nx,nt)
% compute and display the solution of the Neumann problem for the 
% heat equation
% in:
% f  function handle, must return matrix same dimension
% n  number of sine terms 
% T  length of the time interval
% nx  number of points to display in x
% nt  number of points to display in x

figure(1)
% fourier sine expansion
a=sin_fourier(f,n);
figure(2)
b=sin_fourier(g,n);
[xx,tt]=ndgrid(linspace(0,1,nx),linspace(0,T,nt));
sol=zeros(size(xx));
k=0;
mins=0;maxs=eps;
figure(3)
for k=1:n
    sol = sol + sin(k*pi*xx).*(a(k+1)*cos(k*pi*tt)+b(k+1)*sin(k*pi*tt)/(k*pi));
    tit=['solution with n=',num2str(k),' Fourier terms'];
    show
    % disp('>');pause;
end
tt_save=tt;
xx_save=xx;
sol_save=sol;
figure(4)
for t=1:nt
    xx=xx_save(:,1:t);
    tt=tt_save(:,1:t);
    sol=sol_save(:,1:t);
    tit=['Solution up to time=',num2str(tt(1,end))]
    show
end
% mesh(sol)
    function show
    if size(tt,2)>1
        mesh(xx,tt,sol)
    else
        plot3(xx,tt,sol)
    end
    mins=min(min(sol(:)),mins);maxs=max(max(sol(:)),maxs);
    axis([0,1,0,T,mins,maxs])
    axis equal
    title(tit)
    xlabel('x')
    ylabel('time')
    zlabel('u')
    drawnow
    pause(0.5)
    end
end


