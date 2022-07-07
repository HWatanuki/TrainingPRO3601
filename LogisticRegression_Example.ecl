IMPORT ML_Core;
IMPORT ML_Core.Types;
IMPORT LogisticRegression as LR;

//Record structure of raw data
Layout := RECORD
  UNSIGNED4 id;
  REAL value1;
  REAL value2;
  UNSIGNED4 label;
END;

//Raw data
raw := DATASET([
              {1, 5.712569, 5.218240849, 0},
              {2, 5.364189, 7.08132338 , 0},
              {3, 16.02369, 17.9170699 , 1},
              {4, 16.60159, 16.84973988, 1},
              {5, 4.965841, 4.316708112, 0},
              {6, 5.145869, 6.074661632, 0},
              {7, 6.105629, 5.286571686, 0},
              {8, 5.234874, 8.489164326, 0},
              {9, 6.845813, 5.297054029, 0},
              {10, 5.745698, 8.707510638, 0},
              {11, 17.35487, 18.63681562, 1},
              {12, 6.320169, 7.936895047, 0},
              {13, 17.01269, 16.24991628, 1},
              {14, 17.15489, 17.45414849, 1},
              {15, 5.821486, 6.998073432, 0},
              {16, 16.44163, 18.35488924, 1},
              {17, 16.86384, 20.02797699, 1},
              {18, 17.22694, 19.70321959, 1},
              {19, 17.04156, 18.50048655, 1},
              {20, 16.59126, 19.40741433, 1}
             ], Layout);
OUTPUT(raw,NAMED('RawData'));

// Treat first 15 records as train data
myTrainData := raw[1..15];  

// Treat next 5 records as test data
myTestData  := raw[16..20]; 
																	
//Transform to Machine Learning Dataframe, such as DiscreteField
ML_Core.ToField(myTrainData, myTrainDataNF);
ML_Core.ToField(myTestData, myTestDataNF);
OUTPUT(myTrainDataNF, NAMED('TrainData'));
OUTPUT(myTestDataNF, NAMED('TestData'));

// split into input (X) and output (Y) variables
XTrain := myTrainDataNF(number < 3);
YTrain := PROJECT(myTrainDataNF(number = 3), TRANSFORM(Types.DiscreteField, SELF.number := 1, SELF := LEFT));
OUTPUT(XTrain, NAMED('XTrain'));
OUTPUT(YTrain, NAMED('YTrain'));

XTest := myTestDataNF(number < 3);
YTest := PROJECT(myTestDataNF(number = 3), TRANSFORM(Types.DiscreteField, SELF.number := 1, SELF := LEFT));
OUTPUT(XTest, NAMED('XTest'));
OUTPUT(YTest, NAMED('YTest'));

//Training LogisticRegression Model
mod_bi := LR.BinomialLogisticRegression().getModel(XTrain, YTrain);
OUTPUT(mod_bi, NAMED('Model'));

//Make predictions
predict := LR.BinomialLogisticRegression().Classify(mod_bi, XTest);
OUTPUT(predict, NAMED('predict'));

//Get the confusion matrix
conf_matrix := LR.Confusion(Ytest,predict);
OUTPUT(conf_matrix , NAMED('Confusion'));
bin_matrix := LR.BinomialConfusion(conf_matrix);
OUTPUT(bin_matrix, NAMED('Accuracy'));

