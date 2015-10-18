D=genDatos(3);

% create initial centroids
c0 = [-0,0; -1,1; -4,4; ];

mean(c0);
    %-1.9,2];
D;

% % example on how to check the function updateClusters:
Z = updateClusters(D,c0);
newc = updateCentroids(D,Z,size(c0,1))


% 
% % example on how to check the function updateCentroids:

Z = updateClusters(D,newc);
newc = updateCentroids(D,Z,size(c0,1))

Z = updateClusters(D,newc);
newc = updateCentroids(D,Z,size(c0,1))

Z = updateClusters(D,newc);
newc = updateCentroids(D,Z,size(c0,1))

Z = updateClusters(D,newc);
newc = updateCentroids(D,Z,size(c0,1))

Z = updateClusters(D,newc);
newc = updateCentroids(D,Z,size(c0,1))