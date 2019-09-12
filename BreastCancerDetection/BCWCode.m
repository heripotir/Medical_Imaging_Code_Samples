%The Following Code is inspired from here: 
%https://github.com/AbidIqbal/BreastCancerClassification-usingArtificialNeuralNetworks/blob/master/code.m

%Loading data which is available here:
%https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/
%missing information with ? values are deleted manually

 % #   Attribute                     Domain
 %  -- -----------------------------------------
 %  1. Sample code number            id number
 %  2. Clump Thickness               1 - 10
 %  3. Uniformity of Cell Size       1 - 10
 %  4. Uniformity of Cell Shape      1 - 10
 %  5. Marginal Adhesion             1 - 10
 %  6. Single Epithelial Cell Size   1 - 10
 %  7. Bare Nuclei                   1 - 10
 %  8. Bland Chromatin               1 - 10
 %  9. Normal Nucleoli               1 - 10
 % 10. Mitoses                       1 - 10
 % 11. Class:                        (2 for benign, 4 for malignant) 
         
rawData=importdata('C:\Users\Asus\Desktop\breast-cancer-wisconsin (1).data'); %file path of data 

data=rawData(:,2:10);
class=rawData(:,11);

% x% Training (100-x)% Testing
x=80;
s=size(data,1);
a=floor(s*x/100);
trainInputData=data(1:a,:);
trainClassData=class(1:a,:);
testData=data(a+1:s,:);
testClass=class(a+1:s,:);


%Network information
%Some features are left as default

net=feedforwardnet(50,'trainr'); 

%About feedworwardnet:
%feedforwardnet(hiddenSizes,trainFcn)
%hiddenSizes: number of hidden layers in neural network that is going to be
%built
%trainFcn: Training function (default = 'trainlm')


%Giving input and output to the net
net = configure(net, trainInputData', trainClassData'); 

net.trainParam.epochs = 100;
net.trainParam.max_fail=50;
net.trainParam.lr = 0.001;

net = train(net, trainInputData',trainClassData');      %Training of the network

result=net(testData');                                  %Testing of the network

%Accuracy percentage calculation
error=0;
maxer=0.35 %adjust manually

for i=1:size(result,2)
  if(abs(result(i)-testClass(i))>maxer)
        error=error+1;
    end;
end;
percentageError=((error(1))/size(testClass,1))*100;
percentageAccuracy=100-percentageError;