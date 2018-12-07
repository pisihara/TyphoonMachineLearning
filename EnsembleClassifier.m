function [trainedClassifier, validationAccuracy] = EnsembleClassifier(trainingData)
inputTable = trainingData;
predictorNames = {'YEAR', 'MONTH', 'DAY', 'LAT1', 'LON1', 'PRES1', 'WS1', 'LAT2', 'LON2', 'PRES2', 'WS2', 'LAT3', 'LON3', 'PRES3', 'WS3', 'LAT4', 'LON4', 'PRES4', 'WS4'};
predictors = inputTable(:, predictorNames);
response = inputTable.CATEGORY;
isCategoricalPredictor = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];

%% Train a classifier
subspaceDimension = max(1, min(10, width(predictors) - 1));
classificationEnsemble = fitcensemble(...
    predictors, ...
    response, ...
    'Method', 'Subspace', ...
    'NumLearningCycles', 30, ...
    'Learners', 'discriminant', ...
    'NPredToSample', subspaceDimension, ...
    'ClassNames', [3; 4; 5]);

%% Create the result struct with predict function
predictorExtractionFcn = @(t) t(:, predictorNames);
ensemblePredictFcn = @(x) predict(classificationEnsemble, x);
trainedClassifier.predictFcn = @(x) ensemblePredictFcn(predictorExtractionFcn(x));

%% Add additional fields to the result struct
trainedClassifier.RequiredVariables = {'YEAR', 'MONTH', 'DAY', 'LAT1', 'LON1', 'PRES1', 'WS1', 'LAT2', 'LON2', 'PRES2', 'WS2', 'LAT3', 'LON3', 'PRES3', 'WS3', 'LAT4', 'LON4', 'PRES4', 'WS4'};
trainedClassifier.ClassificationEnsemble = classificationEnsemble;
trainedClassifier.About = 'This struct is a trained model exported from Classification Learner R2018a.';
trainedClassifier.HowToPredict = sprintf('To make predictions on a new table, T, use: \n  yfit = c.predictFcn(T) \nreplacing ''c'' with the name of the variable that is this struct, e.g. ''trainedModel''. \n \nThe table, T, must contain the variables returned by: \n  c.RequiredVariables \nVariable formats (e.g. matrix/vector, datatype) must match the original training data. \nAdditional variables are ignored. \n \nFor more information, see <a href="matlab:helpview(fullfile(docroot, ''stats'', ''stats.map''), ''appclassification_exportmodeltoworkspace'')">How to predict using an exported model</a>.');

% %% Extract predictors and response
% inputTable = trainingData;
% predictorNames = {'YEAR', 'MONTH', 'DAY', 'LAT1', 'LON1', 'PRES1', 'WS1', 'LAT2', 'LON2', 'PRES2', 'WS2', 'LAT3', 'LON3', 'PRES3', 'WS3', 'LAT4', 'LON4', 'PRES4', 'WS4'};
% predictors = inputTable(:, predictorNames);
% response = inputTable.CATEGORY;
% isCategoricalPredictor = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];

%% Perform cross-validation
partitionedModel = crossval(trainedClassifier.ClassificationEnsemble, 'KFold', 5);

%% Compute validation predictions
[validationPredictions, validationScores] = kfoldPredict(partitionedModel);

%% Compute validation accuracy
validationAccuracy = 1 - kfoldLoss(partitionedModel, 'LossFun', 'ClassifError');
