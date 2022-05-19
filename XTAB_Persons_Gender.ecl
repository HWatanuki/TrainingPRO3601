IMPORT $;

r := RECORD
	$.File_Persons.File.Gender;
	INTEGER cnt := COUNT(GROUP);
	END;

EXPORT XTAB_Persons_Gender := TABLE($.File_Persons.File,r,Gender); //M=384,182 F=404,988 N=20,508 U=31,722

