%% Initialization
clear ; close all; clc

% SVM Parameters
C = 1; sigma = 0.1;

x1 = [1 2 1]; x2 = [0 4 -1]; 
sim = gaussianKernel(x1, x2, sigma);

fprintf('\nTraining SVM with RBF Kernel (this may take 1 to 2 minutes) ...\n');

M = readmatrix('diabetes.csv');

rows = size(M,1);
cols = size(M,2);

x = M(:,1:cols-1);
Y = M(:,cols);

X = normalize(x);

[train_idx, ~, test_idx] = dividerand(rows, 0.8, 0.2);

x_train = X(train_idx, :);
y_train = Y(train_idx,:);
x_test = X(test_idx,:);
y_test = Y(test_idx,:);

%model= svmTrain(x_train, y_train, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
model = svmTrain(x_train, y_train, C, @linearKernel, 1e-3, 20);

p = svmPredict(model, x_test);

fprintf('Training Accuracy: %f\n', mean(double(p == y_test)) * 100);