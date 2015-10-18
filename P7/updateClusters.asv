function newc = updateClusters(D,c)
% D((N,P), N datapoints, P dimensions
% Z(P) assignment of each datapoint to a class
%
% newc(K,P) new centroids

K = size(c, 1);
newc = zeros(size(D,1), 1);
verf = zeros(size(D,1), size(c, 1)+2);

for xi = 1:size(D,1)
  x = D(xi, :);
  best = Inf;
  for mui = 1:K
    mu = c(mui, :);
    d = dot(x - mu, x - mu);
    verf(xi,mui) = d;
    
    if d < best
      best = d;
      newc(xi) = mui;
      verf(xi,size(c, 1)+1) = mui;
      verf(xi,size(c, 1)+2) = best;
    end
  end
end

