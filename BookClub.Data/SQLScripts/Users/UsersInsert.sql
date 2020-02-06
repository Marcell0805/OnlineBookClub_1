------------- Start of UsersInsert ----------------------------------------------------
If Exists (select * from syscomments where id = object_id('UsersInsert'))
	Begin
	Drop Procedure UsersInsert
			If Object_Id('UsersInsert') Is Not Null
				Print '<<< FAILED DROPPING PROCEDURE UsersInsert >>>'
			Else
				Print '<<< DROPPED PROCEDURE UsersInsert >>>'
	End
Go

Create Procedure UsersInsert
(
	@inUserName varchar(50)
	,@inUserSurname varchar(50)
	,@inUserEmail varchar(50)
	,@inPassword varchar(50)
	,@outId int output
)
As
Begin	
	/*---------------------------------------------------------------
	 * Stored Proc  : UsersInsert
	 * Purpose		: Insert a single row into the Users table
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
	
		insert Into Users
		(
			UserID
			,UserName
			,UserSurname
			,UserEmail
			,Password
		)
		values
		(
			@inUserID
			,@inUserName
			,@inUserSurname
			,@inUserEmail
			,@inPassword
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
	
If Exists (select * from syscomments where id = object_id('UsersInsert'))
Begin
	If Object_Id('UsersInsert') Is Not Null
		Print '<<< CREATED PROCEDURE UsersInsert >>>'
	Else
		Print '<<< FAILED CREATING PROCEDURE UsersInsert" >>>'
End
Go

-- End of UsersInsert -------------------------------------------------------------------------------------- 
	