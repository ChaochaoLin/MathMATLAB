function [ R ] = rateMat( lambda, mu, H, M )
%RATEMAT computes the rate matrix for Call Center Model
%   R = rateMat(lambda, mu, H, M) computes the rate matrix for Call Centre
%   Model
%   lambda: arrival rate
%   mu: death rate
%   H: on-hold capacity
%   M: number of clerks

K = M + H;
R = zeros(K + 1);
for i=0:K-1
    R(i+1, i+2) = lambda;
end

for i=1:K
    R(i+1,i) = mu * min(i, M);
end
end

