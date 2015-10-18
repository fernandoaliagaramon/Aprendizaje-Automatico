figure(1)
im = imread('foto.jpg');
imshow(im)

disp('we want to cluster the colors in this image')

S=size(im);
IM = double(reshape(im,S(1)*S(2),3));
S = size(IM);

%% Apply Kmeans 
k = 20;

% Should we use multiple initializaions?

% Initializa centroids: use data to do this
c0 = rand(k,3);
% apply kmeans
[c, Z] = kmeans(IM,c0);

% show labels for each pixel
imindex=reshape(Z,size(im,1),size(im,2));
imindex=(imindex-min(min(imindex)))/(max(max(imindex))-min(min(imindex)));
figure(2)
imshow(imindex)


%% reconstruct image
Z = updateClusters(IM,c);
imindex=reshape(Z,size(im,1),size(im,2));
imindex=(imindex-min(min(imindex)))/(max(max(imindex))-min(min(imindex)));

%qIM=zeros(size(im));

figure(3)
imshow(imindex)