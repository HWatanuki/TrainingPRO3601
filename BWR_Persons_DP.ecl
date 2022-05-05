IMPORT $,STD;

Persons := $.File_Persons.File;
Accounts := $.File_Accounts.File;

// profileResults := STD.DataPatterns.Profile(Persons);
profileResults := STD.DataPatterns.Profile(Persons, 'zipcode');
bestrecord     := STD.DataPatterns.BestRecordStructure(Persons);
benford_bad		 := STD.DataPatterns.Benford(Persons, 'zipcode');
benford_good   := STD.DataPatterns.Benford(Accounts, 'balance');

OUTPUT(profileResults, ALL, NAMED('profileResults'));
// OUTPUT(bestrecord, ALL, NAMED('BestRecord'));
// OUTPUT(benford_bad, ALL, NAMED('Benford_bad'));
// OUTPUT(benford_good, ALL, NAMED('Benford_good'));















// IMPORT DataPatterns;
// profileResults 	:= DataPatterns.Profile(Persons);
// bestrecord := DataPatterns.BestRecordStructure(Persons);
// normResults := DataPatterns.NormalizeProfileResults(profileResults);
// OUTPUT(profileResults, ALL, NAMED('profileResults'));
// OUTPUT(normResults, ALL, NAMED('NormResults'));








// Persons := $.File_Persons.File;
// REcordWrite := OUTPUT(Persons,,'~class::hmw::intro2::persons', overwrite);
// profileResults := STD.DataPatterns.Profile(Persons);
// bestrecord := STD.DataPatterns.BestRecordStructure(Persons);
// Profileout := OUTPUT(profileResults, ALL, NAMED('profileResults'));
// BestOut := OUTPUT(bestrecord, ALL, NAMED('BestRecord'));
// OUTPUT(profileResults, ALL, NAMED('profileResults'));
// OUTPUT(bestrecord, ALL, NAMED('BestRecord'));
// SEQUENTIAL(RecordWrite,PARALLEL(ProfileOut));
// SEQUENTIAL(RecordWrite,PARALLEL(ProfileOut,BestOut));

