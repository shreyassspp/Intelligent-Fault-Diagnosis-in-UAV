clc;
clear;


M = readmatrix('testdata.txt');
cols = size(M,2);
rows = size(M,1);

x_test = M(:,1:cols-1);
y_test = M(:,cols);

model = loadLearnerForCoder('multiSVM.mat');

result = predict(model,x_test);
accuracy = sum(result == y_test)/length(y_test)*100;
sp = sprintf("Test accuracy = %.2f", accuracy);
disp(sp);

% x axis = predicted and y axis = true.
C = confusionmat(y_test,result);
confusionchart(C) 
model