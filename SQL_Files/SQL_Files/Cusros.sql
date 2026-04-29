-- (1) create table in database
CREATE TABLE [dbo].[customer2](
	[customerId] [int] IDENTITY(1,1) NOT NULL,
	[fName] [nvarchar](50) NULL,
	[lName] [nvarchar](50) NULL,
	[rating] [int] NULL,
	[bonus] [decimal](18, 2) NULL,
 CONSTRAINT [PK_customer2] PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- (2) create  cursor  and apply business rules
create procedure p_applyBonusToCustomer as 
declare @customerId int, @fName nvarchar(50), @lName nvarchar(50), @rating int, @bonus decimal(18,2)
declare cursor_customer cursor for select customerId, fName, lName, rating, bonus from customer2
open cursor_customer 
fetch next from cursor_customer into @customerId, @fName, @lName, @rating, @bonus
while @@FETCH_STATUS = 0
begin 
       if @rating >= 5
	   begin
	   update customer2 set bonus = 5000 where customerId = @customerId
	   end
	   fetch next from cursor_customer into @customerId, @fName, @lName, @rating, @bonus
end 
close cursor_customer 
deallocate cursor_customer

execute p_applyBonusToCustomer
select * from customer2

