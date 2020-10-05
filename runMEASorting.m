%% INVOKE TDT MULTI-ELECTRODE ARRAY SPIKE SORTING USING SPYKING CIRCUS
%  @author: Aamir Abbasi
%  --------------------------------------------------------------------
clc;clear;close all;tic;
disp('running...');

% Initialization (change rootpath and bmiBlocks according to your experiment identifiers)
rootpath = 'Z:\TDTData\Acute_Neuromod_New-200929-144807\';
bmiBlocks = {'I068-200929_DAT_files'};
paramsfilepath = 'Z:\TDTData\BMI_zBus_RS4-200629-101443\raw_data_RS4\params_mea.params';

% Loop over blocks!
for i=1:length(bmiBlocks)
  
  % Run sorting for channel 1
  currentpath = [rootpath,bmiBlocks{i},'\Channel_0'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_0_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_0_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_0_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 2
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_1'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_1_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_1_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_1_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 3
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_2'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_2_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_2_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_2_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 4
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_3'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_3_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_3_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_3_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 5
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_4'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_4_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_4_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_4_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 6
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_5'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_5_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_5_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_5_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 7
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_6'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_6_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_6_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_6_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 8
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_7'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_7_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_7_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_7_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 9
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_8'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_8_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_8_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_8_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 10
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_9'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_9_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_9_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_9_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 11
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_10'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_10_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_10_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_10_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 12
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_11'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_11_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_11_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_11_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 13
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_12'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_12_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_12_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_12_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 14
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_13'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_13_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_13_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_13_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 15
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_14'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_14_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_14_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_14_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 16
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_15'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_15_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_15_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_15_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 17
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_16'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_16_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_16_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_16_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 18
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_17'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_17_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_17_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_17_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 19
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_18'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_18_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_18_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_18_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 20
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_19'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_19_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_19_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_19_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 21
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_20'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_20_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_20_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_20_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 22
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_21'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_21_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_21_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_21_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 23
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_22'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_22_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_22_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_22_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 24
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_23'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_23_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_23_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_23_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 25
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_24'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_24_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_24_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_24_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 26
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_25'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_25_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_25_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_25_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 27
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_26'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_26_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_26_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_26_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 28
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_27'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_27_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_27_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_27_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 29
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_28'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_28_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_28_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_28_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 30
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_29'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_29_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_29_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_29_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 31
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_30'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_30_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_30_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_30_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
  % Run sorting for channel 32
  currentpath = [rootpath,bmiBlocks{i},'\M1\Channel_31'];
  cd (currentpath);
  if ~isfile(fullfile(currentpath,'SU_CONT_M1_Ch_31_0.params'))
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_M1_Ch_31_0.params'));
    if status == 1
      pause(2);
    else
      disp('Failed transfer of params file. Check paramsfilepath and currentpath');
      dbstop;
    end
  end
  !activate circus & spyking-circus SU_CONT_M1_Ch_31_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
  
end
runTime = toc;
disp(['done! time elapsed (hours) - ', num2str(runTime/3600)]);