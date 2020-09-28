%% INVOKE TETRODE SPIKE SORTING USING SPYKING CIRCUS
%  @author: Aamir Abbasi
%  --------------------------------------------------
clc;clear;close all;tic;
disp('running...');

% Initialization (change rootpath and bmiBlocks according to your experiment identifiers) 
rootpath = 'Z:\TDTData\BMI_zBus_RS4-200629-101443\raw_data_RS4\';
bmiBlocks = {'I064-200706_DAT_files','I064-200707_DAT_files','I064-200708_DAT_files'};
paramsfilepath = 'Z:\TDTData\BMI_zBus_RS4-200629-101443\raw_data_RS4\params_tetrode.params';

% Loop over blocks!
for i=1:length(bmiBlocks)
    
    % Run sorting for tetrode 1
    currentpath = [rootpath,bmiBlocks{i},'\Cb\Tetrode_0'];
    cd (currentpath);
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_Cb_tet_0_0.params'));
    if status == 1
        pause(2);
    else
        disp('Failed transfer of params file. Check paramsfilepath and currentpath');
        dbstop;
    end 	
    !activate circus & spyking-circus SU_CONT_Cb_tet_0_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
    
    % Run sorting for tetrode 2
    currentpath = [rootpath,bmiBlocks{i},'\Cb\Tetrode_1'];
    cd (currentpath);
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_Cb_tet_1_0.params'));
    if status == 1
        pause(2);
    else
        disp('Failed transfer of params file. Check paramsfilepath and currentpath');
        dbstop;
    end 	
    !activate circus & spyking-circus SU_CONT_Cb_tet_1_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
    
    % Run sorting for tetrode 3
    currentpath = [rootpath,bmiBlocks{i},'\Cb\Tetrode_2'];
    cd (currentpath);
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_Cb_tet_2_0.params'));
    if status == 1
        pause(2);
    else
        disp('Failed transfer of params file. Check paramsfilepath and currentpath');
        dbstop;
    end 	
    !activate circus & spyking-circus SU_CONT_Cb_tet_2_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
    
    % Run sorting for tetrode 4
    currentpath = [rootpath,bmiBlocks{i},'\Cb\Tetrode_3'];
    cd (currentpath);
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_Cb_tet_3_0.params'));
    if status == 1
        pause(2);
    else
        disp('Failed transfer of params file. Check paramsfilepath and currentpath');
        dbstop;
    end 	
    !activate circus & spyking-circus SU_CONT_Cb_tet_3_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
    
    % Run sorting for tetrode 5
    currentpath = [rootpath,bmiBlocks{i},'\Cb\Tetrode_4'];
    cd (currentpath);
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_Cb_tet_4_0.params'));
    if status == 1
        pause(2);
    else
        disp('Failed transfer of params file. Check paramsfilepath and currentpath');
        dbstop;
    end 	
    !activate circus & spyking-circus SU_CONT_Cb_tet_4_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
    
    % Run sorting for tetrode 6
    currentpath = [rootpath,bmiBlocks{i},'\Cb\Tetrode_5'];
    cd (currentpath);
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_Cb_tet_5_0.params'));
    if status == 1
        pause(2);
    else
        disp('Failed transfer of params file. Check paramsfilepath and currentpath');
        dbstop;
    end 	
    !activate circus & spyking-circus SU_CONT_Cb_tet_5_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
    
    % Run sorting for tetrode 7
    currentpath = [rootpath,bmiBlocks{i},'\Cb\Tetrode_6'];
    cd (currentpath);
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_Cb_tet_6_0.params'));
    if status == 1
        pause(2);
    else
        disp('Failed transfer of params file. Check paramsfilepath and currentpath');
        dbstop;
    end 	
    !activate circus & spyking-circus SU_CONT_Cb_tet_6_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
    
    % Run sorting for tetrode 8
    currentpath = [rootpath,bmiBlocks{i},'\Cb\Tetrode_7'];
    cd (currentpath);
    status = copyfile(paramsfilepath,fullfile(currentpath,'SU_CONT_Cb_tet_7_0.params'));
    if status == 1
        pause(2);
    else
        disp('Failed transfer of params file. Check paramsfilepath and currentpath');
        dbstop;
    end 	
    !activate circus & spyking-circus SU_CONT_Cb_tet_7_0.dat -m filtering,whitening,clustering,fitting,merging,converting -c 6
    
end
runTime = toc;
disp(['done! time elapsed (hours) - ', num2str(runTime/3600)]);