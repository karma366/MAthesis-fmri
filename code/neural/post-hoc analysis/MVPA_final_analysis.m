%% Working directory
StatDir = ['C:\Users\Karla\Dropbox\Research projects\MA Thesis\statistics'];

%% Loading the MVPA data

% Left hemisphere
MVPA_SPL = load([StatDir filesep 'analyses' filesep 'MVPA' filesep 'MVPA_SPL_all.mat']);
MVPA_IPS = load([StatDir filesep 'analyses' filesep 'MVPA' filesep 'MVPA_IPS_all.mat']);

SPL_left = MVPA_SPL.storeResults; 
IPS_left = MVPA_IPS.storeResults;

% Right hemisphere
%MVPA_SPL_right = load([StatDir filesep 'analyses' filesep 'MVPA' filesep 'MVPA_SPL_right_all.mat']);
%MVPA_IPS_right = load([StatDir filesep 'analyses' filesep 'MVPA' filesep 'MVPA_IPS_right_all.mat']);

%SPL_right = MVPA_SPL_right.storeResults; 
%IPS_right = MVPA_IPS_right.storeResults;

%% Test the reliability of the signal (diagonal test)
% Takes as an input a 3D matrix of MVPA values and performs a
% t-test for difference between the mean values in the diagonal VS
% off-diagonal values. 
% Prints the p-value of t-test and two bar plots with mean diagonal 
% and offdiagonal values for visual comparison.


data = SPL_left; % Give your MVPA matrix here 

mean_diag = [];
mean_offdiag = [];

for sub = 1:size(data,3)
    matrix = data(:,:,sub);
    diag = [];
    offdiag = [];
    
    for r = 1:size(matrix,1)
        for c = 1:size(matrix,2)
            if r == c
                diag = [diag matrix(r,c)];
            else 
                offdiag = [offdiag matrix(r,c)];
            end
        end
    end
    mean_diag = [mean_diag mean(diag)];
    mean_offdiag = [mean_offdiag mean(offdiag)];
end

[H, P, CI, STATS] = ttest(mean_diag, mean_offdiag);

%% Average the upper and lower triangle

ROIs = {IPS_left SPL_left};
IPS_left_avg = [];
SPL_left_avg = [];


for roi = 1:length(ROIs) % Analyse one by one all ROIs
    
    for sub = 1:size(ROIs{roi},3) % Get the matrix of a subject
        matrix = ROIs{roi}(:,:,sub);
        
            for r = 1:size(matrix,1)
                for c = 1:size(matrix,2)
                    matrix2(r,c) = (matrix(r,c) + matrix(c,r))/2;
                end
            end
            
            if ROIs{roi} == IPS_left
                IPS_left_avg(:,:,sub) = matrix2;
            else
                SPL_left_avg(:,:,sub) = matrix2;
            end 
    end
end

% Throw out 'chairs' and take only the upper triangle

IPS_left_avg = IPS_left_avg(1:6,1:6,:);          
SPL_left_avg = SPL_left_avg(1:6,1:6,:);

IPS_left_half = triu(mean(IPS_left_avg,3));
SPL_left_half = triu(mean(SPL_left_avg,3));      

%% Visualise MVPA matrices

figure('pos',[30 150 1375 525]); % figure size
labels = {'body','hands','faces','tools','mani','nmani','chairs'};

subplot(121)
imagesc(mean(IPS_left_avg,3)); colorbar; % HARDCODED DATA
title('MVPA in left IPS')                % HARDCODED TITLE
set(gca, 'XTickLabel', labels, 'YTickLabel', labels);
%caxis([-0.15 0.16])

subplot(122)
imagesc(mean(SPL_left_avg,3)); colorbar; % HARDCODED DATA
title('MVPA in left SPL')                % HARDCODED TITLE
set(gca, 'XTickLabel', labels, 'YTickLabel', labels);
%caxis([-0.15 0.16])


%% Visualise MVPA half-matrices and adjust features

figure('pos',[30 150 1375 525],'defaultfigurecolor',[1 1 1]); % figure size
labels = {'body','hands','faces','tools','mani','nmani','chairs'};

subplot(121)
imagesc(mean(IPS_left_half,3)); colorbar; % HARDCODED MATRIX
%title('MVPA in left IPS')                % HARDCODED TITLE
colormap(bluered)                         % Custom colormap
set(gca, 'XTickLabel', labels, 'YTickLabel', labels);
caxis([-0.15 0.15])
axis off
xlabel('Correlation')

subplot(122)
imagesc(mean(SPL_left_half,3));           % HARDCODED MATRIX
%title('MVPA in left SPL')                % HARDCODED TITLE
colormap(bluered)                         % Custom colormap
%colorbar('southoutside');
set(gca, 'XTickLabel', labels, 'YTickLabel', labels);
caxis([-0.15 0.15])
axis off
xlabel('Correlation')

%%  Plot correlations of interest in bar graph + errorbars

% Transform the data into 17X9 format

data = IPS_left_avg; % Give your MVPA matrix here
matrix = [];

for sub = 1:size(data,3)
    matrix(sub,4:6) = data(1,4:6,sub);
    matrix(sub,1:3) = data(2,4:6,sub);
    matrix(sub,7:9) = data(3,4:6,sub);
end

IPS_left_trans = matrix;


data = SPL_left_avg;
matrix = [];

for sub = 1:size(data,3)
    matrix(sub,4:6) = data(1,4:6,sub);
    matrix(sub,1:3) = data(2,4:6,sub);
    matrix(sub,7:9) = data(3,4:6,sub);
end

SPL_left_trans = matrix;

% Adjust plotting settings 
ROIs = {IPS_left_trans SPL_left_trans}; % must be 17x9, does crazy stuff otherwise
titles = {'Left IPS' 'Left SPL'};
labels = {'hands', 'bodies', 'faces'};
legendlab = {'tools', 'manipulable', 'nonmanipulable'};
plota = 1; plotb = 1;

% Do the actual plotting
figure (1);

for roi = 1:length(ROIs)
    ROI = ROIs{roi};
    
    % Calculate means across subjects and adjust format
    dataInx = nanmean(ROI);
    dataInx = [dataInx(1:3);dataInx(4:6);dataInx(7:9)];

    % Calculate standard errors and adjust format
    errInx= nanstd(ROI)/sqrt(size(ROI,1));
    errInx = [errInx(1:3);errInx(4:6);errInx(7:9)];
    
    numROI = size(dataInx, 1);
    numbars = size(dataInx, 2);
    groupwidth = min(0.6, numbars/(numbars+1.5));
    
    % Plot
    
    subplot(1,2,roi) % HARDCODED
    a = bar(dataInx);
    hold on;

   for i = 1:numbars
        x = (1:numROI) - groupwidth/2 + (2*i-1) * groupwidth / (2*numbars);
        errorbar(x, dataInx(:,i), errInx(:,i), 'k', 'linestyle', 'none');
   end

        
    % Change bar colours: a(bar-in-group).CData 
    a(1).CData = [20 90 50]/255;      % color 1st group
    a(2).CData = [34 153 84]/255;     % color 2nd group
    a(3).CData = [125 206 160]/255;   % color 3rd group
    title(titles{roi});
    xticklabels(labels);
    ylabel('Correlation')
    
    % Additional settings
    set(a,'BarWidth',1,'LineWidth',1.5);
    a(1).FaceColor = 'flat';
    a(2).FaceColor = 'flat';
    a(3).FaceColor = 'flat';
    %legend(legendlab,'Orientation','horizontal');
    % axis off
end

%% Index analysis (additional - not reported)

matrix = IPS_left;
results = [];

coeff_tools(sub) = tools_avg - (tools_mani_avg + tools_nmani_avg);
coeff_mani(sub) = mani_avg - (tools_mani_avg + mani_nmani_avg);
coeff_nmani(sub) = nmani_avg - (tools_nmani_avg + mani_nmani_avg);

for sub = 1:size(matrix,3) % Loop over subjects
    
                    % hands-tools - mean(hands-mani,hands-nmani)
    hands_tools = matrix(2,4,sub) - ((matrix(2,5,sub) + matrix(2,6,sub))/2);
    results(sub,1) = hands_tools;
                    % hands-mani - mean(hands-tools,hands-nmani)
    hands_mani = matrix(2,5,sub) - ((matrix(2,4,sub) + matrix(2,6,sub))/2);
    results(sub,2) = hands_mani;
                    % hands-nmani - mean(hands-tools,hands-mani)
    hands_nmani = matrix(2,6,sub) - ((matrix(2,4,sub) + matrix(2,5,sub))/2);
    results(sub,3) = hands_nmani;
    
end
