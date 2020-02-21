function [Lambda,V] = power_method(A)
% computes the eigenvalues and eigenvectors of matrix A.

[n,~] = size(A);
Lambda = zeros(n,1);    V = zeros(n,n);
count = 0;
lambda = 0; v = zeros(n,1);
v0_start = randn(n,1);
while (count < n)
    % deflate A as necessary.
    A = A - lambda*v*v';
    % apply power method.
    v0 = v0_start;
    v = A*v0; 
    err = norm(v0-v,2);
    iter = 1;   %computation of Av0 is first iteration.
    while (err>1e-15 && iter<1000)
       v0 = v/norm(v,2);
       v = A*v; v = v/norm(v,2);
       err = norm(v0-v,2);
       iter = iter + 1;
    end
    if (iter==1000)
        fprintf('Only %g eigs/eigvectors found\n',count)
        break
    end
    lambda = (v')*(A*v);
    count = count + 1;
    
    Lambda(count) = lambda;
    V(:,count) = v;
end

