D=genDatos(2);

% create initial centroids
c0 = [-0,0; -1,1]
    
%%; -2,4; -1.9,2];
hold on
scatter(c0(:,1), c0(:,2), '*r')
disp('then we define initial centroids')
pause

% example on how to check the function updateClusters:
Z = updateClusters(D,c0);
idx = find(Z==1);
scatter(D(idx,1),D(idx,2), 'r')
idx = find(Z==2);
scatter(D(idx,1),D(idx,2), 'g')
idx = find(Z==3);
scatter(D(idx,1),D(idx,2), 'y')
idx = find(Z==4);
scatter(D(idx,1),D(idx,2), 'k')
disp('here we check the the updateClusters function works')
pause

% example on how to check the function updateCentroids:
newc = updateCentroids(D,Z,size(c0,1))
hold off
scatter(D(:,1),D(:,2))
hold on
scatter(newc(:,1), newc(:,2), '*g')
disp('here we check the the updateCentroids function works')
pause

% finally we can check the kmeans function:
[c, Z] = kmeans(D,c0);
hold off
scatter(D(:,1),D(:,2))
hold on
scatter(c0(:,1), c0(:,2), '*r')
scatter(c(:,1), c(:,2), '*r')
idx = find(Z==1);
scatter(D(idx,1),D(idx,2), 'r')
idx = find(Z==2);
scatter(D(idx,1),D(idx,2), 'g')
idx = find(Z==3);
scatter(D(idx,1),D(idx,2), 'y')
idx = find(Z==4);
scatter(D(idx,1),D(idx,2), 'k')
disp('finally we check the the kmeans function')
pause
