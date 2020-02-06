------------- Start of vwBooks ----------------------------------------------------
If Exists (select * from syscomments where id = object_id('vwBooks'))
Begin
	Drop View vwBooks
	If Object_Id('vwBooks') Is Not Null
		Print '<<< FAILED DROPPING VIEW vwBooks >>>'
	Else
		Print '<<< DROPPED VIEW vwBooks >>>'
End
Go
create view vwBooks
as
	/*---------------------------------------------------------------
	* View        : vwBooks
	* Created By   : T4 Generation
	* Created On   : 06 February 2020 10:26:41 AM
	* Updated By   : 
	* Updated On   : 
	* CLR Version  : 4.6.1
	* Template Ver : Hulamin 4.6
	* --------------------------------------------------------------
	*/
	select
		a.BookNumber as BookNumber
		,a.BookName as BookName
		,a.Author as Author
		,a.BookRating as BookRating
	from		
		ModelEntity1 a
Go
If Exists (select * from syscomments where id = object_id('vwBooks'))
Begin
	If Object_Id('vwBooks') Is Not Null
		Print '<<< CREATED VIEW vwBooks >>>'
	Else
		Print '<<< FAILED CREATING VIEW vwBooks >>>'
End
Go
	