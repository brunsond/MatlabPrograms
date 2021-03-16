function P = partitions(m)
n = uint64(10000);
%Generate difference sequence.
seq = uint64(zeros(1,n-uint64(2)));
if mod(n-1,2)==0
    seq(1:2:end) = uint64(1):(n-uint64(1))/uint64(2);
    seq(2:2:end-1) = uint64(2)*seq(1:2:end-1) + uint64(1);
else
    seq(1:2:end) = uint64(1):(n-uint64(2))/uint64(2);
    seq(2:2:end) = uint64(2)*seq(1:2:end) + uint64(1);
end
%Generate plus-minus sequence.
pm = cumsum([1,seq])';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p = uint64([1,1]);
while (length(p) <= m)
    j = 0;
    el = length(p)+1;
    p(el) = 0;
    recur = sum(pm<length(p));
    for i = 1:recur
        if (j == 0 || j == 1)
            p(el) =  p(el)+p(el-pm(i));
        else
            p(el) =  p(el)-p(el-pm(i));
        end
        if (j == 3)
            j = 0;
        else
            j = j + 1;
        end
    end
end
P = uint64(p(end));