IMPORT $;
Property := $.File_Property.File;

MyRec := RECORD
 Property.state;
 TypeCnt := COUNT(GROUP);
END;

MyTable := TABLE(Property,MyRec,State);

OUTPUT(SORT(MyTable,State),ALL,NAMED('State_Choro'));


