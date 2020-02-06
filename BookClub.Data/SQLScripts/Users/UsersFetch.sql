------------- Start of UsersFetch ----------------------------------------------------
If Exists (select * from syscomments where id = object_id('UsersFetch'))
	Begin
		Drop Procedure UsersFetch
		If Object_Id('UsersFetch') Is Not Null
			Print '<<< FAILED DROPPING PROCEDURE UsersFetch >>>'
		Else
			Print '<<< DROPPED PROCEDURE UsersFetch >>>'
	End
Go
Create Procedure UsersFetch
(
	@inUserID int
)
As
Begin	
	/*---------------------------------------------------------------
	 * Stored Proc  : UsersFetch
	 * Purpose		: Fetches a single row out of the Users table and children
	 * Created By   : T4 Generation
	 * Created On   : 06 February 2020 10:26:41 AM
	 * Updated By   : 
	 * Updated On   : 
	 * CLR Version  : 4.6.1
	 * Template Ver : Hulamin 4.6
	 * --------------------------------------------------------------
	 */
		
	select
		*
	from
	 vwUsers
	where
		UserID = @inUserID
		


				
end
go
	
if exists (select * from syscomments where id = object_id('UsersFetch'))
begin
	if object_id('UsersFetch') is not null
		print '<<< created procedure UsersFetch >>>'
	else
		print '<<< failed creating procedure UsersFetch >>>'
end
go