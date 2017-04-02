function [ Mtime ] = uniformMtimeMat( R, T, epsilon )
%UNIFORMMTIMEMAT computes M(T) within a given numerical accuracy
%   Mtime = uniformMtimeMat(R, T, epsilon) computes occupancy time M(T) for
%   a CTMC with rate matrix R and numerical accuracy epsilon with Uniformi-
%   zation Algorithm.
%   R: rate matrix
%   T: time duration
%   epsilon: numerical accuracy

[r, P_hat] = probMat(R);
A = P_hat;
k = 0;
yek = exp(-r * T);
ygk = 1 - yek;
sum_ = ygk;
B = ygk * eye(size(R, 1));

while (sum_/r < T - epsilon)
    k = k + 1;
    yek = yek * (r * T) / k;
    ygk = ygk - yek;
    B = B + ygk * A;
    A = A * P_hat;
    sum_ = sum_ + ygk;
end

Mtime = B / r;

end

