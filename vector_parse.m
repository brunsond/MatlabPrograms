% For some applications, it might be useful to produce a large vector of data in Matlab
% and then cut and paste this vector into a Fortran program for subsequent computation.
% The problem is that for manual array creation in Fortran, numbers in the array must
% be comma-delimited, and continuing to define the array to the next line requires the & 
% at the end of the previous line.  

% This program takes in a vector, reshapes it, parses it with commas and & where needed, and prints it
% to the Matlab command window.  The user may then easily cut and paste the vector into Fortran.

% Adapted from gariepy answer to question on stack overflow:
% https://stackoverflow.com/questions/37739899/how-to-separate-the-elements-of-a-matrix-with-comma-in-matlab

function vector_parse(v)  %v is input vector

n = length(v);

if n == 1
    fprintf('[%0.20g]\n',v)
else
    if length(v) <= 4
        M = reshape(v,n,1);
        fprintf('[')
        fprintf('%.20g,&\n',M(1:(end-1)))
        fprintf('%.20g]\n',M(end))
    else
        if mod(n,3)==0  % Number of elements of v is divisible by 3.
            M = reshape(v,n/3,3);
            fprintf('[')
            fprintf('%.20g,%0.20g,%0.20g,&\n',M(1:(end-3),:))   %Vector continues to next line every three values.
            fprintf('%.20g,%0.20g,%0.20g]\n',M(end,:))
        else
            numrows = floor(n/3);
            M = reshape(v(1:numrows*3),numrows,3);
            fprintf('[')
            fprintf('%.20g,%0.20g,%0.20g,&\n',M)    %Vector continues to next line every three values.
            R = v(numrows*3+1:end);  %Remainder of vector.
            if length(R) == 1
                fprintf('%0.20g]\n',R)
            else
                fprintf('%0.20g,%0.20g]\n',R)
            end
        end
    end
end
    
end

