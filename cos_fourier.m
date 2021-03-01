function c=cos_fourier(f,n)
% expand fuction f on [0,1] in fourier cosine series 
% in:
%   f  function handle
%   n  number of terms
% return:
%   c  fourier coefficients, c(k+1) stores coefficient k
for k=0:n
    c(k+1)=2*integral(@(x)f(x).*cos(k*pi*x),0,1);
end
% display
x=linspace(0,1,1000);
y=c(1)*ones(size(x))/2;
mins=0;maxs=eps;
for k=1:n
    y=y+c(k+1)*cos(k*pi*x);
    mins=min(min(y),mins);
    maxs=max(max(y),maxs);
    plot(x,y),title(['n=',num2str(n)])
    axis([0,1,mins,maxs])
    drawnow
    pause(0.1)
    err(k)=sqrt(sum((y-f(x)).*(y-f(x)))/length(x));
    disp(['k=',num2str(k),' L^2 norm error',num2str(err(k))])
    disp(['k=',num2str(k),' max norm error',num2str(max(abs(y-f(x))))])
    % hold on
end
hold off
end