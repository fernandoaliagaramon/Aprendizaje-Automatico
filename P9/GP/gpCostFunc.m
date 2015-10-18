function [J, grad] = gpCostFunc(ell, x, y, sigma, sf, func_handle)

ntrain=size(y,1);

hyp=log([ell sf]);

K=feval(func_handle{:}, hyp, x);
dK=feval(func_handle{:}, hyp, x,[],1);

L=chol(K+sigma*eye(size(K)),'lower');
alfa=L'\(L\y);
J=-(-0.5*y'*alfa -sum(log(diag(L))))-log(ell);

invK=inv(L)'*inv(L);

% Optional: compute gradient
% You will need to take into account the extra term in J!
grad=[];