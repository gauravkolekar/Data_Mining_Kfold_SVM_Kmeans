%{
Data Mining Project 2 and 3
Algorithm Name: SVM
Team Members:
Gaurav Vivek Kolekar
Brijesh Danhkara
%}
clear all
clc

A = load('HandWrittenLetters.txt');

AA = A(2:321,:);

labels = A(1,:);
test = load('handbinary.txt');
train = ones(5,1014) - test;

L = train(train~=0);
L = reshape(L,5, 806);
numberss = 1:1014;
AA = [numberss; AA];

for j = 1:5
for i = 1:1014
        L(j,i) = train(j,i)*numberss(1,i);
end
end

for j = 1:5
for i = 1:1014
        M(j,i) = test(j,i)*numberss(1,i);
end
end 

trainSet1 = L(1,:);
L1 = trainSet1(trainSet1~=0);
L1 = reshape(L1,1, 806);
trainSet2 = L(2,:);
L2 = trainSet2(trainSet2~=0);
L2 = reshape(L2,1, 806);
trainSet3 = L(3,:);
L3 = trainSet3(trainSet3~=0);
L3 = reshape(L3,1, 806);
trainSet4 = L(4,:);
L4 = trainSet4(trainSet4~=0);
L4 = reshape(L4,1, 806);
trainSet5 = L(5,:);
L5 = trainSet5(trainSet5~=0);
L5 = reshape(L5,1, 806);

c1 = 1;
for i = 1:806
    for j = 1:1014
        if (L1(1,i) == j) 
            if c1 ~= 807
                X1(:,c1) = AA(:,j);
                c1 = c1 + 1;
            end
        end
    end
end
        
c1 = 1;
for i = 1:806
    for j = 1:1014
        if (L2(1,i) == j) 
            if c1 ~= 807
                X2(:,c1) = AA(:,j);
                c1 = c1 + 1;
            end
        end
    end
end

c1 = 1;
for i = 1:806
    for j = 1:1014
        if (L3(1,i) == j) 
            if c1 ~= 807
                X3(:,c1) = AA(:,j);
                c1 = c1 + 1;
            end
        end
    end
end

c1 = 1;
for i = 1:806
    for j = 1:1014
        if (L4(1,i) == j) 
            if c1 ~= 807
                X4(:,c1) = AA(:,j);
                c1 = c1 + 1;
            end
        end
    end
end

c1 = 1;
for i = 1:806
    for j = 1:1014
        if (L5(1,i) == j) 
            if c1 ~= 807
                X5(:,c1) = AA(:,j);
                c1 = c1 + 1;
            end
        end
    end
end

testSet1 = M(1,:);
M1 = testSet1(testSet1~=0);
M1 = reshape(M1,1, 208);
testSet2 = M(2,:);
M2 = testSet2(testSet2~=0);
M2 = reshape(M2,1, 208);
testSet3 = M(3,:);
M3 = testSet3(testSet3~=0);
M3 = reshape(M3,1, 208);
testSet4 = M(4,:);
M4 = testSet4(testSet4~=0);
M4 = reshape(M4,1, 208);
testSet5 = M(5,:);
M5 = testSet5(testSet5~=0);
M5 = reshape(M5,1, 208);

c1 = 1;
for i = 1:208
    for j = 1:1014
        if (M1(1,i) == j) 
            if c1 ~= 209
                Y1(:,c1) = AA(:,j);
                c1 = c1 + 1;
            end
        end
    end
end

c1 = 1;
for i = 1:208
    for j = 1:1014
        if (M2(1,i) == j) 
            if c1 ~= 209
                Y2(:,c1) = AA(:,j);
                c1 = c1 + 1;
            end
        end
    end
end
c1 = 1;
for i = 1:208
    for j = 1:1014
        if (M3(1,i) == j) 
            if c1 ~= 209
                Y3(:,c1) = AA(:,j);
                c1 = c1 + 1;
            end
        end
    end
end
c1 = 1;
for i = 1:208
    for j = 1:1014
        if (M4(1,i) == j) 
            if c1 ~= 209
                Y4(:,c1) = AA(:,j);
                c1 = c1 + 1;
            end
        end
    end
end
c1 = 1;
for i = 1:208
    for j = 1:1014
        if (M5(1,i) == j) 
            if c1 ~= 209
                Y5(:,c1) = AA(:,j);
                c1 = c1 + 1;
            end
        end
    end
end

X1 = X1(2:end,:);
X2 = X2(2:end,:);
X3 = X3(2:end,:);
X4 = X4(2:end,:);
X5 = X5(2:end,:);

Y1 = Y1(2:end,:);
Y2 = Y2(2:end,:);
Y3 = Y3(2:end,:);
Y4 = Y4(2:end,:);
Y5 = Y5(2:end,:);

%creating test labels
test_labels=[ ...
    1,1,1,1,1,1,1,1, ...
    2,2,2,2,2,2,2,2, ...
    3,3,3,3,3,3,3,3, ...
    4,4,4,4,4,4,4,4, ...
    5,5,5,5,5,5,5,5, ...
    6,6,6,6,6,6,6,6, ...
    7,7,7,7,7,7,7,7, ...
    8,8,8,8,8,8,8,8, ...
    9,9,9,9,9,9,9,9, ...
    10,10,10,10,10,10,10,10, ...
    11,11,11,11,11,11,11,11, ...
    12,12,12,12,12,12,12,12, ...
    13,13,13,13,13,13,13,13, ...
    14,14,14,14,14,14,14,14, ...
    15,15,15,15,15,15,15,15, ...
    16,16,16,16,16,16,16,16, ...
    17,17,17,17,17,17,17,17, ...
    18,18,18,18,18,18,18,18, ...
    19,19,19,19,19,19,19,19, ...
    20,20,20,20,20,20,20,20, ...
    21,21,21,21,21,21,21,21, ...
    22,22,22,22,22,22,22,22, ...
    23,23,23,23,23,23,23,23, ...
    24,24,24,24,24,24,24,24, ...
    25,25,25,25,25,25,25,25, ...
    26,26,26,26,26,26,26,26, ...
    ];
%end of creation of test labels

%creation of train labels
w = 31;
n = 26;
train_labels= repmat(1:n,[w 1]);
train_labels = train_labels(:)';
%end creation of train labels

%starting SVM(kernel=linear)
%iteration1
model_linear1 = svmtrain(train_labels',X1','-s 1 -t 0');
[predict_label_linear1,accuracy_linear1,dec_value_linear1] = svmpredict(test_labels',Y1',model_linear1);
disp(predict_label_linear1')
disp(accuracy_linear1')
%iteration2
model_linear2 = svmtrain(train_labels',X2','-s 1 -t 0');
[predict_label_linear2,accuracy_linear2,dec_value_linear2] = svmpredict(test_labels',Y2',model_linear2);
disp(predict_label_linear2')
disp(accuracy_linear2')
%iteration3
model_linear3 = svmtrain(train_labels',X3','-s 1 -t 0');
[predict_label_linear3,accuracy_linear3,dec_value_linear3] = svmpredict(test_labels',Y3',model_linear3);
disp(predict_label_linear3')
disp(accuracy_linear3')
%iteration4
model_linear4 = svmtrain(train_labels',X4','-s 1 -t 0');
[predict_label_linear4,accuracy_linear4,dec_value_linear4] = svmpredict(test_labels',Y4',model_linear4);
disp(predict_label_linear4')
disp(accuracy_linear4')
%iteration5
model_linear5 = svmtrain(train_labels',X5','-s 1 -t 0');
[predict_label_linear5,accuracy_linear5,dec_value_linear5] = svmpredict(test_labels',Y5',model_linear5);
disp(predict_label_linear5')
disp(accuracy_linear5')
%end of SVM(kernel=linear)

%start of SVM(kernel=Gaussian)
%iteration1
model_gaussian1 = svmtrain(train_labels',X1','-s 1 -t 2');
[predict_label_gaussian1,accuracy_gaussian1,dec_value_gaussian1] = svmpredict(test_labels',Y1',model_gaussian1);
disp(predict_label_gaussian1')
disp(accuracy_gaussian1')
%iteration2
model_gaussian2 = svmtrain(train_labels',X2','-s 1 -t 2');
[predict_label_gaussian2,accuracy_gaussian2,dec_value_gaussian2] = svmpredict(test_labels',Y2',model_gaussian2);
disp(predict_label_gaussian2')
disp(accuracy_gaussian2')
%iteration3
model_gaussian3 = svmtrain(train_labels',X3','-s 1 -t 2');
[predict_label_gaussian3,accuracy_gaussian3,dec_value_gaussian3] = svmpredict(test_labels',Y3',model_gaussian3);
disp(predict_label_gaussian3')
disp(accuracy_gaussian3')
%iteration4
model_gaussian4 = svmtrain(train_labels',X4','-s 1 -t 2');
[predict_label_gaussian4,accuracy_gaussian4,dec_value_gaussian4] = svmpredict(test_labels',Y4',model_gaussian4);
disp(predict_label_gaussian4')
disp(accuracy_gaussian4')
%iteration5
model_gaussian5 = svmtrain(train_labels',X5','-s 1 -t 2');
[predict_label_gaussian5,accuracy_gaussian5,dec_value_gaussian5] = svmpredict(test_labels',Y5',model_gaussian5);
disp(predict_label_gaussian5')
disp(accuracy_gaussian5')
%end of SVM(kernel=Gaussian)

%final accuracy linear
final_accuracy_linear = (accuracy_linear1(1,1)+accuracy_linear2(1,1)+accuracy_linear3(1,1)+accuracy_linear4(1,1)+accuracy_linear5(1,1))/5;
disp('Final linear accuracy');
disp(final_accuracy_linear);
%end final accuracy linear

%final accuracy gaussian
final_accuracy_gaussian = (accuracy_gaussian1(1,1)+accuracy_gaussian2(1,1)+accuracy_gaussian3(1,1)+accuracy_gaussian4(1,1)+accuracy_gaussian5(1,1))/5;
disp('Final gaussian accuracy');
disp(final_accuracy_gaussian);
%end final accuracy gaussian
