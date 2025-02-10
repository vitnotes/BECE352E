
%% -------------- Handling Outliers-------------------------------


clc
clear all
close all
data = readtable('F:\IoT Lab Session\environmentalmonitoringusecase\Code+and+Data\Machine Learning for Data Science using MATLAB\Data Preprocessing\Data_5.csv')

% -------------- Method 1: Deleting Rows ------------------------
% ---------------------------- Code -----------------------------

outlier = isoutlier(data.Age);
data = data(~outlier,:); 



% -------------- Method 2: Filling Outliers ---------------------
% ---------------------------- Code -----------------------------
% 
Age = filloutliers(data.Age,'clip','mean')
data.Age = Age;
