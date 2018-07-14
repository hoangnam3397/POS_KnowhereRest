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
