ParentRec := RECORD
    INTEGER1  NameID;
    STRING20  Name;
END;

ChildRec := RECORD
		INTEGER1  NameID;
		STRING20  Addr;
END;

NamesTable := DATASET([ {1,'Gavin'},
                        {2,'Liz'},
												{3,'Richard'},
												{4,'Bob'}], 
											ParentRec); 
											
OUTPUT(NamesTable);
											
NormAddrs := DATASET([{1,'10 Malt Lane'},	
			                {2,'10 Yamato Rd'},	
			                {2,'3 The cottages'},	
			                {4,'9 Merchiston'},	
			                {4,'53 Collington Rd'},	
			                {4,'24 Dayton Av'},	
			                {4,'8 Brent Alley'}],
										 ChildRec);	
OUTPUT(NormAddrs);

DenormedRec := RECORD
    ParentRec;                               
		DATASET(ChildRec) Children; 
END;

DenormedRec ParentLoad(ParentRec Le) := TRANSFORM
    SELF.Children := [];
    SELF          := Le;
END;

Ptbl := PROJECT(NamesTable,ParentLoad(LEFT));

OUTPUT(Ptbl,NAMED('ParentDataReady'));


Ptbl DeNormThem(Ptbl Le, NormAddrs Ri) := TRANSFORM
    SELF.Children := Le.Children + Ri;
    // SELF.Children := Ri;
    SELF          := Le;
END;

DeNormedRecs := DENORMALIZE(Ptbl, NormAddrs,
				                    LEFT.NameID = RIGHT.NameID,
				                    DeNormThem(LEFT,RIGHT));

OUTPUT(DeNormedRecs,NAMED('NestedChildDataset'));