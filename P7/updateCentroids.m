function newc = updateCentroids(D, c, K)

warning off;
[m n] = size(D);
newc = [];

for i = 1:K
    idx = find(c==i);
    a = D(idx,1:n);
    newc = [newc ; mean(a)];
end

end


