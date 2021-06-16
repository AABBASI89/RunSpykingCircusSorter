%% Get TimeStamps and Waveforms from units sorted using Spyking Circus
%  Author: Aamir Abbasi
%  ---------------------------------------------------------------------
%% Read spike times and waveforms from M1
clear;clc;close all; tic;
path = 'Z:\Aamir\BMI\I086\';
savepath = 'Z:\Aamir\BMI\I086\Data\';
sessions = {'I086-210511_DAT_files','I086-210506_DAT_files','I086-210507_DAT_files','I086-210512_DAT_files',...
    'I086-210513_DAT_files','I086-210514_DAT_files'};
totChans = 32;
d = 'Channel'; %'Channel' for TDT Microwire arrays
spkwflen_before = 6; % in samples
spkwflen_after  = 16;
Fs = 24414;
for i=4:length(sessions)
    blocks = dir([savepath,sessions{i}(1:11),'*']);
    % Loop over blocks to read their lengths
    for b = 1:length(blocks)
        curChanPath = [path,sessions{i},'\M1\',d,'_',num2str(0),'\SU_CONT_M1_Ch_',num2str(0),'_',num2str(b-1),'.dat'];
        fiD = fopen(curChanPath,'r');
        chan_cont = fread(fiD,'float32');
        fclose(fiD); % to prevent too many files open error!
        if b==1
            curBlockLen(b) = length(chan_cont);
        else
            curBlockLen(b) = curBlockLen(b-1)+length(chan_cont);
        end
    end
    % Loops to extract timestamps and waveforms
    for b = 1:length(blocks)
        disp(['Block-',blocks(b).name]);
        currentsavepath = [savepath,blocks(b).name];
        for ch = 1:totChans
            folder = ['\SU_CONT_M1_Ch_',num2str(ch-1),'_0\SU_CONT_M1_Ch_',num2str(ch-1),'_0.GUI\'];
            spike_times    = double(readNPY([path,sessions{i},'\M1\',d,'_',num2str(ch-1),folder,'spike_times.npy']));
            spike_clusters = readNPY([path,sessions{i},'\M1\',d,'_',num2str(ch-1),folder,'spike_clusters.npy']);
            cluster_info = tdfread([path,sessions{i},'\M1\',d,'_',num2str(ch-1),folder,'cluster_info.tsv']);
            g = cluster_info.group;
            g = cellstr(g)';
            curChanPath = [path,sessions{i},'\M1\',d,'_',num2str(ch-1),'\SU_CONT_M1_Ch_',num2str(ch-1),'_',num2str(b-1),'.dat'];
            fiD = fopen(curChanPath,'r');
            curChan_cont = fread(fiD,'float32');
            fclose(fiD);
            for unit=1:size(g,2)
                disp(['Channel-',num2str(ch),' Unit-',num2str(unit)]);
                st = (spike_times(spike_clusters==unit-1))';
                if b==1
                    st = st(st<curBlockLen(b));
                else
                    st = st(st>curBlockLen(b-1) & st<curBlockLen(b))-curBlockLen(b-1);
                end
                if ~isempty(st)
                    %           for w=1:10
                    %             samples = ((st(w))-spkwflen_before):((st(w))+spkwflen_after);
                    %             valid_inds = logical(((1:length(curChan_cont))>samples(1)).*((1:length(curChan_cont))<samples(end)));
                    %             wf(:,w) = curChan_cont(valid_inds);
                    %           end
                    TimeStamps1{ch,unit+1} = st./Fs;
                    %           Waves1{ch,unit+1} = wf;
                    Labels1{ch,unit+1} = g{unit};
                end
                %         clear wf
            end
        end
        if ~exist(currentsavepath, 'dir')
            mkdir(currentsavepath);
        end
        save([currentsavepath,'\Timestamps_M1.mat'], 'TimeStamps1','Labels1'); %'Waves1'
    end
end
runTime = toc;
disp(['done! time elapsed (hours) - ', num2str(runTime/3600)]);

%%