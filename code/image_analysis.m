% Written by: Karla
% Plot the pixel-wise average over used stimuli images.

%%

% load in imageData of set1
imgavg = [];
for n = 1:12
    imavg = (imageData(n).alpha + imageData(n+12).alpha + imageData(n+24).alpha)/3;
    imgavg(:,:,n) = imavg;
end

% load in imageData of set2
imgavg2 = [];
for n = 1:12
    imavg = (imageData(n).alpha + imageData(n+12).alpha + imageData(n+24).alpha)/3;
    imgavg2(:,:,n) = imavg;
end

%% Set1
images = [];
for n = 1:12
    images(:,:,n) = imageData(n).alpha;
end
avg_mani = mean(images,3);
    
images = [];
for n = 13:24
    images(:,:,n) = imageData(n).alpha;
end
avg_nmani = mean(images,3);

images = [];
for n = 25:36
    images(:,:,n) = imageData(n).alpha;
end
avg_tools = mean(images,3);

%% Set2
images = [];
for n = 1:12
    images(:,:,n) = imageData(n).alpha;
end
avg_mani2 = mean(images,3);
    
images = [];
for n = 13:24
    images(:,:,n) = imageData(n).alpha;
end
avg_nmani2 = mean(images,3);

images = [];
for n = 25:36
    images(:,:,n) = imageData(n).alpha;
end
avg_tools2 = mean(images,3);
%% Plot the averages
figure

tools = [(avg_tools(:) + avg_tools2(:))/2];
mani = [(avg_mani(:) + avg_mani2(:))/2];
nmani = [(avg_nmani(:) + avg_nmani2(:))/2];

tools_mat = reshape(tools,[255 255]);
mani_mat = reshape(mani,[255 255]);
nmani_mat = reshape(nmani,[255 255]);

figure
subplot(131)
imagesc(tools_mat)
axis off
title('Tools')
subplot(132)
imagesc(mani_mat)
axis off
title('Manipulable')
subplot(133)
imagesc(nmani_mat)
axis off
title('Nonmanipulable')

colormap gray
