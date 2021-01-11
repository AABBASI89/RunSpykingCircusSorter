%% INVOKE CAMBRIDGE TECH POLYTRODE SPIKE SORTING ON SPYKING CIRCUS
%  @author: Aamir Abbasi
%  ---------------------------------------------------------------------
clc;clear;close all;tic;
disp('running...');

% Initialization (change rootpath and bmiBlocks according to your experiment identifiers)
rootpath = 'Z:\M1_Cb_Reach\I076\RS4_Data\';
bmiBlocks = {'I076-201211_DAT_files','I076-201212_DAT_files'};
paramsfilepath = 'Z:\TDTData\BMI_zBus_RS4_RV2_Cb64-201130-100839\raw_data_RS4\params_polytrode.params';

% Loop over blocks!
for i=1:length(bmiBlocks)
  
  % Run sorting for polytrode 1
  currentpath = [rootpath,bmiBlocks{i},'\Cb\Polytrode_0'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_Cb_poly_0_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_Cb_poly_0_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_Cb_poly_0_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for polytrode 2
  currentpath = [rootpath,bmiBlocks{i},'\Cb\Polytrode_1'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_Cb_poly_1_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_Cb_poly_1_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_Cb_poly_1_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for polytrode 3
  currentpath = [rootpath,bmiBlocks{i},'\Cb\Polytrode_2'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_Cb_poly_2_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_Cb_poly_2_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_Cb_poly_2_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for polytrode 4
  currentpath = [rootpath,bmiBlocks{i},'\Cb\Polytrode_3'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_Cb_poly_3_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_Cb_poly_3_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_Cb_poly_3_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
end
runTime = toc;
disp(['done! time elapsed (hours) - ', num2str(runTime/3600)]);