
%% -------------- Feature Scalling -------------------------------
clc
clear all
close all
data = readtable('F:\IoT Lab Session\environmentalmonitoringusecase\Code+and+Data\Machine Learning for Data Science using MATLAB\Data Preprocessing\Data_4.csv')


% -------------- Method 1: Standardization ----------------------
% ---------------------------- Code -----------------------------

stand_age = (data.Age - mean(data.Age))/std(data.Age)
data.Age = stand_age; 


% -------------- Method 2: Normalization ------------------------
% ---------------------------- Code -----------------------------
normalize_age = (data.Age - min(data.Age)) / (max(data.Age) - min(data.Age))
data.Age = normalize_age;

%________________________________________________________________
%________________________________________________________________




%writetable(data,'D:\preprocessed_data.csv'); 