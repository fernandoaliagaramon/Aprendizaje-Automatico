function X=creaDatasetClustering(K)

if K>4, 
    disp('K no puede ser mayor que 4. Si quieres mas clusters, tendras que cambiar el codigo.')
    return;
end


nsamples=200;
if K>0,
    X1=myMvnRnd([1 1]',[3 0; 0 1], nsamples)';
    X=X1;
end
if K>1
    X2=myMvnRnd([4 5]',[1 -0.9; -0.9 2], nsamples)';
    X=[X;X2];
end
if K>2,
    X3=myMvnRnd([-2 5]',[2 0.9; 0.9 1], nsamples)';
    X=[X;X3];
end
if K>3,
    X4=myMvnRnd([0 3]',[20 0; 0 0.3], nsamples)';
    X=[X;X4];
end

%figure(101), clf, hold on, axis equal
%plot(X(:,1), X(:,2),'.')

