function plot_wave(f,g,a,xmin,xmax,tmin,tmax)
% plot_wave(f,g,a,xmin,xmax,tmin,tmax)
% plot the solution 
% u(x,t) = f(x+a*t) - g(x-a*t)
% of the wave equation u_tt = a^2 u_xx
% in:
%   f,g function handles
%   a   propagation speed

% set parameters
nx = 500;  % number of steps in space
nt = 100;  % number of steps in time
td = 5;    % approx duration for the animation

% mesh vector
x = xmin + (xmax - xmin)* [0:nx]/nx;
t = tmin + (tmax - tmin)* [0:nt]/nt;

% min max values
umin=zeros(1,nt+1);
umax=zeros(1,nt+1);
for i = 1:nt+1 ;  % loop over timesteps
    ts = t(i)*ones(size(x));
    u = f(x + a*ts) + g(x - a*ts);
    umin(i)=min(u);
    umax(i)=max(u);
end
umin=min(umin);
umax=max(umax);
% set up figure window
clf
axis([xmin xmax tmin tmax umin umax])
axis manual
hold on  % cumulate graphics
xlabel('x')
ylabel('t')
zlabel('u')
campos([-16.0297  -20.3022   32.5022])
campos manual
% animation
for i = 1:nt+1 ;  % loop over timesteps
    ts = t(i)*ones(size(x));
    u = f(x + a*ts) + g(x - a*ts);
    plot3(x, ts, u)
    title(sprintf('A solution of the wave equation u_{tt} = %g u_{xx}',a))
    grid on
    drawnow
    pause(td/(nt+1));
end
hold off
end
