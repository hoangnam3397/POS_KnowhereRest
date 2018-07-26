create database PR4
use PR4

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
)
create table Categories
(
	cat_id varchar(10) primary key not null,
	cat_name nvarchar(50) not null,
	createday datetime,
	[deleted] int not null,
)
create table employees
(
	emp_id varchar(10) primary key not null,
	emp_name nvarchar(50) not null,
	[user] varchar(50) not null,
	[password] varchar(50) not null,
	[role_id] varchar(10) foreign key references  Roles(role_id),
	email varchar(50),
	phone varchar(15) not null,
	[avatarlink] varchar(max),
	[deleted] int not null,
	
)

create table Roles
(
	[role_id] varchar(10) primary key not null,
	role_name varchar(30) not null,
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
create table [Tables]
(
	tab_id varchar(10) primary key not null,
	tab_name nvarchar(50) not null,
	zone_id varchar(10) foreign key references Zones(zone_id),
	status bit,
	[deleted] int not null,
	

)

create table Zones
(
	zone_id varchar(10) primary key not null,
	zone_name nvarchar(50) not null,
	sto_id varchar(10) foreign key references Stores(sto_id),
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
	[option] nvarchar(150),
)
ALter table [dbo].[Order_Details] add constraint [FK_dbo.Order_Details.dbo.Orders_order_id] foreign key (order_id) references [dbo].[Orders](order_id)

ALter table [dbo].[Order_Details] add constraint [FK_dbo.Order_Details.dbo.Products_pro_id] foreign key (order_id) references [dbo].[Products](pro_id)

create table HideProduct
(
	sto_id varchar(10),
	pro_id varchar(10),
	hide int,
	Constraint [PK.HideProduct] primary key ([sto_id],[pro_id]),
)

ALter table [dbo].[HideProduct] add constraint [FK_dbo.HideProduct.dbo.Stores_sto_id] foreign key (sto_id) references [dbo].[Stores](sto_id)

ALter table [dbo].[HideProduct] add constraint [FK_dbo.HideProduct.dbo.Products_pro_id] foreign key (pro_id) references[dbo].[Products](pro_id)

insert into Stores values('S001','Knowhere CMT8','590 CMT8 Q3','083852222',0)
    insert into Stores values('S002','Knowhere Tay Ninh','Go Dau,Tay Ninh','0663852223',0)

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
