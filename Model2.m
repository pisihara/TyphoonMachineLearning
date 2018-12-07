%%Run this file to train the tree regression model.

clear all; close all;
%% Read in Training Data
X=xlsread('TrainingData.xlsx','Sheet1','A2:Z122');
YEAR=X(:,2);MONTH=X(:,3);DAY=X(:,4);
LAT1=X(:,5);LON1=X(:,6);PRES1=X(:,7);WS1=X(:,8);
LAT2=X(:,9);LON2=X(:,10);PRES2=X(:,11);WS2=X(:,12);
LAT3=X(:,13);LON3=X(:,14);PRES3=X(:,15);WS3=X(:,16);
LAT4=X(:,17);LON4=X(:,18);PRES4=X(:,19);WS4=X(:,20);
WS=X(:,25);
T=table(YEAR,   MONTH,  DAY,   LAT1,  LON1, PRES1,  WS1,  LAT2,   LON2,   PRES2,   WS2,   LAT3,   LON3,   PRES3,   WS3,   LAT4,  LON4,    PRES4,    WS4,WS);
%T = table(X(:,2),X(:,3),X(:,4),X(:,5),X(:,6),X(:,7),X(:,8),X(:,9),X(:,10),X(:,11),X(:,12),X(:,13),X(:,14),X(:,15),X(:,16),X(:,17),X(:,18),X(:,19),X(:,20),WS);
%% Run Exported Function to Create Trained Model
[Mod2, TrainingError2]=trainRegressionModel2(T);

