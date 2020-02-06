------------- Start of vwUsers ----------------------------------------------------
If Exists (select * from syscomments where id = object_id('vwUsers'))
Begin
	Drop View vwUsers
	If Object_Id('vwUsers') Is Not Null
		Print '<<< FAILED DROPPING VIEW vwUsers >>>'
	Else
		Print '<<< DROPPED VIEW vwUsers >>>'
End
Go
create view vwUsers
as
	/*---------------------------------------------------------------
	* View        : vwUsers
	* Created By   : T4 Generation
	* Created On   : 06 February 2020 10:26:41 AM
	* Updated By   : 
	* Updated On   : 
	* CLR Version  : 4.6.1
	* Template Ver : Hulamin 4.6
	* --------------------------------------------------------------
	*/
	select
		a.UserID as UserID
		,a.UserName as UserName
		,a.UserSurname as UserSurname
		,a.UserEmail as UserEmail
		,a.Password as Password
	from		
		Users a
Go
If Exists (select * from syscomments where id = object_id('vwUsers'))
Begin
	If Object_Id('vwUsers') Is Not Null
		Print '<<< CREATED VIEW vwUsers >>>'
	Else
		Print '<<< FAILED CREATING VIEW vwUsers >>>'
End
Go
	