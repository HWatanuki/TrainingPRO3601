import $

ds := $.crimes_records_otimizado;

crimes2010ate2020 := ds(year>2010 and year<=2020);
count crimes2010ate2020;

mediaPorAno := count(crimes2010ate2020)/10;

