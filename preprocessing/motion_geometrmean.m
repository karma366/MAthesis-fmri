%% Written by Lien Peters

clear all;

Counter = 1;
PathName='/Users/Karla/Dropbox/Research projects/MA Thesis/data/sub06/';
% subNames = {'SUB01','SUB02','SUB03','SUB04','SUB06','SUB08','SUB09','SUB010','SUB11','SUB14','SUB15','SUB16'};
% subNum=size(subNames,2);

subNames = {'sub06'};
subNum=size(subNames,2);

subNames_2 = {'sub06'};
subNum_2=size(subNames,2);

%define vol num:
VolNum=203; %n -1

% voxelsize aanpassen
voxelsize = 3;

name_scans = [1 2 3 4 5 6 7 8];

for ii=1:subNum
for i = 1:size(name_scans,2)
    num = num2str(name_scans(1,i));
    filename=([PathName 'rp_' subNames_2{ii} '_' num '.txt']);
    MP=load(filename);
   
    Tr1 = MP(:,1);
    Tr2 = MP(:,2);
    Tr3 = MP(:,3);

    for j = 1:VolNum
        v1(j) = Tr1(j+1) - Tr1(j);
        v2(j) = Tr2(j+1) - Tr2(j);
        v3(j) = Tr3(j+1) - Tr3(j);
        GM(j) = sqrt((Tr1(j+1) - Tr1(j))^2 + (Tr2(j+1) - Tr2(j))^2 + (Tr3(j+1) - Tr3(j))^2);
    end

    max_v1(Counter) = max(abs(v1));
    max_v2(Counter) = max(abs(v2));
    max_v3(Counter) = max(abs(v3));
    max_geomtr(Counter) = max(GM);
    Counter = Counter+1;
end

max_geomtr
max_v1
max_v2
max_v3

figure(1)
title('Motion parameters');
% geometr mean
subplot(2,2,1);
hold on;
bar(max_geomtr);
a = 0:.001:5;
b = voxelsize;
plot(a,b,'r');
xlabel('Runnummer')
title('Geometrical mean');
hold off;

% translatie 1
subplot(2,2,2);
hold on;
bar(max_v1);
a = 0:.001:5;
b = voxelsize;
plot(a,b,'r');
xlabel('Runnummer')
title('Maximum verschil translatie 1');
hold off;

% translatie 2
subplot(2,2,3);
hold on;
bar(max_v2);
a = 0:.001:5;
b = voxelsize;
plot(a,b,'r');
xlabel('Runnummer')
title('Maximum verschil translatie 2');
hold off;

% translatie 3
subplot(2,2,4);
hold on;
bar(max_v3);
a = 0:.001:5;
b = voxelsize;
plot(a,b,'r');
xlabel('Runnummer')
title('Maximum verschil translatie 3');
end
hold off;
