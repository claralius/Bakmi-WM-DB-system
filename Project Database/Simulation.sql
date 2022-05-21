-- Simulasi

--Skenario 1 :Pada tanggal 31 Oktober 2021, seorang customer bernama Betty (CU011) datang ke Bakmi WM
--			dan dilayani oleh staff Anton (SF001)

-- Staff Anton meminta data diri Betty
BEGIN TRAN
insert into MsCustomer values
('CU011', 'Betty', 'Female', '08191920730', 'bettybet@gmail.com', 'Jl. P Antasari no.123')

select * from MsCustomer

--Betty memesan makanan berikut:
--1) Bakmi Ayam (ME001) sebanyak 2 porsi
--2) Es Teh Tawar (ME010) sebanyak 2 gelas

BEGIN TRAN
insert into menuTransactionHeader values
('MT016', 'SF001', 'CU011', '2021-10-31')

select * from menuTransactionHeader

BEGIN TRAN
insert into menuTransactionDetails values
('MT016', 'ME001', 2),
('MT016', 'ME010', 2)

select * from menuTransactionDetails




--Skenario 2 :Pada tanggal 11 November 2021, seorang customer bernama Ilham (CU012) datang ke Bakmi WM
--			dan dilayani oleh staff Hanny (SF006)

--Staff Hanny meminta data diri Ilham
BEGIN TRAN
insert into MsCustomer values
('CU012', 'Ilham', 'Male', '0812093489', 'ilhamfauzi@outlook.com', 'Jl. Margonda Raya Barat 5')

select * from MsCustomer

-- Ilham membeli souvenir berikut:
-- Botol Minum (SO001) sebanyak 3 buah
-- Hand Sanitizer (SO010) sebanyak 2 buah
-- Kotak Makan (SO007) sebanyak 1 buah

BEGIN TRAN
insert into souvenirTransactionHeader values
('ST017', 'SF006', 'CU012', '2021-11-11')

select * from souvenirTransactionHeader

BEGIN TRAN
insert into souvenirTransactionDetails values
('ST017', 'SO001', 3),
('ST017', 'SO010', 2),
('ST017', 'SO007', 1)

select * from souvenirTransactionDetails 


--Skenario 3 :Pada tanggal 12 Desember 2021, seorang customer bernama Anita Bimoli (CU013) datang ke Bakmi WM
--			dan dilayani oleh staff Maya (SF004)

insert into MsCustomer values
('CU013', 'Anita Bimoli', 'Female', '0859123093', 'anitabimoli@gmail.com', 'Jl. Apel Selatan no.1')
select * from MsCustomer

-- Maya membeli souvenir dan makanan berikut:
-- Botol Minum (SO001) sebanyak 1 buah
-- Fruitilala (ME008) sebanyak 2 porsi

BEGIN TRAN
insert into menuTransactionHeader values
('MT016', 'SF004', 'CU013', '2021-12-12')

select * from menuTransactionHeader

BEGIN TRAN
insert into souvenirTransactionHeader values
('ST017', 'SF004', 'CU013', '2021-12-12')

select * from souvenirTransactionHeader


BEGIN TRAN
insert into menuTransactionDetails values
('MT016', 'ME008', 2)
select * from menuTransactionDetails

BEGIN TRAN
insert into souvenirTransactionDetails values
('ST017', 'SO001', 1)

select * from souvenirTransactionDetails 




