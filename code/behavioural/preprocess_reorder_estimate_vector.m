% Written by: Karla
% Loops over the results of behavioural similarity
% judgement task and sorts the content of the files into RSA matrices.
% Files are saved in the current folder as one matrix per subject.

%% Make changes

MainDir = ['C:\Users\Karla\Dropbox\Research projects\MA Thesis\'];
DataDir = [MainDir 'behavioural\behav-july-2016\MultipleObjectArrangementKARLA-July\results\set2\set2 results\'];

subs    = {'SUB01', 'SUB02', 'SUB03', 'SUB04'};
conds   = {'VIS', 'MAN', 'EXT', 'SEM'};
numSubs = 4;  % Enter the number of subjects
numConds= 4;  % Enter the number of conditions
numStim = 36; % Enter the number of stimuli in the set

%% Fixed

for s = 1:numSubs
    for c = 1:numConds
        file = [DataDir (subs{s}) '_' (conds{c}) '.mat'];
        load(file);
        filename = [subs{s} '_' conds{c}];
        m = zeros(numStim);
        pos=0;  
        for k=1:numStim 
            for j = (k+1):numStim
                pos = pos+1; 
                m(k,j) = estimate_dissimMat_ltv(pos);
            end
        end
        save(filename, 'm');
    end
end
            
              