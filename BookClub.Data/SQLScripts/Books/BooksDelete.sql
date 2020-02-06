------------- Start of BooksDelete ----------------------------------------------------
If Exists (select * from syscomments where id = object_id('BooksDelete'))
	Begin
		Drop Procedure BooksDelete
		If Object_Id('BooksDelete') Is Not Null
			Print '<<< FAILED DROPPING PROCEDURE BooksDelete >>>'
		Else
			Print '<<< DROPPED PROCEDURE BooksDelete >>>'
	End
Go
Create Procedure BooksDelete
(
	@inBookNumber int
)
As
Begin	
	/*---------------------------------------------------------------
	 * Stored Proc  : BooksDelete
	 * Purpose		: Deletes a single row out of the ModelEntity1 table
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

		
	delete ModelEntity1
	where
		BookNumber = @inBookNumber
		
		
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
	
if exists (select * from syscomments where id = object_id('BooksDelete'))
begin
	if object_id('BooksDelete') is not null
		print '<<< created procedure BooksDelete >>>'
	else
		print '<<< failed creating procedure BooksDelete >>>'
end
go