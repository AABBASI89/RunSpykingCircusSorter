%% Get TimeStamps and Waveforms from units sorted using Spyking Circus
%  Author: Aamir Abbasi
%  ---------------------------------------------------------------------
%% Read spike times and waveforms from Cb for I061 and I064
clear;clc;close all; tic;
path = 'Z:\Aamir\BMI\I064\';
savepath = 'Z:\Aamir\BMI\I064\Data\';
sessions = {'I064-200629_DAT_files','I064-200630_DAT_files',...
  'I064-200701_DAT_files','I064-200702_DAT_files','I064-200706_DAT_files',...
  'I064-200707_DAT_files','I064-200708_DAT_files'};
totTetrodes = 8;
nChans = 4; % 4 channels per tetrode
d = 'Tetrode'; %'Tetrode' For Neuronexus probes %'Polytrode' For Cambridge probes
spkwflen_before = 6; % in samples
spkwflen_after  = 16;
Fs = 24414;
for i=4%1:length(sessions)
  blocks = dir([savepath,sessions{i}(1:11),'*']);
  % Loop over blocks to read their lengths
  for b = 1:length(blocks)
    curChanPath = [path,sessions{i},'\Cb\',d,'_',num2str(0),'\SU_CONT_Cb_tet_',num2str(0),'_',num2str(b-1),'.dat'];
    fiD = fopen(curChanPath,'r');
    chan_cont = fread(fiD,'float32');
    fclose(fiD); % to prevent too many files open error!
    chan_cont = reshape(chan_cont,nChans,length(chan_cont)/nChans);
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
    for tet = 1:totTetrodes
      folder = ['\SU_CONT_Cb_tet_',num2str(tet-1),'_0\SU_CONT_Cb_tet_',num2str(tet-1),'_0.GUI\'];
      spike_times    = double(readNPY([path,sessions{i},'\Cb\',d,'_',num2str(tet-1),folder,'spike_times.npy']));
      spike_clusters = readNPY([path,sessions{i},'\Cb\',d,'_',num2str(tet-1),folder,'spike_clusters.npy']);
      cluster_info = tdfread([path,sessions{i},'\Cb\',d,'_',num2str(tet-1),folder,'cluster_info.tsv']);
      ch = cluster_info.ch;
      g = cluster_info.group;
      g = cellstr(g)';
      curChanPath = [path,sessions{i},'\Cb\',d,'_',num2str(tet-1),'\SU_CONT_Cb_tet_',num2str(tet-1),'_',num2str(b-1),'.dat'];
      fiD = fopen(curChanPath,'r');
      chan_cont = fread(fiD,'float32');
      fclose(fiD);
      chan_cont = reshape(chan_cont,nChans,length(chan_cont)/nChans); 
      for unit=1:size(g,2)
        disp(['Tetrode-',num2str(tet),' Unit-',num2str(unit)]);
        curChan_cont = chan_cont(ch(unit)+1,:);
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
          TimeStamps2{tet,unit+1} = st./Fs;
%           Waves2{tet,unit+1} = wf;
          Labels2{tet,unit+1} = g{unit};
        end
%         clear wf
      end
    end
    if ~exist(currentsavepath, 'dir')
      mkdir(currentsavepath);
    end
    save([currentsavepath,'\Timestamps_Cb.mat'], 'TimeStamps2','Labels2'); %'Waves2'
  end
end
runTime = toc;
disp(['done! time elapsed (hours) - ', num2str(runTime/3600)]);

%%