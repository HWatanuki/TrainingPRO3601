IMPORT $;

OUTPUT($.File_crime_raw.File,NAMED('Raw_data'));
// COUNT($.File_crime_raw.File);
OUTPUT($.File_crime_optimized.File,NAMED('Optimized_data'));
// COUNT($.File_crime_optimized.File);
OUTPUT($.Formatted_File,NAMED('Formatted_data'));
// COUNT($.Formatted_File);

OUTPUT($.NormAddrRecs.File,NAMED('Address_data'));
// COUNT($.NormAddrRecs);

OUTPUT($.NormCrimeRecs.File,NAMED('Crime_data'));
// COUNT($.NormCrimeRecs);