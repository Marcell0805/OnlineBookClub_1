 ------------- Start of UsersFetchCol ----------------------------------------------------
If Exists (select * from syscomments where id = object_id('UsersFetchCol'))
	Begin
		Drop Procedure UsersFetchCol
		If Object_Id('UsersFetchCol') Is Not Null
			Print '<<< FAILED DROPPING PROCEDURE UsersFetchCol >>>'
		Else
			Print '<<< DROPPED PROCEDURE UsersFetchCol >>>'
	End
Go
Create Procedure UsersFetchCol
(
	@inFetchChildren bit = 0
	,@inUserID int
)
As
Begin	
	/*---------------------------------------------------------------
	 * Stored Proc  : UsersFetchCol
	 * Purpose		: Fetches a multiple rows out of the Users table and children
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
	 vwUsers a	-- TODO:
	-- Customize the where clause



end
go
	
if exists (select * from syscomments where id = object_id('UsersFetchCol'))
begin
	if object_id('UsersFetchCol') is not null
		print '<<< created procedure UsersFetchCol >>>'
	else
		print '<<< failed creating procedure UsersFetchCol >>>'
end
go

