function plot_heat
% plot the solution of the wave equation u_t =  u_xx  t>0
% u(x,0)=0 x<=0 ,  u(x,0)=1 x>0

% set parameters
xmax=3;
xmin=-xmax
tmin=0;
tmax=10;
nx = 500;  % number of steps in space
nt = 500;  % number of steps in time
td = 1;    % approx duration for the animation

% mesh vector
x = xmin + (xmax - xmin)* [0:nx]/nx;
t = tmin + (tmax - tmin)* [0:nt]/nt;

% set up figure window
clf
axis([xmin xmax tmin tmax 0 1])
axis manual
hold on  % cumulate graphics
xlabel('x')
ylabel('t')
zlabel('u')
campos([-5.3442  -55.3079    6.65110])
campos manual
% animation
for i = 1:nt+1 ;  % loop over timesteps
    ts = t(i)*ones(size(x));
    % solution
    u = 0.5*(1 + erf(x./(2*sqrt(ts))));
    plot3(x, ts, u)
    title(sprintf('A solution of the heat equation u_{t} = u_{xx}'))
    grid on
    drawnow
    pause(td/(nt+1));
end
for i = -5:0.5:5
    tt = (x/i).^2;  % x./sqrt(tt) = i
    u = 0.5*(1 + erf(i/2))*ones(size(x));
    tt= tt.*sign(u-0.5).*sign(x);
    plot3(x, tt, u,'k');
end
hold off
end
