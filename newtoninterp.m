function ynew = newtoninterp(x,y,xnew)

n = length(x);
m = length(xnew);
%Calculating Newton polynomial coefficients (f(i) = f(x1,x2,...,x(i)))
F = zeros(n,n-1);
F(1,1) = y(1);
for i = 2:n
    F(i,1) = (y(i)-y(i-1))/(x(i)-x(i-1));
end

for j = 2:(n-1)
    for i = (j+1):n
        F(i,j) = (F(i,j-1)-F(i-1,j-1))/(x(i)-x(i-j));
    end
end

f = zeros(1,n);
f(1) = F(1,1);
for i = 2:n
    f(i) = F(i,i-1);
end

%Calculating ynew using Newton interpolating polynomial.
factor = (xnew-x(n-1)*ones(1,m))*f(n);
i = n-1;
while i>1
    factor = (xnew-x(i-1)*ones(1,m)).*(f(i)+factor);
    i = i-1;
end
ynew = f(1)+factor;



