------------- Start of BooksInsert ----------------------------------------------------
If Exists (select * from syscomments where id = object_id('BooksInsert'))
	Begin
	Drop Procedure BooksInsert
			If Object_Id('BooksInsert') Is Not Null
				Print '<<< FAILED DROPPING PROCEDURE BooksInsert >>>'
			Else
				Print '<<< DROPPED PROCEDURE BooksInsert >>>'
	End
Go

Create Procedure BooksInsert
(
	@inBookName varchar(50)
	,@inAuthor varchar(50)
	,@inBookRating int
	,@outId int output
)
As
Begin	
	/*---------------------------------------------------------------
	 * Stored Proc  : BooksInsert
	 * Purpose		: Insert a single row into the ModelEntity1 table
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
	
		insert Into ModelEntity1
		(
			BookNumber
			,BookName
			,Author
			,BookRating
		)
		values
		(
			@inBookNumber
			,@inBookName
			,@inAuthor
			,@inBookRating
		);

		select @outId = SCOPE_IDENTITY();

	END TRY
	BEGIN CATCH
		-- MSSQL: 2627(primary key violation) and 2601 (unique constraint violation)
		if (Error_Number() in (2627,2601))
			RAISERROR(60006,16,1) ---6006: UniqueViolation
		Else
			exec HUL_RETHROWERROR
	END CATCH
	
	SET NOCOUNT OFF	
	Return
End
Go
	
If Exists (select * from syscomments where id = object_id('BooksInsert'))
Begin
	If Object_Id('BooksInsert') Is Not Null
		Print '<<< CREATED PROCEDURE BooksInsert >>>'
	Else
		Print '<<< FAILED CREATING PROCEDURE BooksInsert" >>>'
End
Go

-- End of BooksInsert -------------------------------------------------------------------------------------- 
	