function [Lambda,V,iter] = qr_iter(A,TOL,varargin)

% Returns the diagonal matrix of eigenvalues, Lambda, and the corresponding
% matrix of eigenvectors (columns) of the input matrix A using the
% QR-iteration algorithm.

switch nargin
    case 0
        disp('Error.  Not enough input arguments.')
        return
    case 1
        disp('Error.  Not enough input arguments.')
        return
    case 2
        %Apply qr iteration without shifts.
        [r,~] = size(A);
        V = eye(r);
        [Q,R] = qr(A);
        Aprime = R*Q;
        err = max(max(abs(Aprime-diag(diag(Aprime)))));
        V = V*Q;
        iter = 1;
        while (err>TOL && iter<50000)
            A = Aprime;
            [Q,R] = qr(A);
            Aprime = R*Q;   %Aprime converges to Lambda.
            err = max(max((abs(Aprime-diag(diag(Aprime))))));    %max off-diagonal element of iterate.
            V = V*Q;
            iter = iter + 1;
        end
        if (err>TOL)
            disp('Algorithm did not converge to desired tolerance.')
        end
        Lambda = Aprime;
        return
    case 3
        %Apply qr iteration with shifts.
        [r,~] = size(A);
        % compute Wilkinson shift.
        delta = 0.5*(A(r-1,r-1)-A(r,r));
        mu = A(end,end)-(sign(delta)*A(end-1,end)^2)/(abs(delta)+sqrt(delta^2+A(end-1,end)^2));
        % end compute shift.
        V = eye(r);
        [Q,R] = qr(A-mu*eye(r));
        Aprime = R*Q+mu*eye(r);
        err = max(max(abs(Aprime-diag(diag(Aprime)))));
        V = V*Q;
        iter = 1;
        while (err>TOL && iter<50000)
            A = Aprime;
            % compute Wilkinson shift.
            delta = 0.5*(A(r-1,r-1)-A(r,r));
            mu = A(end,end)-(sign(delta)*A(end-1,end)^2)/(abs(delta)+sqrt(delta^2+A(end-1,end)^2));
            [Q,R] = qr(A-mu*eye(r));
            Aprime = R*Q+mu*eye(r);   %Aprime converges to Lambda.
            err = max(max(abs(Aprime-diag(diag(Aprime)))));
            V = V*Q;
            iter = iter + 1;
        end
        if (err>TOL)
            disp('Algorithm did not converge to desired tolerance.')
        end
        Lambda = Aprime;
        return   
    otherwise
        disp('Error.  Too many input arguments.')
        return
end
            

end

