IMPORT $;

Crimes:= $.File_crime_optimized.File;

IsCrime2010 := Crimes.year=2010;
Crimes2010 := COUNT(Crimes(IsCrime2010));
OUTPUT(Crimes2010);

IsCrime2011 := Crimes.year=2011;
Crimes2011 := COUNT(Crimes(IsCrime2011));
OUTPUT(Crimes2011);

IsCrime2012 := Crimes.year=2012;
Crimes2012 := COUNT(Crimes(IsCrime2012));
OUTPUT(Crimes2012);

IsCrime2013 := Crimes.year=2013;
Crimes2013 := COUNT(Crimes(IsCrime2013));
OUTPUT(Crimes2013);

IsCrime2014 := Crimes.year=2014;
Crimes2014 := COUNT(Crimes(IsCrime2014));
OUTPUT(Crimes2014);

IsCrime2015 := Crimes.year=2015;
Crimes2015 := COUNT(Crimes(IsCrime2015));
OUTPUT(Crimes2015);

IsCrime2016 := Crimes.year=2016;
Crimes2016 := COUNT(Crimes(IsCrime2016));
OUTPUT(Crimes2016);

IsCrime2017 := Crimes.year=2017;
Crimes2017 := COUNT(Crimes(IsCrime2017));
OUTPUT(Crimes2017);

IsCrime2018 := Crimes.year=2018;
Crimes2018 := COUNT(Crimes(IsCrime2018));
OUTPUT(Crimes2018);

IsCrime2019 := Crimes.year=2019;
Crimes2019 := COUNT(Crimes(IsCrime2019));
OUTPUT(Crimes2019);

IsCrime2020 := Crimes.year=2020;
Crimes2020 := COUNT(Crimes(IsCrime2020));
OUTPUT(Crimes2020);

MyAvg:=AVE(Crimes2010, Crimes2011,Crimes2012,Crimes2013,Crimes2014,Crimes2015,
           Crimes2016,Crimes2017,Crimes2018,Crimes2019,Crimes2020);
					 
OUTPUT(MyAvg);