%% Initialization
clc;
clear;
close all;

% SVM Parameters
M = readmatrix('fault_data_multiclass.xlsx');

rows = size(M,1);
cols = size(M,2);

x = M(:,2:cols-1);
Y = M(:,cols);

X = normalize(x);


[train_idx, ~, test_idx] = dividerand(rows, 0.8, 0.2);
%training set
x_train = X(train_idx, :);
y_train = Y(train_idx,:);
%test sets
x_test = X(test_idx,:);
y_test = Y(test_idx,:);

newM = [x_test y_test];

writematrix(newM,'testdata')


% Inbuilt SVM implement
model = fitcecoc(x_train,y_train,'optimizeHyperparameters','auto',...
    'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
    'expected-improvement-plus','ShowPlots',true));

saveLearnerForCoder(model,'multiSVM');

