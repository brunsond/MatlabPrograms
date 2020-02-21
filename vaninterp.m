function ynew = vaninterp(a,xnew)

m = length(a'); 
n = length(xnew);
V = zeros(n,m);
ynew = zeros(1,n);
for i = 1:m
    V(:,i) = xnew.^(i-1);
end
for i = 1:n
    ynew(i) = sum(a'.*V(i,:));
end

end