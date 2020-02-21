function [U,L] = UL(A)

n = length(A(:,1));
U = zeros(n,n);
for k = n:-1:2
    for i = k-1:-1:1
        U(i,k) = A(i,k)/A(k,k);
        for j = k-1:-1:1
            A(i,j) = A(i,j)-U(i,k)*A(k,j);
            A(i,k) = 0;
        end
    end
end

L = A;
U = U+eye(n);


end

