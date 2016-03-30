%{
Data Mining Project 2 and 3
Algorithm Name: SVM
Team Members:
Gaurav Vivek Kolekar
Brijesh Danhkara
%}
clear all
clc

A = load('AtntFaceImage400.txt');

AA = A(2:645,:);
labels = A(1,:);


NR = 5;
NC = 400;
NO = 2;
z = 0;
test = zeros(NR,NC);

for i = 1:NR
    for j = 1:NC
        z = z+1;
        if (z >= 1 && z < 3 && i == 1) || (z >= 3 && z < 5 && i == 2) ...
                || (z >= 5 && z < 7 && i == 3) || (z >= 7 && z < 9 && i == 4) ...
                ||(z >= 9 && z < 11 && i == 5)
            test(i,j) = test(i,j) + 1;
        end
        if z == 10
            z = 0;
        end
    end
end

train = ones(NR,NC) - test;
%train = train';

trainSet1 = bsxfun(@times,AA,train(1,:));
trainSet2 = bsxfun(@times,AA,train(2,:));
trainSet3 = bsxfun(@times,AA,train(3,:));
trainSet4 = bsxfun(@times,AA,train(4,:));
trainSet5 = bsxfun(@times,AA,train(5,:));

L1 = trainSet1(trainSet1~=0);
L1 = reshape(L1,644, 320);
L2 = trainSet2(trainSet2~=0);
L2 = reshape(L2,644, 320);
L3 = trainSet3(trainSet3~=0);
L3 = reshape(L3,644, 320);
L4 = trainSet4(trainSet4~=0);
L4 = reshape(L4,644, 320);
L5 = trainSet5(trainSet5~=0);
L5 = reshape(L5,644, 320);

testSet1 = bsxfun(@times,AA,test(1,:));
testSet2 = bsxfun(@times,AA,test(2,:));
testSet3 = bsxfun(@times,AA,test(3,:));
testSet4 = bsxfun(@times,AA,test(4,:));
testSet5 = bsxfun(@times,AA,test(5,:));

M1 = testSet1(testSet1~=0);
M1 = reshape(M1,644,80);
M2 = testSet2(testSet2~=0);
M2 = reshape(M2,644,80);
M3 = testSet3(testSet3~=0);
M3 = reshape(M3,644,80);
M4 = testSet4(testSet4~=0);
M4 = reshape(M4,644,80);
M5 = testSet5(testSet5~=0);
M5 = reshape(M5,644,80);

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
%starting SVM(kernel=linear)
%iteration1
model_linear1 = svmtrain(train_labels',L1','-s 1 -t 0');
[predict_label_linear1,accuracy_linear1,dec_value_linear1] = svmpredict(test_labels',M1',model_linear1);
%disp(predict_label_linear1')
%disp(accuracy_linear1')
%iteration2
model_linear2 = svmtrain(train_labels',L2','-s 1 -t 0');
[predict_label_linear2,accuracy_linear2,dec_value_linear2] = svmpredict(test_labels',M2',model_linear2);
%disp(predict_label_linear2')
%disp(accuracy_linear2')
%iteration3
model_linear3 = svmtrain(train_labels',L3','-s 1 -t 0');
[predict_label_linear3,accuracy_linear3,dec_value_linear3] = svmpredict(test_labels',M3',model_linear3);
%disp(predict_label_linear3')
%disp(accuracy_linear3')
%iteration4
model_linear4 = svmtrain(train_labels',L4','-s 1 -t 0');
[predict_label_linear4,accuracy_linear4,dec_value_linear4] = svmpredict(test_labels',M4',model_linear4);
%disp(predict_label_linear4')
%disp(accuracy_linear4')
%iteration5
model_linear5 = svmtrain(train_labels',L5','-s 1 -t 0');
[predict_label_linear5,accuracy_linear5,dec_value_linear5] = svmpredict(test_labels',M5',model_linear5);
%disp(predict_label_linear5')
%disp(accuracy_linear5')
%end of SVM(kernel=linear)

%start of SVM(kernel=Gaussian)
%iteration1
model_gaussian1 = svmtrain(train_labels',L1','-s 1 -t 2');
[predict_label_gaussian1,accuracy_gaussian1,dec_value_gaussian1] = svmpredict(test_labels',M1',model_gaussian1);
%disp(predict_label_gaussian1')
%disp(accuracy_gaussian1')
%iteration2
model_gaussian2 = svmtrain(train_labels',L2','-s 1 -t 2');
[predict_label_gaussian2,accuracy_gaussian2,dec_value_gaussian2] = svmpredict(test_labels',M2',model_gaussian2);
%disp(predict_label_gaussian2')
%disp(accuracy_gaussian2')
%iteration3
model_gaussian3 = svmtrain(train_labels',L3','-s 1 -t 2');
[predict_label_gaussian3,accuracy_gaussian3,dec_value_gaussian3] = svmpredict(test_labels',M3',model_gaussian3);
%disp(predict_label_gaussian3')
%disp(accuracy_gaussian3')
%iteration4
model_gaussian4 = svmtrain(train_labels',L4','-s 1 -t 2');
[predict_label_gaussian4,accuracy_gaussian4,dec_value_gaussian4] = svmpredict(test_labels',M4',model_gaussian4);
%disp(predict_label_gaussian4')
%disp(accuracy_gaussian4')
%iteration5
model_gaussian5 = svmtrain(train_labels',L5','-s 1 -t 2');
[predict_label_gaussian5,accuracy_gaussian5,dec_value_gaussian5] = svmpredict(test_labels',M5',model_gaussian5);
%disp(predict_label_gaussian5')
%disp(accuracy_gaussian5')
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