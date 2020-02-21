function sinufit(t,y)

%Fits periodic data to a single-frequency function
%a0+a1*cos(omega*t)+a2*sin(omega*t).

n = length(y);      %Number of data points given.
mval = mean(y);     %Computes mean function value across time domain given.
yshift = y-mval;    %Shift function such that zero is the new mean value.
yshiftsign = sign(yshift);   %Determines sign of each shifted function value.

diff = zeros(1,n-1);
for i = 1:(n-1)
    diff(i) = yshiftsign(i+1)-yshiftsign(i);
end

tzeros = t(find(diff~=0));  

tzerosdiff = zeros(1,length(tzeros-1));
for i = 1:(length(tzeros)-1)
    tzerosdiff(i) = tzeros(i+1)-tzeros(i);
end

omega = pi/(sum(tzerosdiff)/(length(tzeros)-1));    %Computation of angular frequency.

A = [n                  sum(cos(omega*t))               sum(sin(omega*t)); ...
    sum(cos(omega*t))   sum((cos(omega*t)).^2)          sum(cos(omega*t).*sin(omega*t)); ...
    sum(sin(omega*t))   sum(cos(omega*t).*sin(omega*t)) sum((sin(omega*t)).^2)];    %Least-squares coeff. matrix.

b = [sum(y);    sum(y.*cos(omega*t));   sum(y.*sin(omega*t))];

x = A\b;    %Vector of coefficients for best-fit sinusoid.
fprintf('\n %0.4f \n %0.4f \n %0.4f \n',x)  %Display of fitted coefficients
fprintf('Omega = %0.4f\n',omega)    %Display of approximate overall frequency.

choice = menu('Show plot?','Yes','No');

switch choice
   case 1
      clf
      scatter(t,y,'k','filled')   %Plotting data
      hold on
      plot(t,(x(1)+x(2)*cos(omega*t)+x(3)*sin(omega*t)),'b')  %Adding plot of fitted function
      legend('Data','Fit')
   case 2
end

end

