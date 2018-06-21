function make_onsets_LOC_comparative(sess)
clear onsets

pathToOutputs = 'C:\Users\Karla\Dropbox\Research projects\MA Thesis\onsets';

subjnames= {'SUB01','SUB02','SUB03','SUB04','SUB05','SUB06','SUB07','SUB08','SUB09','SUB10','SUB11','SUB12','SUB13','SUB14','SUB15','SUB16','SUB17'};
nSubj=1

% % if sess==1
% % scandates={'23-Jul-2014','23-Jul-2014','28-Jul-2014','29-Jul-2014'};
% % elseif sess==2
% % scandates={'30-Jul-2014'};
% % end

condnames={ 'body', 'hand', 'tool', 'chair','face', 'scene', 'scrambled' };

nConditions = 7; % number of objects not including fixation
nDesign = 6;
nRun = 4; %n of runs
nScansPerRun = 152; %n of volumes
duration = 4; % 8 seconds per block (4 volumes)
firstLastFix=4;

names{1} = 'body ';
names{2} = 'hand ';
names{3} = 'tool ';
names{4} = 'chair';
names{5} = 'face ';
names{6} = 'scene';
names{7} = 'scram';

durations{1} = duration;
durations{2} = duration;
durations{3} = duration;
durations{4} = duration;
durations{5} = duration;
durations{6} = duration;
durations{7} = duration;

for subj=1:1                                        %loop across subjects
    
    subj1=char(subjnames(subj));
    scandate=char(scandates(subj));
    sourcedir='D:\fmriProj\ShapeCategory\log\outputsmat\';  %directory that contains the .mat files  
    savedir='D:\fmriProj\ShapeCategory\log\outputsmat\';    %subj2 '/1donset/'   %directory to save prt files
    
    for r=3:nRun,
        %for r=1:2,
         
        clear onsets
        
        for c=1:nConditions
            
            filetoload=[sourcedir 'LOC_CatSha_' subj1 '_' num2str(r) '_' scandate '.mat'];
            eval(sprintf('load %s', filetoload));
            
            des=design
            
            telBlockCond = 0;
            B = find(des==c);
            %B = find(design{designPerRun(r)}==c);
            
            for b=1:size(B,2),
                telBlockCond = telBlockCond + 1;
                %onsets{c}(telBlockCond) = (r-1)*nScansPerRun + (B(b)-1)*duration + 1;
                onsets{c}(telBlockCond) = (B(b)-1)*duration + firstLastFix;% + 1;
            end;
            save(['D:\fmriProj\ShapeCategory\log\onsetsSPM\' subj1 '_run0' num2str(r) '_LOC.mat'],'names','onsets','durations')
            %save(['f:\fmri_data\subord\subord_004\onsetsMinus1_run' num2str(r) '.mat'],'names','onsets','durations')
        end;
    end
end;

return;

load F:\fmri_data\subord\subord_011\even_multisess\SPM.mat
SPM.xM.TH(1:375) = 10;
save F:\fmri_data\subord\subord_011\even_multisess\SPM.mat SPM

load F:\fmri_data\subord\subord_004\even_multisessMinus1\SPM.mat
SPM.xM.TH(1:375) = 10;
save F:\fmri_data\subord\subord_004\even_multisessMinus1\SPM.mat SPM

load F:\fmri_data\subord\subord_004\odd_multisessMinus1\SPM.mat
SPM.xM.TH(1:375) = 10;
save F:\fmri_data\subord\subord_004\odd_multisessMinus1\SPM.mat SPM


