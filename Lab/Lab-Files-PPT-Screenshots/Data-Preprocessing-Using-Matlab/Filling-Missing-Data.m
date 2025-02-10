clc
clear all
close all
data = readtable('F:\IoT Lab Session\environmentalmonitoringusecase\Code+and+Data\Machine Learning for Data Science using MATLAB\Data Preprocessing\Data_1.csv')


M_Age = mean(data.Age, 'omitnan');
U_Age = fillmissing(data.Age, 'constant',M_Age);
data.Age = U_Age
