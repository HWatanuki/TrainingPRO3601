IMPORT $,Std;

EXPORT STD_Crimes := MODULE

  EXPORT Layout := RECORD
    $.UID_Crimes.RecID;
    $.UID_Crimes.id;
    $.UID_Crimes.case_number;
    UNSIGNED8 date := STD.Date.FromStringToDate($.UID_Crimes.date);
    $.UID_Crimes.block;
    $.UID_Crimes.iucr;
    $.UID_Crimes.primary_tipe;
    $.UID_Crimes.description;
    $.UID_Crimes.location_description;
    $.UID_Crimes.arrest;
    $.UID_Crimes.domestic;
    $.UID_Crimes.beat;
    $.UID_Crimes.district;
    $.UID_Crimes.ward;
    $.UID_Crimes.community_area;
    $.UID_Crimes.fbi_code;
    $.UID_Crimes.x_coordinate;
    $.UID_Crimes.y_coordinate;
    $.UID_Crimes.year;
    $.UID_Crimes.updated_on;
    $.UID_Crimes.latitude;
    $.UID_Crimes.longitude;
    $.UID_Crimes.location;
    END;

	EXPORT File := TABLE($.UID_Crimes,Layout):PERSIST('~CLASS::VRS::PERSIST::STD_Crimes');

END;
