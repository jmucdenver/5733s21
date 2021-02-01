% run plot_wave

f=@(x)sin(x);
f2=@(x)sin(4*x);
g=@(x)sin(x);
z=@(x)0*x;

input('sine wave left\n press enter when ready') 
plot_wave( f,z   ,1,-5,5,0,10)
input('sine wave right\n press enter when ready')
plot_wave( z,g   ,1,-5,5,0,10)
input('superposition\n press enter when ready')
plot_wave( f,g   ,1,-5,5,0,10)

input('sine wave left\n press enter when ready') 
plot_wave( f2,z   ,1,-5,5,0,10)
input('sine wave right\n press enter when ready')
plot_wave( z,g   ,1,-5,5,0,10)
input('superposition\n press enter when ready')
plot_wave( f2,g   ,1,-5,5,0,10)
