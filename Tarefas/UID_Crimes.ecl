IMPORT $;

Layout_Crimes_RecID := RECORD
	UNSIGNED4 RecID;
	$.chicago_crimes.Layout;
END;

Layout_Crimes_RecID IDRecs($.chicago_crimes.Layout L,INTEGER C) := TRANSFORM
	SELF.RecID := C;
	SELF := L;
END;

EXPORT UID_Crimes := PROJECT($.chicago_crimes.File,IDRecs(LEFT,COUNTER))
															:PERSIST('~CLASS::VRS::PERSIST::UID_Crimes');