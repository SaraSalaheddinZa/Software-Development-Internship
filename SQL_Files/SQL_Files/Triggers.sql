-- Triggers

--(1) Create a client table
CREATE TABLE [dbo].[client](
	[clientId] [int] IDENTITY(1,1) NOT NULL,
	[fName] [nvarchar](50) NULL,
	[countryId] [int] NULL,
	[userName] [nvarchar](50) NULL,
 CONSTRAINT [PK_client_1] PRIMARY KEY CLUSTERED 
(
	[clientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--(2) Create clientLog table
CREATE TABLE [dbo].[clientLog](
	[clientLogId] [int] IDENTITY(1,1) NOT NULL,
	[clientid] [int] NULL,
	[fName] [nvarchar](50) NULL,
	[userName] [nvarchar](50) NULL,
	[triggerType] [nvarchar](50) NULL,
	[recordChangeDate] [datetime] NULL,
 CONSTRAINT [PK_clientLog] PRIMARY KEY CLUSTERED 
(
	[clientLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[clientLog] ADD  CONSTRAINT [DF_clientLog_recordChangeDate]  DEFAULT (getdate()) FOR [recordChangeDate]
GO
--(3) create trigger on client table for insert
create trigger trg_clientLogForInsert on client after insert 
as 
begin
insert clientLog (clientId, fName, userName, triggerType)
select clientId, fName, userName, 'inserted' from inserted
end 
go
--(4) Test the Trigger
insert client (fName, countryId, userName)
values ('Albert', 4, 'Alberto')
select * from client
select * from clientLog
--(5) create trigger on client table for delete 
create trigger trg_clientLogForDelete on client after delete
as 
begin 
insert clientLog (clientId, fName, userName, triggerType)
select clientId, fName, userName, 'deleted' from deleted
end 
go
--(6) Test the trigger
delete client where clientId = 3
select * from client
select * from clientLog
--(7) create trigger on client table for update 
create trigger trg_clientLogForUpdate on client after update
as
begin 
insert into clientLog (clientId, fName, userName, triggerType)
select clientId, fName, 'user1', 'Deleted for Update' from deleted
insert into clientLog (clientid, fName, userName, triggerType)
select clientId, fName, 'user1', 'Inserted for Update' from inserted
end
-- Test the trigger 
update client
set salary = 9000
where clientId = 2
select * from client
select * from clientLog