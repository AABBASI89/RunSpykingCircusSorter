%% Get TimeStamps and Waveforms from units sorted using Spyking Circus
%  Author: Aamir Abbasi
%  ---------------------------------------------------------------------
%% Read spike times and waveforms from Cb for I061 and I064
clear;clc;close all; tic;
path = 'Z:\Aamir\BMI\I061\';
savepath = 'Z:\Aamir\BMI\I061\Data\';
sessions = {'I061-200505_DAT_files','I061-200506_DAT_files',...
  'I061-200507_DAT_files','I061-200508_DAT_files','I061-200509_DAT_files'};
totTetrodes = 8;
nChans = 4; % 4 channels per tetrode
d = 'Tetrode_'; %'Tetrode_' For Neuronexus probes %'Polytrode_' For Cambridge probes
spkwflen_before = 15; % in samples
spkwflen_after  = 16;
fs = 24414;
for i=1:length(sessions)
  blocks = dir([savepath,sessions{i}(1:11),'*']);
  currentsavepath = [savepath,blocks(i).name];
  for b = 1:length(blocks)
    for tet = 1:totTetrodes
      folder = ['\SU_CONT_Cb_tet_',num2str(tet-1),'_0\SU_CONT_Cb_tet_',num2str(tet-1),'_0.GUI\'];
      spike_times    = double(readNPY([path,sessions{i},'\Cb\Tetrode_',num2str(tet-1),folder,'spike_times.npy']));
      spike_clusters = readNPY([path,sessions{i},'\Cb\Tetrode_',num2str(tet-1),folder,'spike_clusters.npy']);
      cluster_info = tdfread([path,sessions{i},'\Cb\Tetrode_',num2str(tet-1),folder,'cluster_info.tsv']);
      ch = cluster_info.ch;
      labels2 = cluster_info.group;
      curChanPath = [path,sessions{i},'\Cb\Tetrode_',num2str(tet-1),'\SU_CONT_Cb_tet_',num2str(tet-1),'_',num2str(b-1),'.dat'];
      fiD = fopen(curChanPath,'r');
      chan_cont = fread(fiD,'float32');
      chan_cont = reshape(chan_cont,nChans,length(chan_cont)/nChans); 
      for unit=1:size(labels2,1)
        disp(['Tetrode-',num2str(tet),' Unit-',num2str(unit)]);
        curChan_cont = chan_cont(ch(unit)+1,:);
        st = (spike_times(spike_clusters==unit-1))';
        if ~isempty(st)
          for w=1:10
            samples = ((st(w))-spkwflen_before):((st(w))+spkwflen_after);
            valid_inds = logical(((1:length(curChan_cont))>samples(1)).*((1:length(curChan_cont))<samples(end)));
            wf(:,w) = curChan_cont(valid_inds);
          end
          TimeStamps2{tet,unit+1} = st./fs;
          Waves2{tet,unit+1} = wf;
        end
        clear wf
      end
    end
    if ~exist(currentsavepath, 'dir')
      mkdir(currentsavepath);
    end
    save([currentsavepath,'\Timestamps.mat'], 'TimeStamps2','Waves2','labels2');
  end
end
runTime = toc;
disp(['done! time elapsed (hours) - ', num2str(runTime/3600)]);

%%