------------- Start of BooksFetch ----------------------------------------------------
If Exists (select * from syscomments where id = object_id('BooksFetch'))
	Begin
		Drop Procedure BooksFetch
		If Object_Id('BooksFetch') Is Not Null
			Print '<<< FAILED DROPPING PROCEDURE BooksFetch >>>'
		Else
			Print '<<< DROPPED PROCEDURE BooksFetch >>>'
	End
Go
Create Procedure BooksFetch
(
	@inBookNumber int
)
As
Begin	
	/*---------------------------------------------------------------
	 * Stored Proc  : BooksFetch
	 * Purpose		: Fetches a single row out of the ModelEntity1 table and children
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
	 vwBooks
	where
		BookNumber = @inBookNumber
		


				
end
go
	
if exists (select * from syscomments where id = object_id('BooksFetch'))
begin
	if object_id('BooksFetch') is not null
		print '<<< created procedure BooksFetch >>>'
	else
		print '<<< failed creating procedure BooksFetch >>>'
end
go