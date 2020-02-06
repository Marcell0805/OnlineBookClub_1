 ------------- Start of BooksFetchCol ----------------------------------------------------
If Exists (select * from syscomments where id = object_id('BooksFetchCol'))
	Begin
		Drop Procedure BooksFetchCol
		If Object_Id('BooksFetchCol') Is Not Null
			Print '<<< FAILED DROPPING PROCEDURE BooksFetchCol >>>'
		Else
			Print '<<< DROPPED PROCEDURE BooksFetchCol >>>'
	End
Go
Create Procedure BooksFetchCol
(
	@inFetchChildren bit = 0
	,@inBookNumber int
)
As
Begin	
	/*---------------------------------------------------------------
	 * Stored Proc  : BooksFetchCol
	 * Purpose		: Fetches a multiple rows out of the ModelEntity1 table and children
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
	 vwBooks a	-- TODO:
	-- Customize the where clause



end
go
	
if exists (select * from syscomments where id = object_id('BooksFetchCol'))
begin
	if object_id('BooksFetchCol') is not null
		print '<<< created procedure BooksFetchCol >>>'
	else
		print '<<< failed creating procedure BooksFetchCol >>>'
end
go

