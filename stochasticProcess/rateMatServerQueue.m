function [ rateMat ] = rateMatServerQueue( lambda, mu, n )
%RATEMATSERVERQUEUE computes the rate matrix for a server queue model
%   [rateMat] = rateMatServerQueue(lambda, mu, n)
%   lambda: birth rate
%   mu: death rate
%   n: state space space, including 0
rateMat = zeros(n);

for i=1:n-2
    rateMat(i + 1, i) = mu;
    rateMat(i + 1, i + 2) = lambda;
end
rateMat(1, 2) = lambda;
rateMat(n, n - 1) = mu;
end

