%% Run this script to execute the trained model on a new data set.

%% Read in Validation Data
[num,txt,X]=xlsread('CategoryData15.xlsx','Sheet1','A1:Z26');
T=table(X(:,1),X(:,2),X(:,3),X(:,4),X(:,5),X(:,6),X(:,7),X(:,8),X(:,9),X(:,10),X(:,11),X(:,12),X(:,13),X(:,14),X(:,15),X(:,16),X(:,17),X(:,18),X(:,19),X(:,20))
% %% Apply Model to Validation Data
[ValidationOutput2015,RMSE2015]=EnsembleClassificationModel.predictFcn(T);

xlswrite('CategoryData15.xlsx', ValidationOutput2015, 'U2:U26');   