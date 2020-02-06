
-- ============================================================================================
-- CREATE TABLES ==============================================================================
-- ============================================================================================
Print '<<< Start of TABLE CREATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'	

-- Books ============================================================================================
if exists(select name from sysobjects where name='Books' and xtype='u')
BEGIN
	drop table Books
	If Object_Id('Books') Is Not Null
		Print '<<< FAILED DROPPING TABLE Books >>>'
	Else
		Print '<<< DROPPED TABLE Books >>>'
END
GO

create table Books
(
	BookNumber int identity(1,1) not null
	,BookName varchar(50) not null
	,Author varchar(50) not null
	,BookRating int not null
	,constraint Pk_Books primary key clustered
	(
		[BookNumber] asc
	)
);
GO
if exists(select name from sysobjects where name='Books' and xtype='u')
BEGIN
	If Object_Id('Books') Is Not Null
		Print '<<< CREATED TABLE Books >>>'
	Else
		Print '<<< FAILED CREATING TABLE Books >>>'
END
GO

-- Users ============================================================================================
if exists(select name from sysobjects where name='Users' and xtype='u')
BEGIN
	drop table Users
	If Object_Id('Users') Is Not Null
		Print '<<< FAILED DROPPING TABLE Users >>>'
	Else
		Print '<<< DROPPED TABLE Users >>>'
END
GO

create table Users
(
	UserID int identity(1,1) not null
	,UserName varchar(50) not null
	,UserSurname varchar(50) not null
	,UserEmail varchar(50) not null
	,Password varchar(50) not null
	,constraint Pk_Users primary key clustered
	(
		[UserID] asc
	)
);
GO
if exists(select name from sysobjects where name='Users' and xtype='u')
BEGIN
	If Object_Id('Users') Is Not Null
		Print '<<< CREATED TABLE Users >>>'
	Else
		Print '<<< FAILED CREATING TABLE Users >>>'
END
GO
Print ''
Print '<<< End of TABLE CREATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'		
GO

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
	@inUserId int 
	,@inUserName varchar(50)
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
	@inBookNumber int
	,@inBookName varchar(50)
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

------------- Start of vwBooks ----------------------------------------------------
If Exists (select * from syscomments where id = object_id('vwBooks'))
Begin
	Drop View vwBooks
	If Object_Id('vwBooks') Is Not Null
		Print '<<< FAILED DROPPING VIEW vwBooks >>>'
	Else
		Print '<<< DROPPED VIEW vwBooks >>>'
End
Go
create view vwBooks
as
	/*---------------------------------------------------------------
	* View        : vwBooks
	* Created By   : T4 Generation
	* Created On   : 06 February 2020 10:26:41 AM
	* Updated By   : 
	* Updated On   : 
	* CLR Version  : 4.6.1
	* Template Ver : Hulamin 4.6
	* --------------------------------------------------------------
	*/
	select
		a.BookNumber as BookNumber
		,a.BookName as BookName
		,a.Author as Author
		,a.BookRating as BookRating
	from		
		Books a
Go
If Exists (select * from syscomments where id = object_id('vwBooks'))
Begin
	If Object_Id('vwBooks') Is Not Null
		Print '<<< CREATED VIEW vwBooks >>>'
	Else
		Print '<<< FAILED CREATING VIEW vwBooks >>>'
End
Go
	

