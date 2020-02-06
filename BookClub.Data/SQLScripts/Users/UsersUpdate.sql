------------- Start of UsersUpdate ----------------------------------------------------
If Exists (select * from syscomments where id = object_id('UsersUpdate'))
	Begin
	Drop Procedure UsersUpdate
			If Object_Id('UsersUpdate') Is Not Null
				Print '<<< FAILED DROPPING PROCEDURE UsersUpdate >>>'
			Else
				Print '<<< DROPPED PROCEDURE UsersUpdate >>>'
	End
Go
Create Procedure UsersUpdate
(
	@inUserID int
	,@inUserName varchar(50)
	,@inUserSurname varchar(50)
	,@inUserEmail varchar(50)
	,@inPassword varchar(50)
)
As
Begin	
	/*---------------------------------------------------------------
	 * Stored Proc  : UsersUpdate
	 * Purpose		: Updates a single row into the Users table
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
		If NOT Exists(select * from Users 
		where 
			UserID = @inUserID
		)
		BEGIN
			RAISERROR(60009,16,1) ---60009: NotFoundException
		END
	
		Update Users 
		Set
			UserName = @inUserName
			,UserSurname = @inUserSurname
			,UserEmail = @inUserEmail
			,Password = @inPassword
		where
			UserID = @inUserID
		
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
	
if exists (select * from syscomments where id = object_id('UsersUpdate'))
begin
	if object_id('UsersUpdate') is not null
		print '<<< created procedure UsersUpdate >>>'
	else
		print '<<< failed creating procedure UsersUpdate >>>'
end
go