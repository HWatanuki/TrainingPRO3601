IMPORT $;

OUTPUT($.File_crime_raw.File,NAMED('Raw_data'));
COUNT($.File_crime_raw.File);
OUTPUT($.File_crime_optimized.File,NAMED('Optimized_data'));
COUNT($.File_crime_optimized.File);