function [c, Z] = kmeans(D,c0)

% D(N,P), N datapoints, P dimensions
% c0(K,P) K initial centroids
%
% c(K,P) final centroids
% Z(P) assignment of each datapoint to a class

% Initialize values
[m n] = size(D);
K = size(c0, 1);
centroids = c0;
c = zeros(m, 1);
max_iters = 15;

% % example on how to check the function updateClusters:
Z = updateClusters(D,c0);
cAnterior = zeros(size(c0,1),size(c0,2));
c = updateCentroids(D,Z,size(c0,1));
i = 0;

while (c~=cAnterior)
    fprintf('Iteracion k-means : %d \n',i);
    i = i + 1;
    cAnterior = c;
    Z = updateClusters(D,c);
    c = updateCentroids(D,Z,size(c0,1));   
end
fprintf('Fin k-means\n');


% 
% % example on how to check the function updateCentroids:

