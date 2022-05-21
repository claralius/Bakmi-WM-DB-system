create database BakmiWM
use BakmiWM

create table MsStaffPosition(
	staffPositionID char(5) primary key check(staffPositionID like 'SP[0-9][0-9][0-9]'),
	staffPositionName varchar(50) not null
)


create table MsStaff(
	staffID char(5) primary key check(staffID like 'SF[0-9][0-9][0-9]'),
	staffName varchar(100) not null,
	staffGender varchar(10) check (staffGender like 'Male' or staffGender like 'Female') not null,
	staffDOB date check (year(staffDOB)<2005),
	staffPhone varchar(30) not null check (staffPhone not like '%[^0-9]%'),
	staffEmail varchar(255) not null,
	staffAddress varchar(255) check(len(staffAddress)>15) not null,
	staffSalary int not null,
	staffPositionID char(5) foreign key references MsStaffPosition(staffPositionID) on update cascade on delete cascade
)


create table MsCustomer(
	customerID char(5) primary key check(customerID like 'CU[0-9][0-9][0-9]'),
	customerName varchar(255) not null,
	customerGender varchar(10) check (customerGender like 'Male' or customerGender like 'Female') not null,
	customerPhone varchar(30) not null check(customerPhone not like '%[^0-9]%'),
	customerEmail varchar(255) not null,
	customerAddress varchar(255) check(len(customerAddress)>15) not null
)


create table MsMenuCategory(
	menuCategoryID char(5) primary key check(menuCategoryID like 'MC[0-9][0-9][0-9]'),
	menuCategoryName varchar(30) not null
)


create table MsMenu(
	menuID char(5) primary key check(menuID like 'ME[0-9][0-9][0-9]'),
	menuName varchar(255) not null,
	menuPrice int check (menuPrice between 1000 and 10000000),
	menuCategoryID char(5) foreign key references MsMenuCategory(menuCategoryID) on update cascade on delete cascade
)


create table menuTransactionHeader(
	menuTransactionID char(5) primary key check(menuTransactionID like 'MT[0-9][0-9][0-9]'),
	staffID char(5) foreign key references MsStaff(staffID) on update cascade on delete cascade,
	customerID char(5) foreign key references MsCustomer(customerID) on update cascade on delete cascade,
	menuTransactionDate date not null
)


create table menuTransactionDetails(
	menuTransactionID char(5) foreign key references menuTransactionHeader(menuTransactionID) on update cascade on delete cascade,
	menuID char(5) foreign key references MsMenu(menuID) on update cascade on delete cascade,
	menuQty int not null,
	primary key(menuTransactionID, menuID)
)



create table MsSouvenir(
	souvenirID char(5) primary key check(souvenirID like 'SO[0-9][0-9][0-9]'),
	souvenirName varchar(255) not null,
	buyPrice int not null,
	sellPrice int not null
)


create table souvenirTransactionHeader(
	souvenirTransactionID char(5) primary key check(souvenirTransactionID like 'ST[0-9][0-9][0-9]'),
	staffID char(5) foreign key references MsStaff(staffID) on update cascade on delete cascade,
	customerID char(5) foreign key references MsCustomer(customerID) on update cascade on delete cascade,
	souvenirTransactionDate date not null
)


create table souvenirTransactionDetails(
	souvenirTransactionID char(5) foreign key references souvenirTransactionHeader(souvenirTransactionID) on update cascade on delete cascade,
	souvenirID char(5) foreign key references MsSouvenir(souvenirID) on update cascade on delete cascade,
	souvenirQty int not null,
	primary key(souvenirTransactionID, souvenirID)
)


