------------- Start of UsersExists ----------------------------------------------------
If Exists (select * from syscomments where id = object_id('UsersExists'))
	Begin
		Drop Procedure UsersExists
		If Object_Id('UsersExists') Is Not Null
			Print '<<< FAILED DROPPING PROCEDURE UsersExists >>>'
		Else
			Print '<<< DROPPED PROCEDURE UsersExists >>>'
	End
Go
Create Procedure UsersExists
(
	@inUserID int
	,@RecCount int output
)
As
Begin	
	
	Select 
		@RecCount = Count(*)
	from
		Users
	where
		UserID = @inUserID
		 
end
go
	
if exists (select * from syscomments where id = object_id('UsersExists'))
begin
	if object_id('UsersExists') is not null
		print '<<< created procedure UsersExists >>>'
	else
		print '<<< failed creating procedure UsersExists >>>'
end
go