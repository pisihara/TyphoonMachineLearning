%% Run this script to execute the trainedClassifier on a new data set.

%% Read in Validation Data
X1=xlsread('TestData15.xlsx','Sheet1','A2:T26');
YEAR=X1(:,1);MONTH=X1(:,2);DAY=X1(:,3);
LAT1=X1(:,4);LON1=X1(:,5);PRES1=X1(:,6),WS1=X1(:,7);
LAT2=X1(:,8);LON2=X1(:,9);PRES2=X1(:,10);WS2=X1(:,11);
LAT3=X1(:,12);LON3=X1(:,13);PRES3=X1(:,14);WS3=X1(:,15);
LAT4=X1(:,16);LON4=X1(:,17);PRES4=X1(:,18);WS4=X1(:,19);
CATEGORY=X1(:,20);
Tv=table(YEAR,MONTH,DAY,LAT1,LON1,PRES1,WS1,LAT2,LON2,PRES2,WS2,LAT3,LON3,PRES3,WS3,LAT4,LON4,PRES4,WS4,CATEGORY);

% %% Apply Model to Validation Data
%predictorNames = {'YEAR', 'MONTH', 'DAY', 'LAT1', 'LON1', 'PRES1', 'WS1', 'LAT2', 'LON2', 'PRES2', 'WS2', 'LAT3', 'LON3', 'PRES3', 'WS3', 'LAT4', 'LON4', 'PRES4', 'WS4'};
[ValidationOutput2015,E2015]=trainedClassifier.predictFcn(Tv);

xlswrite('CategoryData15.xlsx', ValidationOutput2015, 'U2:U26');  
 