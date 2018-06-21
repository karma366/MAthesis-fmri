%--------------------------------------------------------------------------

%%% PLOT MOTION PARAMETERS

%--------------------------------------------------------------------------

dataDir='/Users/Karla/Dropbox/Research projects/MA Thesis/data/sub12/';
subName={'SUB12'};
nSubj=size (subName,2);

name_scans = [1 2 3 4 5 6 7 8];

for s=1:nSubj
    for r=1:8
        sub = char(subName(s));
        num = num2str(name_scans(1,r));
        
        
        filename=([dataDir 'rp_' sub '_' num '.txt']);
        MP=load(filename);
   
        figure(r)
        subplot(1,2,1)
        plot(MP(:,1:3))
        subplot(1,2,2)
        plot(MP(:,4:6))
    end
end

%rp_run1.txt