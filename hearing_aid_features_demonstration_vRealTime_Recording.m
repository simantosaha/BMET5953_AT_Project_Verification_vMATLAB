close all; clearvars; clc;

Fs = 44100; % sampling rate
nBits = 16; % # of bits/sample
nChannels = 1; % # of channel
ID = -1; % audio device identifier

recObj = audiorecorder(Fs,nBits,nChannels,ID); % create an audio recorder object

recDuration = 30; % record for 30 seconds

% timers at 0, 25 and 30 s, respectively.
t1 = timer; t2 = timer; t3 = timer;
t1.StartDelay = 0; t2.StartDelay = 25; t3.StartDelay = 30;
t1.TimerFcn = @(~,~)disp('Speak for 30 seconds');
t2.TimerFcn = @(~,~)disp('5 seconds Remaining!');
t3.TimerFcn = @(~,~)disp('End of the Recording.');
start(t1); start(t2); start(t3);

recordblocking(recObj,recDuration); %  recording audio from an input device
audSig = recObj.getaudiodata; % extracting the audio in a double array

xtimes = input("enter the sound amplication factor (0.00 - 3.00) = "); % audio amplification factor (0 - 3)
sound(xtimes*audSig,Fs,nBits); % volume range: mute(0) to 3x

transcriber = speechClient("wav2vec2.0"); % a pretrained deep learning model

transcript = speech2text(transcriber,audSig,Fs); % specch-to-text

transcript_wrds = transcript.Transcript; % recognised words by "wav2vec2.0"

% text-to-speech: spch_speed range -10 (slowest) to 10 (fastest), 0 for
% original speed
txt2spch(transcript_wrds,spch_speed); % text-to-speech