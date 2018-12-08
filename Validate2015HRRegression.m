%% Validate Model
%% Using 2015 Data
X=xlsread('RegressionData15.xlsx','Sheet1','A2:T26');
YEAR=X(:,1);MONTH=X(:,2);DAY=X(:,3);
LAT1=X(:,4);LON1=X(:,5);PRES1=X(:,6),WS1=X(:,7);
LAT2=X(:,8);LON2=X(:,9);PRES2=X(:,10);WS2=X(:,11);
LAT3=X(:,12);LON3=X(:,13);PRES3=X(:,14);WS3=X(:,15);
LAT4=X(:,16);LON4=X(:,17);PRES4=X(:,18);WS4=X(:,19);
WS=X(:,20);
T=table(YEAR,MONTH,DAY,LAT1,LON1,PRES1,WS1,LAT2,LON2,PRES2,WS2,LAT3,LON3,PRES3,WS3,LAT4,LON4,PRES4,WS4,WS)
%% Run the trained model on 2015 data
TyphoonHR2015Regression=SVMTrainedregressionHR.predictFcn(T);