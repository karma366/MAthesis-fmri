% Written by: Karla

%--------------------------------------------------------------------------

%%% MASTER SCRIPT FOR PREPROCESSING
% Runs the Realign; Slice timing; Coregister; Old Normalise; Smooth; and
% Old Normalise on anatomical image.

%--------------------------------------------------------------------------
%% Parameters to adjust

nSub = 15; % Enter the number of subjects here
nRun = 8; % Enter the number of runs/sessions per subject here
nInputs = 12; % Enter the number of missing inputs per SPM batch here

% Main directory, directory of data per subject, identifiers
MainDir = 'C:\Users\Karla\Dropbox\Research projects\MA Thesis\';
SubFile = [MainDir 'data' filesep 'raw'  filesep 'sub'];
SubjectID = {01 02 03 04 06 07 08 09 10 11 12 14 15 16 17 18};

% Location of the job file (i.e. batch created in SPM GUI)
jobfile = {[MainDir 'scripts\SPM\preprocessing\preprocessing_karla_job.m']};

%--------------------------------------------------------------------------
%% No need to make any changes here

jobs = repmat(jobfile, 1, nSub);
inputs = cell(nInputs, nSub);

% Filling the cell 'inputs' with files that will be filled in the batch

for s = 1:nSub % Looping over subjects
    DataDir = [SubFile num2str(cell2mat(SubjectID(s)),'%02d') filesep];
    for r = 1:nRun % Looping over sessions
        % Adding functional images
        inputs{r, s} = cellstr(spm_select('expand', [DataDir 'SUB' num2str(cell2mat(SubjectID(s)),'%02d') '_' num2str(r) '.nii']));
    end
        % Adding the anatomical for coregistration
        inputs{9, s} = {[DataDir 'SUB' num2str(cell2mat(SubjectID(s)),'%02d') '_anat.nii']};
        % Adding the anatomical for Old Normallise (3x)
        inputs{10, s} = {[DataDir 'SUB' num2str(cell2mat(SubjectID(s)),'%02d') '_anat.nii']};
        inputs{11, s} = {[DataDir 'SUB' num2str(cell2mat(SubjectID(s)),'%02d') '_anat.nii']};
        inputs{12, s} = {[DataDir 'SUB' num2str(cell2mat(SubjectID(s)),'%02d') '_anat.nii']};
end

% Starting up SPM and performing the jobs

spm('defaults', 'FMRI');
spm_jobman('initcfg');
spm_jobman('serial', jobs, '', inputs{:});

 