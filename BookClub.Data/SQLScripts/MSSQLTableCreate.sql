
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