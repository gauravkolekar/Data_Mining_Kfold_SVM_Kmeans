clear all
clc
%{
Data Mining Project 2 and 3
Algorithm Name: Kfold Algorithm
Team Members:
Gaurav Vivek Kolekar
Brijesh Danhkara
%}

data_load_complete = dlmread('ATNTFaceImage400.txt',',');
data_load = data_load_complete(2:end,1:end);
number_of_classes = 40;
%reading data

[number_of_rows,number_of_columns] = size(data_load_complete);
%storing the dimension of the data

K = input('Enter the number of folds: ');
%reading the value for number of folds from user

[M,highest_frequency_of_data] = mode(data_load_complete(1,1:end));
%calculating the frequency of each class label

residual = mod(highest_frequency_of_data,K);
%calculating residual which determines the size of the test and train

size_of_test = floor(highest_frequency_of_data/K);
%calculating what the size of test

test_labels = zeros(1,80);
z=1;
Q = 1:2:80;
for i = Q
    for j = 0:1
        test_labels(i+j)=z;
    end
    z=z+1;
end
train_labels = zeros(1,320);
z=1;
R=1:8:320;
for i = R
    for j=0:7
        train_labels(i+j)=z;
    end
    z=z+1;
end
%creating train_labels and test_labels
average_linear_accuracy =0;
average_gaussian_accuracy=0;
new_size_of_test = 0;
train_data = [];
test_data = [];
temp = [];
AA = 1:highest_frequency_of_data:number_of_columns;
sum_to_subtract=0;
i=1; %i indicates fold value
while i<(K+1)
    for r=AA
        if residual>0
            if new_size_of_test>=0 && new_size_of_test < size_of_test+1
                new_size_of_test = size_of_test+1;
            end
        else
            new_size_of_test = 0;
        end
        if residual>0
            if r==1
                test_data=[test_data data_load(1:end,r:(new_size_of_test))];
                temp =setdiff(data_load(1:end,r:highest_frequency_of_data)',test_data(1:end,r:new_size_of_test)','rows');
                train_data = [train_data temp'];
            else
                test_data=[test_data data_load(1:end,r:r+(new_size_of_test)-1)];
                temp = setdiff(data_load(1:end,(r-sum_to_subtract):(r-sum_to_subtract)+(highest_frequency_of_data)-1)',test_data(1:end,1:end)','rows');
                train_data = [train_data temp'];
            end
        else
            if r==1
                test_data=[test_data data_load(1:end,r:(size_of_test))];
                temp = setdiff(data_load(1:end,r:highest_frequency_of_data)',test_data(1:end,r:size_of_test)','rows');
                train_data = [train_data temp'];
            else
                test_data=[test_data data_load(1:end,r:r+(size_of_test)-1)];
                temp = setdiff(data_load(1:end,(r-sum_to_subtract):(r-sum_to_subtract)+(highest_frequency_of_data)-1)',test_data(1:end,1:end)','rows');
                train_data = [train_data temp'];
            end
        end
    end
    if new_size_of_test>0
        AA=AA+new_size_of_test;
        sum_to_subtract = sum_to_subtract+new_size_of_test;
    else
        AA=AA+size_of_test;
        sum_to_subtract = sum_to_subtract+ size_of_test;
    end
    if residual>0
        residual = residual-1;
    end
    %SVM
    %starting SVM(kernel=linear)
    model_linear = svmtrain(train_labels',train_data','-s 1 -t 0');
    [predict_label_linear,accuracy_linear,dec_value_linear] = svmpredict(test_labels',test_data',model_linear);
    average_linear_accuracy = average_linear_accuracy+accuracy_linear;
    %end SVM(kernel=linear)
    %starting SVM(kernel=Gaussian)
    model_gaussian = svmtrain(train_labels',train_data','-s 1 -t 2');
    [predict_label_gaussian,accuracy_gaussian,dec_value_gaussian] = svmpredict(test_labels',test_data',model_gaussian);
    average_gaussian_accuracy=average_gaussian_accuracy+accuracy_gaussian;
    %end SVM(kernel=Gaussian)
    %end SVM
    i=i+1;
    test_data=[];
    train_data=[];
end
%creating folds using this while loop

final_linear_accuracy = average_linear_accuracy/K;
final_gaussian_accuracy = average_gaussian_accuracy/K;
%calculating final average accuracies