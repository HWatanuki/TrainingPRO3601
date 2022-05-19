IMPORT $;

layout := RECORD
 $.File_Persons.File.State;
 cnt := COUNT(GROUP);
END;

StateCount := TABLE($.File_PErsons.File,layout,state);

OUTPUT(StateCount, NAMED('StateCount'));



