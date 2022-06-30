IMPORT $;

// OUTPUT($.File_crime_raw.File,NAMED('Raw_data'));
// COUNT($.File_crime_raw.File);
// OUTPUT($.File_crime_optimized.File,NAMED('Optimized_data'));
// COUNT($.File_crime_optimized.File);
// OUTPUT($.Formatted_File,NAMED('Formatted_data'));
// COUNT($.Formatted_File);

// OUTPUT($.NormAddrRecs.File,NAMED('Address_data'));
// COUNT($.NormAddrRecs);

// OUTPUT($.NormCrimeRecs.File,NAMED('Crime_data'));
// COUNT($.NormCrimeRecs);

$.CrimeBlockSvc('E 100 PL'); //residential area
$.CrimeBlockSvc('N STATE ST'); //commercial area with retail theft
$.CrimeBlockSvc('E Jackson BLVD'); //residential area with building theft
