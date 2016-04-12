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
size_of_train = highest_frequency_of_data - size_of_test;
%calculating what the size of test and train data would be

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
    %add code for all classification algorithm
    %end code for all classification algorithm
    i=i+1;
    test_data=[];
    train_data=[];
end
%creating folds using this while loop
