
%% load some data generated from a Gaussian Process
clear all, close all
load GPData.mat

figure(102), clf, hold on
plot(x, y, '+')



%% use covariance function to compute the Kernel matrix
% You can use two covariance functions
% - covSEiso: K = covSEiso(hyp, x, z, i) 
%   for the code use: K=covSEiso(hyp.cov,fx,[]);
% - covMaternIso
%   for the code use: K=covSEiso(hyp.cov,fx,[]);
%
% In both cases, set z to [].
% i: i=0 computes the kernel, i>0 computes the kernel derivative wrt to
%       parameter i of vector hyp 
%
% We will use covMaternIso to check your implementation of GPregression.
covfunc = {@covMaterniso, 3};

% Set  hyperparameters to some initial non-sense values
% kernel parameters
ell = 10; sf = 2; hyp.cov = log([ell; sf]);

% noise level
sigma2=0.1*0.1;

px=0;

% Regress for px
% You will need to code GPregresion
[py,vary]=GPregression(x,y,px,covfunc, hyp.cov, sigma2);

fprintf(1, 'The values of py and vary are %f and %f and should be close to 0.93 and 0.0015\n', py, vary);


 

pause


%% Manually select hyperparameters
% We will now use the whole dataset and try to select good kernel
% parameters to improve our predictions
ell = 10; sf = 2; hyp.cov = log([ell; sf]);


% Predict new points on a grid
px = [-1.5:.1:2.5]';
fx = [x; px];

[py,vary]=GPregression(x,y,px,covfunc, hyp.cov, sigma2);


% Plot precited values and covariances
figure(101), clf
hold on
boundedline(px, py, 2*sqrt(diag(vary)));
plot(px,py,'r.');
plot(x, y, '+')


%% Optimize parameters
% Set Initial Parameters (Theta, X)
sf = 1;
initial_ell = [4];



% Options for minFunc
options.DerivativeCheck = 'off';
options.display = 'iter';
options.method = 'cg';
options.numdiff = 1;

[J, grad] = gpCostFunc(ell, x, y, sigma2, sf, covfunc)

lambda = 0;
ell = minFunc(@gpCostFunc, initial_ell , options, x, y, sigma2, sf,  covfunc);




% ell = fmincg (@(ell)(gpCostFunc(x, y, sigma2, sf, ell, covfunc)), ...
%                 initial_parameters, options)






