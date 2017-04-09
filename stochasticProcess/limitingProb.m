function [ P_limiting ] = limitingProb( rateMat )
%LIMITINGPROB computes the limiting probability for CTMC given rate matrix
%   P_limiting = limitingProb(rateMat) computes the probability of CTMC
%   given rate matrix
%   rateMat: rate matrix of CTMC

r = sum(rateMat, 2);
A = zeros(size(rateMat));
for i=1:size(A, 1)
    A(i, i) = r(i, 1);
end
A = A - rateMat';
A(size(A, 1), 1:size(A, 1)) = ones(1, size(A, 1));
b = zeros(size(A, 1), 1);
b(size(A, 1), 1) = 1;

P_limiting = linsolve(A, b);
end

