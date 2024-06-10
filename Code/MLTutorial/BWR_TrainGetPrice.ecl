IMPORT $;
IMPORT ML_Core;
IMPORT LearningTrees AS LT;

// Select the learner
myLearnerR    := LT.RegressionForest(10,,10,[1]); 

// Get the training model
myModelR      := myLearnerR.GetModel($.Convert02.myIndTrainDataNF,$.Convert02.myDepTrainDataNF);
OUTPUT(myModelR,,'~class::bmf::whshp::mymodelR',overwrite);

// Apply the model on test data
predictedDeps := myLearnerR.Predict(myModelR, $.Convert02.myIndTestDataNF);
OUTPUT(predictedDeps);

// Assess the model
assessmentR   := ML_Core.Analysis.Regression.Accuracy(predictedDeps,$.Convert02.myDepTestDataNF);
OUTPUT(assessmentR);