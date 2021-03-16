function t = totient(n)
%Fast evalutation of Euler totient function of integer n (number of values
%less than n which are relatively prime to n.
%Examples:
%totient(10)
%ans = 
%uint64
%4
%totient(5463765293)
%ans = 
%uint64
%4653956736
v = distinct(factor(n));
t = uint64(floor(n*prod((v-1))/prod(v)));
end
%Faster version of the built-in function 'unique' when applied to numeric
%arrays.
function vprime = distinct(v)
% vprime is a vector containing the distinct values in array v.
i = 1;
while (numel(v)>=1)
    vprime(i) = v(1); v = v(v>v(1)); i = i+1;
end
end
