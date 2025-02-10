%% --------------- Importing the dataset -------------------------
% ---------------------------- Code ---------------------------
data = readtable('F:\IoT Lab Session\environmentalmonitoringusecase\Code+and+Data\Machine Learning for Data Science using MATLAB\Data Preprocessing\Data_1.csv')


%%---------------Data Preprocessing -----------------------------
% -------------- Handling Missing Values ------------------------

% % -------------- Method 1: Deleting rows or column --------------
% % ---------------------------- Code ---------------------------
% % 
% complete_data = rmmissing(data)
% complete_data = rmmissing(data,2)
% data = complete_data
% % 
% % % -------------- Method 1.1: Deleting rows or columns based on
% % % -------------------------- Relative Percentage of missing---
% % % ---------------------------- Code ---------------------------
% % 
% restricted_missing = rmmissing(data,'MinNumMissing',3);
% restricted_missing = rmmissing(data,2,'MinNumMissing',2);
% restricted_missing = rmmissing(data,2,'MinNumMissing',3);
% 
% data = restricted_missing
% 
% % -------------- Method 2: Using Mean --------------------------
% % ---------------------------- Code ---------------------------
% 
M_Age = mean(data.Age, 'omitnan');
U_Age = fillmissing(data.Age, 'constant',M_Age);
data.Age = U_Age
