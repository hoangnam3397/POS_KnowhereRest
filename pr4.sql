create database PR4
use PR4

create table Categories
(
	cat_id varchar(10) primary key not null,
	cat_name nvarchar(50) not null,
	createday datetime,
	[deleted] int not null,
)
create table Products
(
	pro_id varchar(10) primary key not null,
	pro_name nvarchar(50) not null,
	cat_id varchar(10) foreign key references Categories(cat_id),
	price money not null,
	[imagelink] nvarchar(max),
	discount float not null,
	[deleted] int not null,
	[description] nvarchar(200),
	color varchar(20),
	hide int
)

create table Roles
(
	[role_id] varchar(10) primary key not null,
	role_name varchar(30) not null,
	[deleted] int not null,
)
create table employees
(
	emp_id varchar(10) primary key not null,
	emp_name nvarchar(50) not null,
	username varchar(50) not null,
	[password] varchar(50) not null,
	[role_id] varchar(10) foreign key references  Roles(role_id),
	email varchar(50),
	phone varchar(15) not null,
	[avatarlink] varchar(max),
	[deleted] int not null,
	
)

create table Customers
(
	cus_id varchar(10) primary key not null,
	cus_name nvarchar(50) not null,
	phone varchar(20) ,
	email varchar(50),
	[discount] float not null,

)
create table Stores
(
	sto_id varchar (10) primary key not null,
	sto_name nvarchar(50) not null,
	[address] varchar(100),
	phonesto varchar(15),
	[deleted] int not null,
)

create table Zones
(
	zone_id varchar(10) primary key not null,
	zone_name nvarchar(50) not null,
	sto_id varchar(10) foreign key references Stores(sto_id),
	[deleted] int not null
)

create table [Tables]
(
	tab_id varchar(10) primary key not null,
	tab_name nvarchar(50) not null,
	zone_id varchar(10) foreign key references Zones(zone_id),
	status bit,
	[deleted] int not null,
	

)

create table Orders 
(
	order_id varchar(10) primary key not null,
	paymethod nvarchar(50) not null,
	ordertime datetime,
	[deleted] int not null,
	subtotal money not null,
	order_tax float not null,
	discount float not null ,
	total money not null,
	cus_id varchar(10) foreign key references Customers(cus_id),
	emp_id varchar(10) foreign key references Employees(emp_id),
	tab_id varchar(10) foreign key references Tables(tab_id),
)

create table Order_Details
(
	order_id varchar(10) not null,
	pro_id varchar(10) not null,
	
	Constraint [PK.Order_Details] primary key ([order_id],[pro_id]),
	quantity int not null,
	price money not null,
	discount float not null,
	optionvalue nvarchar(150),
)
ALter table [dbo].[Order_Details] add constraint [FK_dbo.Order_Details.dbo.Orders_order_id] foreign key (order_id) references [dbo].[Orders](order_id)

ALter table [dbo].[Order_Details] add constraint [FK_dbo.Order_Details.dbo.Products_pro_id] foreign key (pro_id) references [dbo].[Products](pro_id)

create table HideProduct
(
	sto_id varchar(10),
	pro_id varchar(10),
	hide int,
	Constraint [PK.HideProduct] primary key ([sto_id],[pro_id]),
)

ALter table [dbo].[HideProduct] add constraint [FK_dbo.HideProduct.dbo.Stores_sto_id] foreign key (sto_id) references [dbo].[Stores](sto_id)

ALter table [dbo].[HideProduct] add constraint [FK_dbo.HideProduct.dbo.Products_pro_id] foreign key (pro_id) references[dbo].[Products](pro_id)


--view
	Create view TopProduct as 
	SELECT TOP 5  pro_id, SUM(quantity) as qSum
	FROM Order_Details
	GROUP BY pro_id
	ORDER BY qSum DESC
	go

	Create view TopProductValue as 
	Select t.pro_id,p.pro_name,t.qSum from TopProduct t join Products p on t.pro_id=p.pro_id
	go
	create view TotalToday as
	select * from Orders where ordertime >=DATEADD(day, DATEDIFF(day,0,GETDATE()),0) and ordertime < DATEADD(day, DATEDIFF(day,0,GETDATE())+1,0)
	go

	create view vProductReport as
	Select a.order_id,b.pro_id,a.ordertime,b.price,b.quantity,b.discount from Orders a join Order_Details b on a.order_id = b.order_id
	go
	
	create view SalesByCustomer as
  select o.order_id,o.pro_id,o.quantity,o.price,o.discount,c.cus_id,c.cus_name,p.pro_name,b.ordertime from Order_Details o join Orders b on o.order_id=b.order_id join Customers c on c.cus_id=b.cus_id join Products p on p.pro_id=o.pro_id

	insert into Stores values('S001','Store CMT8','590 CMT8 Q3','083852222',0)
    insert into Stores values('S002','Store Tay Ninh','Go Dau,Tay Ninh','0663852223',0)
	insert into Stores values('S003','Store Binh Duong','Di An,Binh Duong','0832221221',0)

	insert into Zones values('Z001','Out Door','S001',0)
	insert into Zones values('Z002','In Door','S001',0)
	insert into Zones values('Z003','Terrace','S001',0)

	insert into Zones values('Z101','Out Door','S002',0)
	insert into Zones values('Z102','VIP','S002',0)
	insert into Zones values('Z103','SVIP','S002',0)

	insert into Tables values('TB01','01','Z001',0)
	insert into Tables values('TB02','02','Z001',0)
	insert into Tables values('TB03','03','Z001',0)
	insert into Tables values('TB04','04','Z001',0)
	insert into Tables values('TB05','05','Z001',0)
	insert into Tables values('TB06','06','Z001',0)
	insert into Tables values('TB07','07','Z002',0)
	insert into Tables values('TB08','08','Z002',0)
	insert into Tables values('TB09','09','Z002',0)
	insert into Tables values('TB10','10','Z003',0)
	insert into Tables values('TB11','11','Z003',0)
	insert into Tables values('TB12','12','Z003',0)

	insert into Tables values('TB201','01','Z101',0)
	insert into Tables values('TB202','02','Z101',0)
	insert into Tables values('TB203','03','Z102',0)
	insert into Tables values('TB204','04','Z102',0)
	insert into Tables values('TB205','05','Z102',0)
	insert into Tables values('TB206','06','Z101',0)
	insert into Tables values('TB207','07','Z103',0)
	insert into Tables values('TB208','08','Z103',0)
	
	insert into Categories values('CAT00001','Juices','2018-08-08 00:59:17.763',0)
	insert into Categories values('CAT00002','Acoholic Drink','2018-08-08 01:59:17.763',0)
	insert into Categories values('CAT00003','Coffees','2018-08-08 02:59:17.763',0)
	insert into Categories values('CAT00004','Pasta','2018-08-08 03:59:17.763',0)
	insert into Categories values('CAT00005','Fast Food','2018-08-08 04:20:17.763',0)

	insert into Products values('P00001','Heneken','CAT00001',22000,'images/default-food.png',0,0,null,color02)
    insert into Products values('P00002','Salad','CAT00002',22000,'images/default-food.png',0,0,null,color02)
    insert into Products values('P00003','Tiger','CAT00001',18000,'images/default-food.png',0,0,null,color02)
    insert into Products values('P00004','Hamburger','CAT00003',28000,'images/default-food.png',0,0,null,color03)
    insert into Products values('P00005','Hotdog','CAT00003',20000,'images/default-food.png',0,0,null,color04)
    insert into Products values('P00004','Coffee Milk','CAT00001',16000,'images/default-food.png',0,0,null,color05)

	insert into employees values('EMP00001','Admin','admin','123456','rol01','admin@gmail.com',123456789,null,0)
	insert into employees values('EMP00002','Duy','duy','123456','rol01','duy@gmail.com',096845215,null,0)
	insert into employees values('EMP00003','Nam','nam','123456','rol01','nam@gmail.com',098554545,null,0)

