function [X] = Normalizar(X)
mu = mean(X(:,2:end));
sig = std(X(:,2:end));
X(:,2:end) = (X(:,2:end) - repmat(mu,N,1))./ repmat(sig,N,1);