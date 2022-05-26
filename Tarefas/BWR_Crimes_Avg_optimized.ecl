IMPORT $;

Crimes := $.File_crime_optimized.File;

OutRec := RECORD
 Crimes.year;
 TotalPerYear := COUNT(GROUP);
END;

MyTable := SORT(TABLE(Crimes(year BETWEEN 2010 AND 2020),OutRec,Year),year);

OUTPUT(MyTAble);

MyAvg := AVE(MyTable,TotalPerYear);

OUTPUT(ROUND(MyAvg));