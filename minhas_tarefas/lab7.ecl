IMPORT $;
IMPORT STD;

ds := $.crimes_records_otimizado;

rec2 := record
		UNSIGNED recid; 
		UNSIGNED4 id;
    STRING9 case_number;
    UNSIGNED date;
		UNSIGNED hora;
    STRING38 block;
    STRING4 iucr;
    STRING33 primary_type;
    STRING60 description;
    STRING53  location_description;
    STRING5 arrest;
    STRING5 domestic;
    STRING4 beat;
    STRING3 district;
    UNSIGNED1 ward;
    UNSIGNED1 community_area;
    STRING3 fbi_code;
    UNSIGNED4 x_coordinate;
    UNSIGNED4 y_coordinate;
    UNSIGNED2 year;
    STRING22 updated_on;
    REAL8 latitude;
    REAL8 longitude;
    STRING29 location;
end;

rec2 Mytransf(ds.Layout Le, unsigned cnt) := transform
	self.recid:=cnt;
	self.date := STD.Date.FromStringToDate(Le.date[0..10],'%d/%m/%Y');
	self.hora := IF(
			Le.date[21] = 'A',
				STD.Date.TimeFromParts((UNSIGNED)Le.date[12..13], (UNSIGNED)Le.date[15..16], (UNSIGNED)Le.date[18..19]),
			STD.Date.TimeFromParts((UNSIGNED)Le.date[12..13]+12, (UNSIGNED)Le.date[15..16], (UNSIGNED)Le.date[18..19]));
	self := Le;
	END;

newds := project(ds.File,Mytransf(left, counter));

newds;