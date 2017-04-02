function [ r, P_hat ] = probMat( R )
%PROBMAT Compute P_hat using rate matrix R
%   [r, P_hat] = probMat(R) computes the max rate and P_hat given rate
%   matrix R

P_hat = zeros(size(R, 1));
r_i = sum(R, 2);
r = max(r_i);

for i=1:size(R, 1)
    for j=1:size(R, 1)
        if (i == j)
            P_hat(i, j) = 1 - r_i(i) / r;
        else
            P_hat(i, j) = R(i, j) / r;
        end
    end
end
end

