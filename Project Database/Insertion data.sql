use BakmiWM
--Master table must be filled with more than or equals to 10 data

--MsStaffPosition
--staffPositionID, staffPositionName

insert into MsStaffPosition values
	('SP001', 'Chairman'),
	('SP002', 'Director'),
	('SP003', 'Assistant Manager'),
	('SP004', 'Secretary'),
	('SP005', 'Treasurer'),
	('SP006', 'Accountant'),
	('SP007', 'Cashier'),
	('SP008', 'Chef'),
	('SP009', 'Waiter'),
	('SP010', 'Dishwasher')

select * from MsStaffPosition

--MsStaff
--staffID, staffName, staffGender, staffDOB, staffPhone, staffEmail, staffAddress, staffSalary, staffPositionID

insert into MsStaff values
	('SF001', 'Anton Davis', 'Male', '2000-10-03', '08126571923', 'anton@gmail.com', 'Jl. Anggrek Syahdan no.21', 30000000, 'SP001'),
	('SF002', 'Kento Bryan', 'Male', '1999-02-22', '08229123145', 'kentokento@yahoo.com', 'Jl.Kyai Tapa no.5', 8000000, 'SP002'),
	('SF003', 'Michelle Halim', 'Female', '1994-07-15', '0856411707', 'michellehalim@gmail.com', 'Jl. KH Mas Mansyur 5 no.3', 5000000, 'SP003'),
	('SF004', 'Maya', 'Female', '2000-08-15', '0815663332', 'mayangmaya@outlook.com', 'Jl. Gading Boulevard Raya no.18', 4500000, 'SP004'),
	('SF005', 'Randy Salim', 'Male', '1997-06-06', '0817985055', 'randysalim@gmail.com', 'Jl. Sunter Griya no.28', 4500000, 'SP005'),
	('SF006', 'Hanny Jo', 'Female', '2002-07-20', '0812178432', 'hannyjo@yahoo.com', 'Jl. MH Thamrin no.10', 12000000, 'SP006'),
	('SF007', 'Ryan Handoyo', 'Male', '2003-04-21', '08989236537', 'ryanhandoyo@outlook.com', 'Jl. Casablanca Raya kav.90', 2000000, 'SP007'),
	('SF008', 'Andy Andrew', 'Male', '2000-05-29', '0859207862', 'andyandrew@gmail.com', 'Jl Menteng Dalam Raya no.11', 15000000, 'SP008'),
	('SF009', 'Lulu Liu', 'Female', '1996-03-11', '0878283991', 'lululiu@yahoo.com', 'Jl. Cipete Raya no.311', 1500000, 'SP009'),
	('SF010', 'Dika', 'Male', '2000-12-05', '0853207966', 'dikabrahm@gmail.com', 'Jl. Cempaka Putih XVII no.3', 1000000, 'SP010')

select * from MsStaff

--MsMenuCategory
--menuCategoryID, menuCategoryName

insert into MsMenuCategory values
	('MC001', 'Food'),
	('MC002', 'Dessert'),
	('MC003', 'Beverage'),
	('MC004', 'Topping')

select * from MsMenuCategory

--MsMenu

insert into MsMenu values
--menuID, menuName,menuPrice,menuCategoryID
	('ME001', 'Bakmi Ayam', 35000, 'MC001'),
	('ME007', 'Es Campur', 15000, 'MC002'),
	('ME010', 'Es Teh Tawar',5000, 'MC003'),
	('ME015', 'Pangsit Goreng', 8000, 'MC004'),
	('ME008', 'Fruitilala', 18000, 'MC002'),
	('ME002', 'Bakmi Spesial', 40000, 'MC001'),
	('ME016', 'Sayur Toge', 3000, 'MC004'),
	('ME011', 'Es Teh Manis', 6000, 'MC003'),
	('ME009', 'Es Teh Lemon', 8000, 'MC003'),
	('ME003', 'Bakmi Goreng', 43000, 'MC001')

select * from MsMenu

--MsSouvenir
--souvenirID, souvenirName, buyPrice, sellPrice

insert into MsSouvenir values
	('SO001', 'Botol minum', 18000, 40000),
	('SO002', 'Boneka Bakmi WM', 10000, 20000),
	('SO003', 'Kipas tangan', 5000, 8000),
	('SO004', 'Gantungan Kunci', 7000, 9000),
	('SO005', 'Pulpen Bakmi WM', 3000, 5000),
	('SO006', 'Dompet Bakmi WM', 6000, 10000),
	('SO007', 'Kotak Makan', 15000, 50000),
	('SO008', 'Pin Bakmi WM', 3000, 7000),
	('SO009', 'Tas Backpack Kecil', 22000, 35000),
	('SO010', 'Hand Sanitizer', 5000, 10000)

select * from MsSouvenir


--MsCustomer
--customerID, customerName, customerGender, customerPhone, customerEmail, customerAddress

insert into MsCustomer values
	('CU001', 'Mikhael', 'Male', '0812718239', 'mikhael@gmail.com', 'Jl. Pinangsia Barat 5 no.3'),
	('CU002', 'Naura Salsabilla', 'Female', '0856123984', 'naura112@yahoo.com', 'Jl. Mangga Besar Raya no.112'),
	('CU003', 'Ran', 'Male', '0891255234', 'rantaka@yahoo.com', 'Jl. Sunter Hijau 3 blok SA2'),
	('CU004', 'Bella Amora', 'Female', '08163402358', 'bellaaa@gmail.com', 'Jl. Janur Elok blok AB no.12'),
	('CU005', 'Nadia', 'Female', '0859182469', 'nadiaasoetanto@outlook.com', 'Jl. Pluit Raya 1 no.13'),
	('CU006', 'Philip', 'Male', '0812129834', 'philiplim@gmail.com', 'Jl. Kapuk Raya SE no.8'),
	('CU007', 'Raphael Ong', 'Male', '0853789123', 'raphaelong@outlook.com', 'Jl. Senopati Raya no.45'),
	('CU008', 'Gabriel', 'Male', '0822871230', 'gabriellida@yahoo.com', 'Jl. Sawah Besar IX no.8'),
	('CU009', 'Rizqi Muhammad', 'Male', '0813091237', 'rizqibyl4l@gmail.com', 'Gg.Masjid Bekasi no.5'),
	('CU010', 'Shafa', 'Female', '08150982348', 'shafa89@gmail.com', 'Jl. Raya Pagelangan no.12')

select * from MsCustomer

--souvenirTransactionHeader
--souvenirTransactionID, staffID, CustomerID, souvenirTransactiondate

insert into souvenirTransactionHeader values
    ('ST001', 'SF001', 'CU001', '2021/12/04'),
    ('ST002', 'SF002', 'CU003', '2021/11/26'),
    ('ST003', 'SF003', 'CU007', '2021/04/03'),
    ('ST004', 'SF004', 'CU009', '2021/12/21'),
    ('ST005', 'SF005', 'CU010', '2021/09/13'),
    ('ST006', 'SF006', 'CU002', '2021/12/05'),
    ('ST007', 'SF007', 'CU005', '2021/08/03'),
    ('ST008', 'SF008', 'CU008', '2021/03/18'),
    ('ST009', 'SF009', 'CU004', '2021/08/14'),
    ('ST010', 'SF010', 'CU006', '2021/03/13'),
	('ST011', 'SF005', 'CU010', '2021/03/20'),
    ('ST012', 'SF006', 'CU005', '2021/09/22'),
    ('ST013', 'SF002', 'CU001', '2021/08/11'),
    ('ST014', 'SF008', 'CU007', '2021/10/25'),
    ('ST015', 'SF001', 'CU003', '2021/02/08')

select * from souvenirTransactionHeader
drop table souvenirTransactionHeader
drop table souvenirTransactionDetails


--menuTransactionHeader
--menuTransactionID, staffID, CustomerID, menuTransactiondate

insert into menuTransactionHeader values
    ('MT001', 'SF001', 'CU003', '2021/11/17'),
    ('MT002', 'SF002', 'CU010', '2021/12/30'),
    ('MT003', 'SF003', 'CU007', '2021/06/15'),
    ('MT004', 'SF004', 'CU002', '2021/03/23'),
    ('MT005', 'SF005', 'CU005', '2021/07/10'),
    ('MT006', 'SF006', 'CU001', '2021/10/13'),
    ('MT007', 'SF007', 'CU008', '2021/02/18'),
    ('MT008', 'SF008', 'CU004', '2021/08/19'),
    ('MT009', 'SF009', 'CU009', '2021/10/12'),
    ('MT010', 'SF010', 'CU006', '2021/09/15'),
	('MT011', 'SF008', 'CU007', '2021/11/27'),
    ('MT012', 'SF004', 'CU009', '2021/04/12'),
    ('MT013', 'SF006', 'CU002', '2021/01/14'),
    ('MT014', 'SF001', 'CU010', '2021/09/14'),
    ('MT015', 'SF009', 'CU005', '2021/10/03')

select * from menuTransactionHeader

-- souvernirTransactionDetail
-- souvenirTransactionId, souvernirID, souvernirQty

insert into souvenirTransactionDetails values
	('ST001', 'SO001', 2),
	('ST001', 'SO004', 3),
	('ST002', 'SO003', 2),
	('ST003', 'SO005', 3),
	('ST003', 'SO008', 5),
	('ST003', 'SO007', 1),
	('ST004', 'SO001', 6),
	('ST005', 'SO009', 1),
	('ST006', 'SO004', 4),
	('ST007', 'SO003', 2),
	('ST008', 'SO010', 1),
	('ST009', 'SO004', 1),
	('ST010', 'SO002', 4),
	('ST008', 'SO003', 2),
	('ST011', 'SO003', 2),
	('ST012', 'SO002', 5),
	('ST013', 'SO006', 5),
	('ST013', 'SO001', 1),
	('ST014', 'SO007', 4),
	('ST007', 'SO008', 2),
	('ST015', 'SO003', 2),
	('ST015', 'SO002', 4),
	('ST002', 'SO010', 1),
	('ST004', 'SO004', 3),
	('ST005', 'SO001', 3)

select * from souvenirTransactionDetails

-- menuTransactionDetail
-- menuTransactionId, menuID, menuQty

insert into menuTransactionDetails values
	('MT001', 'ME007', '4'),
	('MT002', 'ME010', '6'),
	('MT003', 'ME015', '1'),
	('MT004', 'ME008', '2'),
	('MT005', 'ME002', '3'),
	('MT006', 'ME016', '5'),
	('MT007', 'ME011', '1'),
	('MT008', 'ME009', '5'),
	('MT009', 'ME003', '8'),
	('MT010', 'ME007', '3'),
	('MT011', 'ME010', '3'),
	('MT012', 'ME002', '2'),
	('MT013', 'ME008', '4'),
	('MT014', 'ME016', '9'),
	('MT015', 'ME016', '1'),
	('MT010', 'ME015', '3'),
	('MT001', 'ME003', '5'),
	('MT002', 'ME008', '1'),  
	('MT003', 'ME001', '5'),
	('MT007', 'ME010', '3'),
	('MT004', 'ME016', '3'),
	('MT009', 'ME008', '2'),
	('MT011', 'ME015', '6'),
	('MT012', 'ME011', '2'),
	('MT015', 'ME010', '3')

select * from menuTransactionDetails


