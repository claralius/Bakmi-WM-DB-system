use BakmiWM

--1.Display CustomerID, CustomerName, and Total Transaction (obtained from the total transaction and ended with ' purchase(s)') for each customer whose name contains 'e' and served by a staff whose name ends with 'n'.

select
	mth.customerID,
	customerName,
	[Total Transaction] = concat(CAST(count(menuTransactionID) + count(souvenirTransactionID) AS varchar), ' purchase(s)')
from menuTransactionHeader mth
	join MsCustomer mc
		on mth.customerID = mc.customerID
	join souvenirTransactionHeader sth
		on mc.customerID = sth.customerID
	join MsStaff ms
		on sth.staffID = ms.staffID
where mc.customerName like '%e%'
and staffName like '%n'
group by mth.customerID, customerName

--2.	Display SouvenirTransactionID, StaffID, CustomerID, and Total Price (obtained by adding 'Rp. ' in front of the sum of multiplication of the souvenir sell price and quantity) for each purchase which customer's name length is more than 10 and the souvenir sell price is greater than 35000.

select
	sth.SouvenirTransactionID,
	StaffID,
	sth.CustomerID,
	[Total Price] = concat('Rp. ', sum(sellPrice * souvenirQty))
from MsCustomer mc
	join souvenirTransactionHeader sth
		on mc.customerID = sth.customerID
	join souvenirTransactionDetails std
		on sth.souvenirTransactionID = std.souvenirTransactionID
	join MsSouvenir ms
		on std.souvenirID = ms.souvenirID
where len(customerName) > 10
and sellPrice > 35000
group by sth.souvenirTransactionID, staffID, sth.customerID

--3.	Display MenuTransactionID, CustomerName, MenuTransactionDate (obtained from MenuTransactionDate with 'dd-mm-yyyy' format), Total Product (obtained from the number of products) and Total Quantity (obtained from the sum of all product's quantities) for every menu transaction which occurred at even day and the customer's name consists of at least 2 words

select
	mth.MenuTransactionID,
	CustomerName,
	MenuTransactionDate = convert(varchar, menuTransactionDate, 105),
	[Total Product] = count(menuID),
	[Total Quantity] = count(menuQty)
from MsCustomer mc
	join menuTransactionHeader mth
		on mc.customerID = mth.customerID
	join menuTransactionDetails mtd
		on mth.menuTransactionID = mtd.menuTransactionID
where customerName like '% %'
and day(menuTransactionDate)%2 = 0
group by mth.menuTransactionID, customerName, menuTransactionDate


--4.	Display SouvenirTransactionID, Staff First Name (obtained from the first name of the staff), Total Product (obtained from the count of product), and Total Quantity (obtained from the sum of quantity) for every souvenir transaction which staff's name consists of more than one word and staff's salary is more than 10000000


select
	std.souvenirTransactionID,
	[Staff First Name] = substring(staffName, 1, charindex(' ', staffName)),
	[Total Product] = count(souvenirQty),
	[Total Quantity] = sum(souvenirQty)
from souvenirTransactionDetails std
	join souvenirTransactionHeader sth
		on std.souvenirTransactionID = sth.souvenirTransactionID
	join MsStaff ms
		on sth.staffID = ms.staffID
where staffName like '% %'
and staffSalary > 10000000
group by std.souvenirTransactionID,
substring(staffName, 1, charindex(' ', staffName))

--5.	Display unique SouvenirTransactionID, StaffName, SouvenirTransactionDate (obtained from SouvenirTransactionDate with 'dd-mm-yyyy' format), Salary (obtained by adding ‘Rp. ’ in front of the StaffSalary) for every menu transaction which has a souvenir which buy price is more than 10000 and handled by a staff whose salary is more than average.
-- (alias subquery)

select
	sth.souvenirTransactionID,
	staffName,
	souvenirTransactionDate = convert(varchar, souvenirTransactionDate, 105),
	[Salary] = concat('Rp. ', staffSalary)
from MsStaff ms
	join souvenirTransactionHeader sth
		on ms.staffID = sth.staffID
	join souvenirTransactionDetails std
		on sth.souvenirTransactionID = std.souvenirTransactionID
	join MsSouvenir mss
		on std.souvenirID = mss.souvenirID,
	(
		select average = avg(staffSalary)
		from MsStaff
	)as alias
where buyPrice > 10000
and staffSalary > alias.average


--6.	Display StaffName, MenuName, MenuTransactionDate (obtained from MenuTransactionDate with 'dd-mm-yyyy' format), Staff Local Phone (obtained by replacing StaffPhone first character into ‘+62’) for every menu transaction which is served by female staff and menu price is higher than the average sell price of all souvenirs.
--(alias subquery)

select
	staffName,
	menuName,
	menuTransactionDate = convert(varchar, menuTransactionDate, 105),
	[Staff Local Phone] = stuff(staffPhone, 1, 1, '+62')
from MsStaff ms
	join menuTransactionHeader mth
		on ms.staffID = mth.staffID
	join menuTransactionDetails mtd
		on mth.menuTransactionID = mtd.menuTransactionID
	join MsMenu mm
		on mtd.menuID = mm.menuID,
	(
		select average = avg(sellPrice)
		from MsSouvenir
	)as alias1
where staffGender = 'Female'
and menuPrice > alias1.average


--7.	Display SouvenirTransactionID, Capitalized Customer Name (obtained from the uppercase of the customer's name), and Total Quantity (obtained from the sum of quantity purchased and ended with ' pc(s)') for every souvenir transaction which id number is odd and has total quantity purchased higher than the maximum quantity of all souvenir transaction.
--(alias subquery)

SELECT
	sth.souvenirTransactionID,
	[Capitalized Customer Name] = UPPER(customerName),
	[Total Quantity] = CONCAT(SUM(souvenirQty), ' pc(s)')
FROM 
	MsCustomer mc JOIN 
	souvenirTransactionHeader sth ON mc.customerID = sth.customerID JOIN 
	souvenirTransactionDetails std ON sth.souvenirTransactionID = std.souvenirTransactionID,
	(
		SELECT
			max_quantity = MAX(souvenirQty)
		FROM 
			souvenirTransactionDetails
	) aliasA
WHERE 
	CAST(RIGHT(sth.souvenirTransactionID,3) AS int) % 2 != 0
GROUP BY sth.souvenirTransactionID, customerName, aliasA.max_quantity
HAVING 
	SUM(souvenirQty) > aliasA.max_quantity



--8.	Display Staff Number (obtained from replacing the 'SF' in StaffID with 'Staff '), StaffName, StaffPositionName, and Total Quantity (obtained from the sum of quantity purchased) for every menu transaction which total quantity is less than or equals to the minimum purchase quantity in every purchase that occurred between the 16th and 25th day of the month.
--(alias subquery)

select
	[Staff Number] = replace(ms.staffID, 'SF', 'Staff '),
	staffName,
	staffPositionName,
	[Total Quantity] = sum(menuQty)
from MsStaffPosition msp
	join MsStaff ms
		on msp.staffPositionID = ms.staffPositionID
	join menuTransactionHeader mth
		on ms.staffID = mth.staffID
	join menuTransactionDetails mtd
		on mth.menuTransactionID = mtd.menuTransactionID,
	(
		SELECT
			min_quantity = MIN([Total Quantity])
		FROM 
			(
			select ms.staffid, [Total Quantity] = sum(menuQty)
				from MsStaffPosition msp
				join MsStaff ms
					on msp.staffPositionID = ms.staffPositionID
				join menuTransactionHeader mth
					on ms.staffID = mth.staffID
				join menuTransactionDetails mtd
					on mth.menuTransactionID = mtd.menuTransactionID
			group by ms.staffid
				
			)aliasB1
	)aliasB,

	(
		select ms.staffid, [Total Quantity] = sum(menuQty)
				from MsStaffPosition msp
				join MsStaff ms
					on msp.staffPositionID = ms.staffPositionID
				join menuTransactionHeader mth
					on ms.staffID = mth.staffID
				join menuTransactionDetails mtd
					on mth.menuTransactionID = mtd.menuTransactionID
			group by ms.staffid

	) aliasC
where day(menuTransactionDate) between 16 and 25
	and aliasC.staffID = ms.staffID
	and aliasC.[Total Quantity] <= aliasB.min_quantity
group by ms.staffID,staffname,staffpositionname


--9.	Create a view named 'CustomerMenuPurchaseViewer' to display CustomerID, CustomerName, CustomerEmail, Maximum Quantity (obtained from the maximum quantity purchased), and Minimum Quantity (obtained from the minimum quantity purchased) for every customer whose id is even and the maximum quantity doesn't equal to its minimum quantity.
go
create view CustomerMenuPurchaseViewer as
select
	mc.customerID,
	customerName,
	customerEmail,
	[Maximum Quantity] = max(menuQty),
	[Minimum Quantity] = min(menuQty)
from MsCustomer mc
	join menuTransactionHeader mth
		on mc.customerID = mth.customerID
	join menuTransactionDetails mtd
		on mth.menuTransactionID = mtd.menuTransactionID
where cast(substring(mc.customerID,3,5)as int) % 2= 0
group by mc.customerID, customerName, customerEmail
having max(menuQty) != min(menuQty)

select * from CustomerMenuPurchaseViewer

--10.	Create a view named 'StaffSouvenirSellingViewer' to display StaffID, StaffName, StaffAddress, and Total Price (obtained by the sum of quantity purchased times souvenir sell price) for every staff whose address consists of at least 3 words and the minimum quantity purchased is more than 5.

create view StaffSouvenirSellingViewer as
select
	ms.staffID,
	staffName,
	staffAddress,
	[Total Price] = sum(souvenirQty * sellPrice)
from 
	MsStaff ms JOIN 
	souvenirTransactionHeader sth
		on ms.staffID = sth.staffID
	join souvenirTransactionDetails std
		on sth.souvenirTransactionID = std.souvenirTransactionID
	join MsSouvenir mss
		on std.souvenirID = mss.souvenirID
where (LEN(staffAddress) - LEN(replace(staffAddress, ' ', ''))) + 1 >= 3
group by ms.staffID, staffName, staffAddress, sth.souvenirTransactionID
having sum(souvenirQty) > 5

select * from StaffSouvenirSellingViewer















