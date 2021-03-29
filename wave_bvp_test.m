function wave_bvp_test
a=100;
f=@(x)exp(-a*(x-0.5).^2);
g=@(x)-a*exp(-a*(x - 1/2).^2).*(2*x - 1);
T=2;
nx=400;
nt=200
n=20;
wave_bvp(f,g,n,T,nx,nt)
end
