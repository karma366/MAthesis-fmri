%-----------------------------------------------------------------------
% Job saved on 24-Oct-2017 12:39:24 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6906)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.spm.spatial.realign.estwrite.data = {
                                                    '<UNDEFINED>'
                                                    '<UNDEFINED>'
                                                    '<UNDEFINED>'
                                                    '<UNDEFINED>'
                                                    '<UNDEFINED>'
                                                    '<UNDEFINED>'
                                                    '<UNDEFINED>'
                                                    '<UNDEFINED>'
                                                    }';
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.quality = 0.9;
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.sep = 4;
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.fwhm = 5;
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.rtm = 0;
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.interp = 2;
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.weight = '';
matlabbatch{1}.spm.spatial.realign.estwrite.roptions.which = [2 1];
matlabbatch{1}.spm.spatial.realign.estwrite.roptions.interp = 4;
matlabbatch{1}.spm.spatial.realign.estwrite.roptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.realign.estwrite.roptions.mask = 1;
matlabbatch{1}.spm.spatial.realign.estwrite.roptions.prefix = 'r';
matlabbatch{2}.spm.temporal.st.scans{1}(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 1)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{1}, '.','rfiles'));
matlabbatch{2}.spm.temporal.st.scans{2}(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 2)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{2}, '.','rfiles'));
matlabbatch{2}.spm.temporal.st.scans{3}(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 3)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{3}, '.','rfiles'));
matlabbatch{2}.spm.temporal.st.scans{4}(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 4)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{4}, '.','rfiles'));
matlabbatch{2}.spm.temporal.st.scans{5}(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 5)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{5}, '.','rfiles'));
matlabbatch{2}.spm.temporal.st.scans{6}(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 6)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{6}, '.','rfiles'));
matlabbatch{2}.spm.temporal.st.scans{7}(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 7)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{7}, '.','rfiles'));
matlabbatch{2}.spm.temporal.st.scans{8}(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 8)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{8}, '.','rfiles'));
matlabbatch{2}.spm.temporal.st.nslices = 37;
matlabbatch{2}.spm.temporal.st.tr = 2;
matlabbatch{2}.spm.temporal.st.ta = 1.94594594594595;
matlabbatch{2}.spm.temporal.st.so = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37];
matlabbatch{2}.spm.temporal.st.refslice = 1;
matlabbatch{2}.spm.temporal.st.prefix = 'a';
matlabbatch{3}.spm.spatial.coreg.estimate.ref = '<UNDEFINED>';
matlabbatch{3}.spm.spatial.coreg.estimate.source(1) = cfg_dep('Realign: Estimate & Reslice: Mean Image', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','rmean'));
matlabbatch{3}.spm.spatial.coreg.estimate.other(1) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 1)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
matlabbatch{3}.spm.spatial.coreg.estimate.other(2) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 2)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{2}, '.','files'));
matlabbatch{3}.spm.spatial.coreg.estimate.other(3) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 3)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{3}, '.','files'));
matlabbatch{3}.spm.spatial.coreg.estimate.other(4) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 4)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{4}, '.','files'));
matlabbatch{3}.spm.spatial.coreg.estimate.other(5) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 5)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{5}, '.','files'));
matlabbatch{3}.spm.spatial.coreg.estimate.other(6) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 6)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{6}, '.','files'));
matlabbatch{3}.spm.spatial.coreg.estimate.other(7) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 7)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{7}, '.','files'));
matlabbatch{3}.spm.spatial.coreg.estimate.other(8) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 8)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{8}, '.','files'));
matlabbatch{3}.spm.spatial.coreg.estimate.eoptions.cost_fun = 'nmi';
matlabbatch{3}.spm.spatial.coreg.estimate.eoptions.sep = [4 2];
matlabbatch{3}.spm.spatial.coreg.estimate.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{3}.spm.spatial.coreg.estimate.eoptions.fwhm = [7 7];
matlabbatch{4}.spm.tools.oldnorm.estwrite.subj.source = '<UNDEFINED>';
matlabbatch{4}.spm.tools.oldnorm.estwrite.subj.wtsrc = '';
matlabbatch{4}.spm.tools.oldnorm.estwrite.subj.resample(1) = cfg_dep('Coregister: Estimate: Coregistered Images', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','cfiles'));
matlabbatch{4}.spm.tools.oldnorm.estwrite.eoptions.template = {'C:\Users\Karla\Documents\MATLAB\spm12\spm12\toolbox\OldNorm\T1.nii,1'};
matlabbatch{4}.spm.tools.oldnorm.estwrite.eoptions.weight = '';
matlabbatch{4}.spm.tools.oldnorm.estwrite.eoptions.smosrc = 8;
matlabbatch{4}.spm.tools.oldnorm.estwrite.eoptions.smoref = 0;
matlabbatch{4}.spm.tools.oldnorm.estwrite.eoptions.regtype = 'mni';
matlabbatch{4}.spm.tools.oldnorm.estwrite.eoptions.cutoff = 25;
matlabbatch{4}.spm.tools.oldnorm.estwrite.eoptions.nits = 16;
matlabbatch{4}.spm.tools.oldnorm.estwrite.eoptions.reg = 1;
matlabbatch{4}.spm.tools.oldnorm.estwrite.roptions.preserve = 0;
matlabbatch{4}.spm.tools.oldnorm.estwrite.roptions.bb = [-78 -112 -70
                                                         78 76 85];
matlabbatch{4}.spm.tools.oldnorm.estwrite.roptions.vox = [3 3 3];
matlabbatch{4}.spm.tools.oldnorm.estwrite.roptions.interp = 1;
matlabbatch{4}.spm.tools.oldnorm.estwrite.roptions.wrap = [0 0 0];
matlabbatch{4}.spm.tools.oldnorm.estwrite.roptions.prefix = 'w';
matlabbatch{5}.spm.spatial.smooth.data(1) = cfg_dep('Old Normalise: Estimate & Write: Normalised Images (Subj 1)', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
matlabbatch{5}.spm.spatial.smooth.fwhm = [4 4 4];
matlabbatch{5}.spm.spatial.smooth.dtype = 0;
matlabbatch{5}.spm.spatial.smooth.im = 0;
matlabbatch{5}.spm.spatial.smooth.prefix = 's';
matlabbatch{6}.spm.tools.oldnorm.estwrite.subj.source = '<UNDEFINED>';
matlabbatch{6}.spm.tools.oldnorm.estwrite.subj.wtsrc = '';
matlabbatch{6}.spm.tools.oldnorm.estwrite.subj.resample = '<UNDEFINED>';
matlabbatch{6}.spm.tools.oldnorm.estwrite.eoptions.template = {'C:\Users\Karla\Documents\MATLAB\spm12\spm12\toolbox\OldNorm\T1.nii,1'};
matlabbatch{6}.spm.tools.oldnorm.estwrite.eoptions.weight = '';
matlabbatch{6}.spm.tools.oldnorm.estwrite.eoptions.smosrc = 8;
matlabbatch{6}.spm.tools.oldnorm.estwrite.eoptions.smoref = 0;
matlabbatch{6}.spm.tools.oldnorm.estwrite.eoptions.regtype = 'mni';
matlabbatch{6}.spm.tools.oldnorm.estwrite.eoptions.cutoff = 25;
matlabbatch{6}.spm.tools.oldnorm.estwrite.eoptions.nits = 16;
matlabbatch{6}.spm.tools.oldnorm.estwrite.eoptions.reg = 1;
matlabbatch{6}.spm.tools.oldnorm.estwrite.roptions.preserve = 0;
matlabbatch{6}.spm.tools.oldnorm.estwrite.roptions.bb = [-78 -112 -70
                                                         78 76 85];
matlabbatch{6}.spm.tools.oldnorm.estwrite.roptions.vox = [3 3 3];
matlabbatch{6}.spm.tools.oldnorm.estwrite.roptions.interp = 1;
matlabbatch{6}.spm.tools.oldnorm.estwrite.roptions.wrap = [0 0 0];
matlabbatch{6}.spm.tools.oldnorm.estwrite.roptions.prefix = 'w';
