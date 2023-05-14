close all; clearvars; clc;


nBits = 16; % # of bits/sample

[audSig,Fs] = audioread("rec14.m4a"); % read an audio file (rec1.m4a, rec2.m4a, ... ..., rec14.m4a)

xtimes = input("enter the sound amplication factor (0.00 - 3.00) = "); % audio amplification factor (0 - 3)
sound(xtimes*audSig,Fs,nBits); % volume range: mute(0) to 3x

transcriber = speechClient("wav2vec2.0"); % a pretrained deep learning model

transcript = speech2text(transcriber,audSig,Fs); % specch-to-text

transcript_wrds = transcript.Transcript; % recognised words by "wav2vec2.0"

% text-to-speech: spch_speed range -10 (slowest) to 10 (fastest), 0 for
% original speed
txt2spch(transcript_wrds,spch_speed); 