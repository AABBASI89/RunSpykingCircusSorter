%% INVOKE TDT MULTI-ELECTRODE ARRAY SPIKE SORTING USING SPYKING CIRCUS
%  @author: Aamir Abbasi
%  --------------------------------------------------------------------
clc;clear;close all;tic;
disp('running...');

% Initialization (change rootpath and bmiBlocks according to your experiment identifiers)
rootpath = 'Z:\TDTData\Acute_Neuromod_New-200929-144807\';
bmiBlocks = {'I071-201008_DAT_files'}; 
% I070-201006_DAT_files I069-200930_DAT_files I068-200929_DAT_files 
paramsfilepath = 'Z:\TDTData\BMI_zBus_RS4-200629-101443\raw_data_RS4\params_mea.params';

% Loop over channels!
totChans = 32;
for i=25:totChans
  
  % Run sorting for channel i
  currentpath = [rootpath,bmiBlocks{1},'\Channel_',num2str(i)];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT.dat -m whitening,clustering,fitting,merging,converting -c 6
  
end
runTime = toc;
disp(['done! time elapsed (hours) - ', num2str(runTime/3600)]);