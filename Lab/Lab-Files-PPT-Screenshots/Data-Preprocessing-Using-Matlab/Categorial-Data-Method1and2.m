%% -------------- Categorical data------------------
%% -------------- Method 1: Categorical data (no order)----------
% ---------------------------- Code -----------------------------
clc
clear all
close all
data = readtable('F:\IoT Lab Session\environmentalmonitoringusecase\Code+and+Data\Machine Learning for Data Science using MATLAB\Data Preprocessing\Data_5.csv')


data = categorical_data_to_dummy_variables(data,data.Location);
data.Location = [];

pause(10)


clc
clear all
close all
data = readtable('F:\IoT Lab Session\environmentalmonitoringusecase\Code+and+Data\Machine Learning for Data Science using MATLAB\Data Preprocessing\Data_6.csv')


% -------------- Method 2: Categorical data (with order)----------
% ---------------------------- Code -----------------------------

new_variable = categorical_data_to_numbers(data.YearlyIncome,{'Average', 'High', 'Very High', 'Low'}, [2 3 5 1]);
data.YearlyIncome = new_variable