% Written by: Karla

%% Analysis of behavioural similarity judgements
% Starting from the dissimilarity matrices of behavioural similarity 
% jusgements, this code plots the results, checks for between-set 
% correlation and tests the differences between conditions.

%% Adjust

% Directory containing the files with dissimilarity matrices for all
% paticipants and all models

StatDir = ['C:\Users\Karla\Dropbox\Research projects\MA Thesis\statistics\analyses\behavioural\'];

numSubs = 9; % Number of subjects
subs    = {'SUB01', 'SUB02', 'SUB03', 'SUB04', 'SUB05', ...
    'SUB06', 'SUB07', 'SUB08', 'SUB09'}; % Subject identifiers
conds = {'VIS','MAN','EXT'}; % Names of conditions

%% Combine results from all subjects into one 3d matrix and save in cd

for condi = 1:length(conds) % For all experimental conditions
    results = [];           % Matrix in which data from all subs will be stored
    
    for s = 1:numel(subs)   % Get the data from each subject
        file = [StatDir subs{s} filesep subs{s} '_' conds{condi} '.mat'];
        loadedfile = load(file);
        results(:,:,s) = loadedfile.m; % Save it in one big matrix
    end
    
    % Now reorder the categories (from mani-nmani-tools to
    % tools-mmani-nmani). 
    % Not particularly elegant, but works.
    
    temp = [];
    
    temp(1:12,1:12,:)   = results(25:36,25:36,:); % diagonals
    temp(13:24,13:24,:) = results(1:12,1:12,:);
    temp(25:36,25:36,:) = results(13:24,13:24,:);

    temp(1:12,13:24,:)  = results(1:12,25:36,:);
    temp(1:12,25:36,:)  = results(13:24,25:36,:);
    temp(13:24,25:36,:) = results(1:12,13:24,:);
    
    results = temp; 
    
    % Save what you created in cd
    save(['results_' conds{condi}], 'results')
    clear temp
    clear results
    
end

%% Load saved models
temp = load('results_VIS.mat'); visual = temp.results;
temp = load('results_MAN.mat'); manipulability = temp.results;
temp = load('results_EXT.mat'); extension = temp.results;

%% Get averaged models and plot results in dissimilarity matrices

figure(1)
set(0,'defaultfigurecolor',[1 1 1])
labels = {'tools','manipulable','non-manipulable'};

colormap(bluered_behav) % Custom colormap - run the code to create the colormap first

subplot(131)
plt = imagesc(mean(visual,3));
title('Visual')
%colorbar('southoutside')
caxis([0 0.07])
axis off

subplot(132)
imagesc(mean(manipulability,3))
title('Manipulability')
%colorbar('southoutside')
caxis([0 0.07])
axis off
xlabel('Dissimilarity')

subplot(133)
imagesc(mean(extension,3))
title('Body extension')
caxis([0 0.07])
% colorbar
axis off

%% Check for correlation between Set 1 and Set 2
% Set1 = [1:5]; Set2 = [6:9]

models = {visual,manipulability,extension};
setcor = [];

for modi = 1:length(models)
    
    model = models{modi};
    set1 = model(:,:,1:5);
    set2 = model(:,:,6:9);
    corr = corrcoef(mean(set1,3),mean(set2,3));
    setcor = [setcor; corr];

end

%% Test differences between categories
% Test the differences between tools, manipulable, and nonmanipulable
% categories in dissimilarity matrices for each model.


%% Visual similarity
% Rationale: there should be no differences in shape between object
% categories. Therefore, there should be no difference between
% within-category correlations and between-category correlations. The code
% gets the average within-category and between-category correlations (from
% group-averaged dissimilarity matrix) and tests the difference with ttest.

tools_avg = []; mani_avg = []; nonmani_avg = [];
tools_mani = []; tools_nmani = []; mani_nmani = [];

for sub = 1:numSubs
    tools = []; mani = []; nonmani = [];
    vis = visual(:,:,sub);
    
    for r = 1:length(vis)
        for c = 1:length(vis)
        
            if c > r && c <= 12 % If we're in the uppermost triangle
                tools = [tools vis(r,c)];
            
            elseif c > r && c > 13 && c <= 24 % If we're in the middle triangle
                mani = [mani vis(r,c)];
            
            elseif c > r && c > 24 % If we're in the lowest triangle
                nonmani = [nonmani vis(r,c)];
            
            end
        end
    end
    
    % Average within-condition correlation
    tools_avg = [tools_avg mean(tools)]; 
    mani_avg = [mani_avg mean(mani)]; 
    nonmani_avg = [nonmani_avg mean(nonmani)];
    
    % Average between-condition correlation
    tools_mani = [tools_mani mean(mean(vis(1:12,13:24)))];
    tools_nmani = [tools_nmani mean(mean(vis(1:12,25:36)))];
    mani_nmani = [mani_nmani mean(mean(vis(13:24,25:36)))];
    
end

% Pairwise comparisons
[H P_vis1 CI_vis1 STAT_vis1] = ttest(tools_avg, ((tools_mani+tools_nmani)/2));
[H P_vis2 CI_vis2 STAT_vis2] = ttest(mani_avg, ((tools_mani+mani_nmani)/2));
[H P_vis3 CI_vis3 STAT_vis3] = ttest(nonmani_avg, ((tools_nmani+mani_nmani)/2));

% Effect sizes
g_vis1 = mes(tools_avg(:), ((tools_mani(:)+tools_nmani(:))/2),'hedgesg','isDep',1);
g_vis2 = mes(mani_avg(:), ((tools_mani(:)+mani_nmani(:))/2),'hedgesg','isDep',1);
g_vis3 = mes(nonmani_avg(:), ((tools_nmani(:)+mani_nmani(:))/2),'hedgesg','isDep',1);

%% Manipulability/graspability
% Rationale: there should be a difference in manipulability between tools
% and nonmanipulable objects, and manipulable and nonmanipulable objects.
% Therefore, there should be a difference between tools-manipulable and
% tools-nonmanipulable average correlations, as well as between
% tools-manipulable and manipulable-nonmanipulable correlations.
% The code gets the tools-manipulable, tools-nonmanipulable, and
% manipulable-nonmanipulable correlations, computes averages of each group,
% and tests the differences in two t-tests.
% Additionally, it tests the difference between tools-nonmanipulable and
% manipulable-nonmanipulable.

tools_mani_avg = []; tools_nmani_avg = []; mani_nmani_avg = [];

for sub = 1:numSubs
    man = manipulability(:,:,sub);
    
    % Average between-category correlation
    tools_mani_avg  = [tools_mani_avg mean(mean(man(1:12,13:24)))];
    tools_nmani_avg = [tools_nmani_avg mean(mean(man(1:13,25:36)))];
    mani_nmani_avg  = [mani_nmani_avg mean(mean(man(13:24,25:36)))];

end
    % Test the difference 
[H P_man1 CI_man1 STATS_man1] = ttest(tools_mani_avg,tools_nmani_avg);
[H P_man2 CI_man2 STATS_man2] = ttest(tools_mani_avg,mani_nmani_avg);

[H P_man3 CI_man3 STATS_man3] = ttest(tools_nmani_avg,mani_nmani_avg);

g_man1 = mes(tools_mani_avg(:), tools_nmani_avg(:),'hedgesg','isDep',1);
g_man2 = mes(tools_mani_avg(:), mani_nmani_avg(:),'hedgesg','isDep',1);

g_man3 = mes(tools_nmani_avg(:), mani_nmani_avg(:),'hedgesg','isDep',1);


%% Body extension
% Rationale: There should be a significant difference in body extension
% between tools and other objects. This can be tested by comparing the average
% between-category correlations with the within-category ones for each
% subject. If tools can indeed be defined by body extension, we expect the
% the tools to be significantly more correlated with other tools on this dimension
% than with other objects (between-category). 

tools = []; mani = []; nonmani = [];

tools_avg = zeros(1, numSubs); % within-category tools
mani_avg = zeros(1, numSubs);  % within-category mani
nmani_avg = zeros(1, numSubs); % within-category nmani

tools_mani_avg = zeros(1, numSubs);  % between-category tools-mani
tools_nmani_avg = zeros(1, numSubs); % between-category tools-nmani
mani_nmani_avg = zeros(1, numSubs);  % between-category mani-nmani


% Extract wiithin- and between-category values from the matrices (per sub)
for sub = 1:numSubs
    ext = extension(:,:,sub);
    
    for r = 1:length(ext)
        for c = 1:length(ext)
        
            if c > r && c <= 12 % If we're in the uppermost triangle
                tools = [tools ext(r,c)];
            
            elseif c > r && c > 13 && c <= 24 && r > 12 && r <= 24 % If we're in the middle triangle
                mani = [mani ext(r,c)];
            
            elseif c > r && c > 24 && r > 24 % If we're in the lowest triangle
                nonmani = [nonmani ext(r,c)];
            
            end
        end
    end
    
    % Average within-condition correlation
    tools_avg(sub) = mean(tools); 
    mani_avg(sub) = mean(mani); 
    nmani_avg(sub) = mean(nonmani);
       
    % Average between-category correlation
    tools_mani_avg(sub)  = mean2(ext(1:12,13:24));  
    tools_nmani_avg(sub) = mean2(ext(1:12,25:36));
    mani_nmani_avg(sub)  = mean2(ext(13:24,25:36));
           
end

% Pairwise comparisons and effect sizes
g_ext1 = mes(tools_avg(:),tools_mani_avg(:), 'hedgesg','isDep',1);
g_ext2 = mes(tools_avg(:),tools_nmani_avg(:),'hedgesg','isDep',1);
g_ext3 = mes(tools_mani_avg(:),tools_nmani_avg(:),'hedgesg','isDep',1);