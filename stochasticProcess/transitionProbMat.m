function [ Pt ] = transitionProbMat( r, t, K, P_hat )
%TRANSITIONPROBMAT computes the transition probability matrix
%   Pt = transitionProbMat(r, t, K, P_hat) computes the transition matrix
%   at time t
%   r: max rate
%   t: time t
%   K: upper bound of state space
%   P_hat: P_hat by probMat

Pt = zeros(size(P_hat, 1));
P_temp = eye(size(P_hat, 1));
for i=0:K
    Pt = Pt + exp(-r * t) * (r * t) ^ i / factorial(i) * P_temp;
    P_temp = P_temp * P_hat;
end