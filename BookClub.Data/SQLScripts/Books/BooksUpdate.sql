------------- Start of BooksUpdate ----------------------------------------------------
If Exists (select * from syscomments where id = object_id('BooksUpdate'))
	Begin
	Drop Procedure BooksUpdate
			If Object_Id('BooksUpdate') Is Not Null
				Print '<<< FAILED DROPPING PROCEDURE BooksUpdate >>>'
			Else
				Print '<<< DROPPED PROCEDURE BooksUpdate >>>'
	End
Go
Create Procedure BooksUpdate
(
	@inBookNumber int
	,@inBookName varchar(50)
	,@inAuthor varchar(50)
	,@inBookRating int
)
As
Begin	
	/*---------------------------------------------------------------
	 * Stored Proc  : BooksUpdate
	 * Purpose		: Updates a single row into the ModelEntity1 table
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
	
		-- Check to see that no-one else has deleted the record to be updated");
		If NOT Exists(select * from ModelEntity1 
		where 
			BookNumber = @inBookNumber
		)
		BEGIN
			RAISERROR(60009,16,1) ---60009: NotFoundException
		END
	
		Update ModelEntity1 
		Set
			BookName = @inBookName
			,Author = @inAuthor
			,BookRating = @inBookRating
		where
			BookNumber = @inBookNumber
		
	end try

	begin catch
	-- mssql: 2627(primary key violation) and 2601 (unique constraint violation)
	if (error_number() in (2627,2601))
		raiserror(60006,16,1) ---6006: uniqueviolation
		exec hul_rethrowerror
	end catch

	set nocount off	
	return
end
go
	
if exists (select * from syscomments where id = object_id('BooksUpdate'))
begin
	if object_id('BooksUpdate') is not null
		print '<<< created procedure BooksUpdate >>>'
	else
		print '<<< failed creating procedure BooksUpdate >>>'
end
go