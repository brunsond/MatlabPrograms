function r = bisect(f,a,b,p)
%The function bisect approximates the root of function f to p correct
%decimal places.
test = f(a)*f(b);
switch sign(test)
    case 1
    fprintf('ERROR. Function f has no root in the interval [%0.4f %0.4f].\n',[a b])
    otherwise
    errorcond = 0.5*10^(-p);    %Error target
    c = 0.5*(a+b); %Initial bisection
    delta = 0.5*(b-a); %Initial uncertainty
    iter = 0;   %Zeroth iteration
    while errorcond<delta
        if f(c)==0
        break
        elseif f(a)*f(c)<0
        a = a; b = c;
        c = 0.5*(a+b);
        delta = 0.5*(b-a);
        else
        a = c; b = b;
        c = 0.5*(a+b);
        delta = 0.5*(b-a);
        end
        iter = iter+1;
    end
    r = c;  %Approximation of root.
    %The following code is for displaying the root.
    digits(p)
    disp('The root approximation is:')
    disp(vpa(r))  
    digits(32)
    fprintf('Total Iterations: %0.4f\n',iter)
end
end



