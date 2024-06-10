IMPORT LearningTrees AS LT;
IMPORT ML_Core;
IMPORT $;
IndTrainData := $.Convert02.myIndTrainDataNF;
DepTrainData := $.Convert02.myDepTrainDataNF;
IndTestData  := $.Convert02.myIndTestDataNF;
DepTestData  := $.Convert02.myDepTestDataNF;
// RegressionForest(UNSIGNED numTrees=100, 
                 // UNSIGNED featuresPerNode=0, 
                 // UNSIGNED maxDepth=100, SET OF UNSIGNED nominalFields=[])
// We use the default configuration parameters.  That usually works fine.
myLearnerR    := LT.RegressionForest(); 
// myLearnerR := LT.RegressionForest(200,,200); 
myModelR      := myLearnerR.GetModel(IndTrainData, DepTrainData);
predictedDeps := myLearnerR.Predict(myModelR, IndTestData);
OUTPUT(predictedDeps);//workitem,uniqueid,field number, dependent value
assessmentR   := ML_Core.Analysis.Regression.Accuracy(predictedDeps,DepTestData);
OUTPUT(assessmentR);

// To test new data:
// predictedValues := myLearnerR.Predict(myModelR, myNewIndData);
// improve the testing:
myLearnerR2    := LT.RegressionForest(200,,200,[1]); // Make the zipcode field a nominal (categorical) field.
myModelR2      := myLearnerR2.GetModel(IndTrainData,DepTrainData);
predictedDeps2 := myLearnerR2.Predict(myModelR2,IndTestData);
OUTPUT(predictedDeps2);//workitem,uniqueid,field number, dependent value
assessmentR2   := ML_Core.Analysis.Regression.Accuracy(predictedDeps2,DepTestData);
OUTPUT(assessmentR2);
