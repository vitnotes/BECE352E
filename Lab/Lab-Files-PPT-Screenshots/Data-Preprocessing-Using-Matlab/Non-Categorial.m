% ------------- Method 3: Dealing with non-numeric data --------
% ---------------------------- Code ---------------------------
%% --------------- Importing the dataset -------------------------
% ---------------------------- Code ---------------------------
clc
clear all
close all
data = readtable('F:\IoT Lab Session\environmentalmonitoringusecase\Code+and+Data\Machine Learning for Data Science using MATLAB\Data Preprocessing\Data_1.csv')


data.Opinion = categorical(data.Opinion);
Freq_opinion = mode(data.Opinion);

Opinion = fillmissing(data.Opinion,'constant',cellstr(Freq_opinion));
data.Opinion = Opinion 
