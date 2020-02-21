function Mmodel(xdata,ydata,xrange,varargin)
xvec = linspace(min(xrange),max(xrange),1000);  %x-values for plot
if size(xdata,1)>1
    x = xdata;
else
    x = xdata';
end
if size(ydata,1)>1
    y = ydata;
else
    y = ydata';
end
n = nargin-3;
A = zeros(length(xdata),n);
for i = 1:n
    basis = eval(varargin{i});
    A(:,i) = basis;
end
[Q,R] = qr(A,0);
solution = R\(Q'*y);    %Solved coefficients of mathematical model
r = norm((A*solution-y),2);
x = xvec';  %Substituting finer vector for x.
f = solution(1)*eval(varargin{1});
i = 1;
while i<n
    i = i+1;
    f = f+solution(i)*eval(varargin{i});
end
plot(xdata,ydata,'*k')
hold on
plot(x,f,'k','linewidth',2)
title('Mathematical Model')
xlabel('x')
ylabel('y')
legend('Data','Mathematical Model','location','best')
disp('Model Coefficients')
disp(solution)
disp('Residual')
disp(r)
end