-- addition of 2 numbers using SQL function
-- scalar function
create function addition(@a int,@b int)
returns int
as begin
--declare variable in SQL
declare @c int
-- code to exe
set @c=@a+@b
return @c
end

-- database object
select dbo.addition(10,20) as 'sum'


--scalar function

create function GetEmpName(@id int)
returns varchar(20)
as begin
return( select name from Employee where id=@id)
end

select dbo.GetEmpName(1) as 'Emp name'


-- multi value function begin & end keyword not need to write

create function GetEmpByDept(@did int)
returns table
as
return (select * from Employee where did=@did)


select * from dbo.GetEmpByDept(104)

--create a function to accept the product price
--give 10% discount and returns the discounted price

create function GetDiscount(@price int)
returns decimal
as begin
declare @disprice decimal
set @disprice=@price-(@price*0.10)
return @disprice
end

select price ,dbo.GetDiscount(price) as 'discount price' from product4




