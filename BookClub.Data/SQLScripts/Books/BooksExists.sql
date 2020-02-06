------------- Start of BooksExists ----------------------------------------------------
If Exists (select * from syscomments where id = object_id('BooksExists'))
	Begin
		Drop Procedure BooksExists
		If Object_Id('BooksExists') Is Not Null
			Print '<<< FAILED DROPPING PROCEDURE BooksExists >>>'
		Else
			Print '<<< DROPPED PROCEDURE BooksExists >>>'
	End
Go
Create Procedure BooksExists
(
	@inBookNumber int
	,@RecCount int output
)
As
Begin	
	
	Select 
		@RecCount = Count(*)
	from
		ModelEntity1
	where
		BookNumber = @inBookNumber
		 
end
go
	
if exists (select * from syscomments where id = object_id('BooksExists'))
begin
	if object_id('BooksExists') is not null
		print '<<< created procedure BooksExists >>>'
	else
		print '<<< failed creating procedure BooksExists >>>'
end
go