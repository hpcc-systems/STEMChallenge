/*##############################################################################
## HPCC SYSTEMS software Copyright (C) 2022 HPCC Systems.  All rights reserved.
############################################################################## */
import python3 as python;
IMPORT ML_Core.Types as MTypes;
IMPORT Std.System.Thorlib;
IMPORT $.Types as Types;
// IMPORT $.internal.rffGPR as rffGPR;
IMPORT GaussianProcessRegression.internal.rffGPR as rffGPR;

// Common record structures
layout_model2 := MTypes.layout_model2;
nNodes := Thorlib.nodes();
nodeId := Thorlib.node();
initParams := Types.initParams;
NumericField := MTypes.NumericField;

/* Random Fourier Features accelerated Gaussian Process Regressor
 *
 * Random Fourier Features(RFF) map the input data to a randomized low-dimensional feature space.
 * Then one can apply fast existing linear methods to such new space and thus accelerate the
 * training of large scale kernel machines[1]. This bundle is the accelerated version of Gaussian
 * Process Regression(GPR) using such random fourier features.
 *
 * Three functions are available for the users: getSession, fit and predict.
 *   * GetSession function generates a 'session ID' for the training and predict process.
 *   * Fit function fits the input data and train a GPR model.
 *   * Predict function uses the trained GPR model to make predictions for the new observations.
 * For details of each function, see the comments below above each function.
 *
 * To use GPR bundle, 'session ID' is required to feed to each fit or predict function call.
 * However, if the training and predict process are in the same session/workunit, getSession
 * only needs to be called once, i.e. fit and predict share same 'session ID' in this case.
 *
 * NOTE: The current version does not support Myriad interface.
 * [1] Ali Rahimi and Benjamin Recht. 2007. Random features for large-scale kernel machines.
 * In Proceedings of the 20th International Conference on Neural Information Processing Systems
 * (NIPS'07). Curran Associates Inc., Red Hook, NY, USA, 1177–1184.
 */
EXPORT GPRI := MODULE

  /**
    * Initialize GPR on all nodes and return a session ID to be used in the following process.
    * This function needs to be called before any other process.
    * @return sessID session ID to identify this session.
  */
  EXPORT INTEGER GetSession() := FUNCTION
      initDat := DATASET(1, TRANSFORM(initParams,
                                        SELF.nodeId := nodeId,
                                        SELF.nNodes := nNodes), LOCAL);
      sessID := rffGPR.init(initDat)[1].sessID;
      RETURN sessID;
  END;
  /**
    * Train a RFF acclerated GPR model
    * @params session session ID for the training process.
    * @params x independent training data.
    * @params y dependent training data.
    * @params rff_dim dimesion of random fourier features.
    * @params sigma squre root of the variance.
    * @return Gaussian process regression model in Layout_model2 foramt.
    * @see ML_Core.Types.Layout_Model2
  */
  EXPORT DATASET(Layout_model2) fit(INTEGER session,
                                    DATASET(NumericField) x, DATASET(NumericField) y,
                                      UNSIGNED4 rff_dim = 10, REAL sigma = 1) := FUNCTION
      dx := SORT(DISTRIBUTE(x, 0), id, number, LOCAL);
      dy := SORT(DISTRIBUTE(y, 0), id, number, LOCAL);
      rst := rffGPR.fit(session, dx, dy, rff_dim, sigma);
      RETURN rst;
  END;
  /**
    * Predict using trained GPR model
    * @params session session ID for the predicting process.
    * @params mod trained GPR model.
    * @params x input data for prediction.
    * @return prediction result in NumericField format
    * @see ML_Core.Types.NumericField
  */
  EXPORT DATASET(NumericField) predict(INTEGER session,
                                DATASET(Layout_model2) mod, DATASET(NumericField) x) := FUNCTION
      disMod := DISTRIBUTE(mod, ALL);
      disX := SORT(DISTRIBUTE(x, id), id, number, LOCAL);
      rst := rffGPR.predict(disMod, disX, session);
      RETURN SORT(rst, id, number);
  END;

END;
