clc; close all; clear;

filename="../python/earthquake_data_clean.txt";
logFile= fopen(filename,'r');

%get data
formatSpec='%f';
sizeData = [1 Inf];
Data=fscanf(logFile,formatSpec,sizeData);
Data=Data';

%% Q17 Plot the data both in time and frequency domain



