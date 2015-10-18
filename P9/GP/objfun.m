function [J,dJ]=objfun(ell)
global x
global y
global sigma2
global sf
global covfunc


[J, dJ] = gpCostFunc(ell, x, y, sigma2, sf, covfunc)