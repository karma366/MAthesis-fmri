% Written by: Karla

%% Fisher-transform the MVPA data

SPL_left_f = atanh(SPL_left_avg); IPS_left_f = atanh(IPS_left_avg);
%SPL_right_f = atanh(SPL_right_avg); IPS_right_f = atanh(IPS_right);

%% % Transform the data into 17X9 format

% IPS
data = IPS_left_f;
matrix = [];

for sub = 1:size(data,3)
    matrix(sub,4:6) = data(1,4:6,sub);
    matrix(sub,1:3) = data(2,4:6,sub);
    matrix(sub,7:9) = data(3,4:6,sub);
end

IPS_left_trans = matrix;

% SPL
data = SPL_left_f;
matrix = [];

for sub = 1:size(data,3)
    matrix(sub,4:6) = data(1,4:6,sub);
    matrix(sub,1:3) = data(2,4:6,sub);
    matrix(sub,7:9) = data(3,4:6,sub);
end

SPL_left_trans = matrix;

% Average over both left hemisphere ROIs
data = (SPL_left_f + IPS_left_f)/2; 

matrix = [];

for sub = 1:size(data,3)
    matrix(sub,4:6) = data(1,4:6,sub);
    matrix(sub,1:3) = data(2,4:6,sub);
    matrix(sub,7:9) = data(3,4:6,sub);
end

left_hem = matrix;

%% Pairwise t-tests

%%% IPS only

% Hands-tools VS hands-mani
%[H P_1 CI_1 STATS_1] = ttest(IPS_left_trans(:,1),IPS_left_trans(:,2));

% Hands-tools VS hands-nmani
%[H P_2 CI_2 STATS_2] = ttest(IPS_left_trans(:,1),IPS_left_trans(:,3));

% Hands-tools VS bodies-tools
%[H P_3 CI_3 STATS_3] = ttest(IPS_left_trans(:,1),IPS_left_trans(:,4));

% Hands-tools VS faces-tools
%[H P_4 CI_4 STATS_4] = ttest(IPS_left_trans(:,1),IPS_left_trans(:,7));

%IPS_pairwise_p = [P_1 P_2 P_3 P_4];
%IPS_pairwise_tstat = [STATS_1.tstat STATS_2.tstat STATS_3.tstat STATS_4.tstat];


%%% SPL only

% Hands-tools VS hands-mani
%[H P_1 CI_1 STATS_1] = ttest(SPL_left_trans(:,1),SPL_left_trans(:,2));

% Hands-tools VS hands-nmani
%[H P_2 CI_2 STATS_2] = ttest(SPL_left_trans(:,1),SPL_left_trans(:,3));

% Hands-tools VS bodies-tools
%[H P_3 CI_3 STATS_3] = ttest(SPL_left_trans(:,1),SPL_left_trans(:,4));

% Hands-tools VS faces-tools
%[H P_4 CI_4 STATS_4] = ttest(SPL_left_trans(:,1),SPL_left_trans(:,7));

%SPL_pairwise_p = [P_1 P_2 P_3 P_4];
%SPL_pairwise_tstat = [STATS_1.tstat STATS_2.tstat STATS_3.tstat STATS_4.tstat];


%%% Avg SPL and IPS / Fischer transformed

% Hands-tools VS hands-mani
[H P_1 CI_1 STATS_1] = ttest(left_hem(:,1),left_hem(:,2));

% Hands-tools VS hands-nmani
[H P_2 CI_2 STATS_2] = ttest(left_hem(:,1),left_hem(:,3));

% Hands-tools VS bodies-tools
[H P_3 CI_3 STATS_3] = ttest(left_hem(:,1),left_hem(:,4));

% Hands-tools VS faces-tools
[H P_4 CI_4 STATS_4] = ttest(left_hem(:,1),left_hem(:,7));

% Hands-mani VS hands-nmani
[H P_5 CI_5 STATS_5] = ttest(left_hem(:,2),left_hem(:,3));

lefthem_pairwise_p = [P_1 P_2 P_3 P_4 P_5];
lefthem_pairwise_tstat = [STATS_1.tstat STATS_2.tstat STATS_3.tstat STATS_4.tstat STATS_5.tstat];

%% Effect sizes

% Hands-tools VS hands-mani
g1 = mes(left_hem(:,1),left_hem(:,2),'hedgesg','isDep',1,'nBoot',10000);

% Hands-tools VS hands-nmani
g2 = mes(left_hem(:,1),left_hem(:,3),'hedgesg','isDep',1,'nBoot',10000);

% Hands-tools VS bodies-tools
g3 = mes(left_hem(:,1),left_hem(:,4),'hedgesg','isDep',1,'nBoot',10000);

% Hands-tools VS faces-tools
g4 = mes(left_hem(:,1),left_hem(:,7),'hedgesg','isDep',1,'nBoot',10000);

% Hands-mani VS hands-nmani
g5 = mes(left_hem(:,2),left_hem(:,3),'hedgesg','isDep',1,'nBoot',10000);
