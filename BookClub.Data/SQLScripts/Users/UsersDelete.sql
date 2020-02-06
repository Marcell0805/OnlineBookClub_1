------------- Start of UsersDelete ----------------------------------------------------
If Exists (select * from syscomments where id = object_id('UsersDelete'))
	Begin
		Drop Procedure UsersDelete
		If Object_Id('UsersDelete') Is Not Null
			Print '<<< FAILED DROPPING PROCEDURE UsersDelete >>>'
		Else
			Print '<<< DROPPED PROCEDURE UsersDelete >>>'
	End
Go
Create Procedure UsersDelete
(
	@inUserID int
)
As
Begin	
	/*---------------------------------------------------------------
	 * Stored Proc  : UsersDelete
	 * Purpose		: Deletes a single row out of the Users table
	 * Created By   : T4 Generation
	 * Created On   : 06 February 2020 10:26:42 AM
	 * Updated By   : 
	 * Updated On   : 
	 * CLR Version  : 4.6.1
	 * Template Ver : Hulamin 4.6
	 * --------------------------------------------------------------
	 */
	SET NOCOUNT ON
	BEGIN TRY

		
	delete Users
	where
		UserID = @inUserID
		
		
	end try

	begin catch
	-- MSSQL: 547(FOREIGN KEY REFERENCE EXCEPTION)
	if (Error_Number() in (547))
		RAISERROR(60012,16,1) ---6012: ParentDeleteViolation
		exec hul_rethrowerror
	end catch

	set nocount off	
	return
end
go
	
if exists (select * from syscomments where id = object_id('UsersDelete'))
begin
	if object_id('UsersDelete') is not null
		print '<<< created procedure UsersDelete >>>'
	else
		print '<<< failed creating procedure UsersDelete >>>'
end
go