%% Run this script to execute the trained model on a new data set.

%% Read in Validation Data
X1=xlsread('TestData15.xlsx','Sheet1','A2:T26');
YEAR=X(:,1);MONTH=X(:,2);DAY=X(:,3);
LAT1=X(:,4);LON1=X(:,5);PRES1=X(:,6),WS1=X(:,7);
LAT2=X(:,8);LON2=X(:,9);PRES2=X(:,10);WS2=X(:,11);
LAT3=X(:,12);LON3=X(:,13);PRES3=X(:,14);WS3=X(:,15);
LAT4=X(:,16);LON4=X(:,17);PRES4=X(:,18);WS4=X(:,19);
CATEGORY=X(:,20);
Tv=table(YEAR,MONTH,DAY,LAT1,LON1,PRES1,WS1,LAT2,LON2,PRES2,WS2,LAT3,LON3,PRES3,WS3,LAT4,LON4,PRES4,WS4,CATEGORY);

% 
% %% Apply Model to Validation Data
%predictorNames = {'YEAR', 'MONTH', 'DAY', 'LAT1', 'LON1', 'PRES1', 'WS1', 'LAT2', 'LON2', 'PRES2', 'WS2', 'LAT3', 'LON3', 'PRES3', 'WS3', 'LAT4', 'LON4', 'PRES4', 'WS4'};
[ValidationOutput2015,RMSE2015]=trainedClassifier.predictFcn(Tv);
xlswrite