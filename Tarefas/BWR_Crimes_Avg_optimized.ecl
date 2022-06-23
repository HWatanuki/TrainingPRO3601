IMPORT $;

Crimes := $.File_crime_optimized.File;

OutRec := RECORD
 Crimes.year;
 TotalPerYear := COUNT(GROUP);
 // Avg := ROUND(AVE(TotalPerYear)); // give syntax error as it tries to impose sequential operations within the same graph
 // Avg := ROUND(AVE(COUNT(GROUP))); //give the average of each group, i.e., the same value from COUNT(GROUP)
 // Avg := ROUND(COUNT(Crimes(year BETWEEN 2010 AND 2020))/11); // hardcoded approach
END;

// MyTable := TABLE(Crimes(year BETWEEN 2010 AND 2020),OutRec,Year);
MyTable := SORT(TABLE(Crimes(year BETWEEN 2010 AND 2020),OutRec,Year),year);

OUTPUT(MyTAble);

MyAvg := AVE(MyTable,TotalPerYear);

OUTPUT(ROUND(MyAvg));