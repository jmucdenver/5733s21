n=9     % number of points in space dimension
dx=1/(n+1)
T=1;
N= 100;    % number of points in time dimension
dt = T/N
x = linspace(0,1,n+2);  % scale x
t = linspace(0,T,N+1);
[tt,xx]=ndgrid(x,t);

f = @(x) 3*sin(pi*x) + 5*sin(4*pi*x)

v = zeros(n+2,N+1);    % store the solution v at time m in v(2:n+1,m+1)
%
%
%   time m:      v(1,m+1)=0    solution .....                    v(n+2,m+1)=0  boundary value
%    
%   time 0:       v(1,1)=0    v(2,1)=f(dx)   v(3,1)=f(2*dx)....  v(n+1,1)=f(n*dx)∂  v(1,n+2)=0    boundary
%   

% set initial values
for j=1:n
    % set initial value at (j*dx,0) stored at v(j+1,1)
    
    v(j+1,1) = f(j*dx);
end
v_init=v(:,1);
plot(x,v_init)
title('initial value')

% difference formula

% loop over time steps
for m=0:N-1
    for j=1:n
        % set approx u(dx*j,(m+1)*dt) stored in v(j+1,m+2)
        v(j+1,m+2) = v(j+1,m+1) - (dt/dx^2)*(-v(j,m+1)+2*v(j+1,m+1)-v(j+2,m+1));
        mesh(xx,tt,v),ylabel('x'),xlabel('time')
        title('t=',num2str((m+1)*dt))
        drawnow
        pause(0.1)
    end
end

        