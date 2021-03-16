function p = factor_m(A)

%Factors a 2x2 nonnegative matrix with determinant 1 (except for the identity) into a unique
%product of the prime matrices given below by p1 and p2.

%p1 = [1,0;1,1]; p2 = [1,1;0,1];

B = A;
p = [];
while (~(B(1,1)==1 && B(1,2)==0 && B(2,1)==0 && B(2,2)==1))
    test1 = [1,0;-1,1]*B;
    test2 = double(logical(~rem(test1,1)));
    test3 = double(logical(test1>=0));
    if (test2(1,1)==1 && test2(1,2)==1 && test2(2,1)==1 && test2(2,2)==1 ...
        && test3(1,1)==1 && test3(1,2)==1 && test3(2,1)==1 && test3(2,2)==1 ...
        && test1(1,1)*test1(2,2)-test1(1,2)*test1(2,1)==1)
        B = [1,0;-1,1]*B;
        p = [p,1];
    else
        B = [1,-1;0,1]*B;
        p = [p,2];
    end
end



end

