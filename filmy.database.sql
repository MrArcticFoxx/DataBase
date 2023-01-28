CREATE DATABASE ProjektKomis
GO 

USE ProjektKomis
GO

-- Create table section -------------------------------

-- Table dbo.dane_pojazdu

CREATE TABLE [dbo].[dane_pojazdu](

IdPojazdu bigint identity(1,1) not null,
Marka Varchar(20) not null,
Model Varchar(20) not null,
Nr_silnika Varchar(20) not null unique,
Rodzaj_nadwozia Varchar(20) not null,
IdStanu Bigint not null,
Cena money not null)
go

-- Add keys for table dbo.dane_pojazdu 

ALTER TABLE [dbo].[dane_pojazdu] ADD CONSTRAINT [PK_DPojazdu] PRIMARY KEY ([IdPojazdu],[IdStanu])
go

-- Table dbo.stan_pojazdu

Create Table [dbo].[Stan_pojazdu] (

IdStanu bigint identity(1,1) not null,
Powypadkowy Varchar(3) default('nie') Check(Powypadkowy ='nie' or Powypadkowy ='tak'),
Rocznik Varchar(4) not null,
Przebieg Char(10) not null)
go

-- Add keys for table dbo.stan_pojazdu 

ALTER TABLE [dbo].[stan_pojazdu] ADD CONSTRAINT [Pk_SPojazdu] PRIMARY KEY ([IdStanu]) 
go 

-- Table dbo.dane_o_sprzedazy

Create Table [dbo].[dane_o_sprzedazy] (

IdPojazdu bigint  not null,
PeselSprzedawcy Char(11) not null unique,
PeselKlienta Char(11) not null unique,
Data_sprzedazy Datetime default(Getdate())) 
go

-- Add keys for table dbo.stan_pojazdu

ALTER TABLE [dbo].[dane_o_sprzedazy] ADD CONSTRAINT [Pk_DoSprzedazy] PRIMARY KEY ([IdPojazdu],[PeselSprzedawcy],[PeselKlienta]) 
go

-- Table dbo.klienci

Create Table [dbo].[klienci] (

PeselKlienta char(11) not null unique,
Nazwisko Varchar(20) not null,
IdKontaktowe Bigint not null,
CONSTRAINT [CheckPopPesel] CHECK (PeselKlienta Like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))  
go

-- Add keys for table dbo.stan_pojazdu

ALTER TABLE [dbo].[klienci] ADD CONSTRAINT [Pk_Klienci] PRIMARY KEY ([IdKontaktowe],[PeselKlienta]) 
go

-- Table dbo.Sprzedawca 

Create Table [dbo].[Sprzedawca] (

PeselSprzedawcy Char(11) unique not null,
Nazwisko Varchar(20) not null, 
IdKontaktowe bigint  not null,
Data_Zatrudnienia Datetime default(Getdate())) 
go

-- Add keys for table dbo.Sprzedawca

ALTER TABLE [dbo].[Sprzedawca] ADD CONSTRAINT [Pk_Sprzedawca] PRIMARY KEY ([PeselSprzedawcy],[IdKontaktowe]) 
go

-- Table dbo.dane_kontaktowe

Create Table [dbo].[dane_kontaktowe] (

IdKontaktowe Bigint identity(1,1) not null,
Miasto Varchar(30) not null,
Ulica Varchar(30) not null,
Nr_domu Varchar(10) not null,
Nr_mieszkania Varchar(10),
Kod_Pocztowy Varchar(6) not null,
Nr_telefonu Char(9) not null,
email Varchar(30) not null,) 

-- Add keys for table dbo.Sprzedawca

ALTER TABLE [dbo].[dane_kontaktowe] ADD CONSTRAINT [Pk_DKontaktowe] PRIMARY KEY ([IdKontaktowe]) 
go


Insert into Stan_pojazdu (Powypadkowy,Rocznik,Przebieg)
Values ('nie','1998',200000),
('tak','2020',25600),
('nie','2015',7500)
GO


Insert into dane_pojazdu (Marka,Model,Nr_silnika,Rodzaj_nadwozia,IdStanu,Cena)
Values ('Fiat','500','K015453XS','hatchback',1,15000),
('Porsche','Panemera','J815453XS','sedan',2,400000),
('Tesla','3','LP15453XS','hatchback',3,200000);
GO

Insert into dane_kontaktowe (Miasto,Kod_Pocztowy,Ulica,Nr_domu,Nr_mieszkania,Nr_telefonu,email)
Values ('Kraków','30-817','Kawiorowa','4b','3','321654987','Kowalski@wp.pl'),
('Warszawa','05-500','Fiołkowa','4','7','987654321','Machlowski@wp.pl'),
('Wrocław','50-004','Podwiązki','5','12','127863498','Burbusz@wp.pl'),
('Kraków','30-987','Niezapominajki','41b','3','347654987','Waaldek@wp.pl'),
('Warszawa','05-100','krwawa','4','17','987659991','Krowinski@wp.pl'),
('Wrocław','50-018','Lizakowa','8','18','987863498','Kwapisz@wp.pl');
GO


Insert into Sprzedawca (PeselSprzedawcy,Nazwisko,IdKontaktowe,Data_Zatrudnienia)
Values ('09242533938','Kowalski',1,'2012-12-15'),
 ('07842533938','Machlowski',2,'2017-12-11'),
 ('09242983938','Burbusz',3,'2022-08-15');
 GO

 Insert into klienci (PeselKlienta,Nazwisko,IdKontaktowe)
 Values ('99234788492','Waldek',4),
 ('00676899412','Krowinski',5),
 ('11118994121','Kwapisz',6);
 GO

 Insert into dane_o_sprzedazy (IdPojazdu,PeselSprzedawcy,PeselKlienta,Data_sprzedazy)
 Values (1,'09242533938','99234788492','2019-12-15'),
 (2,'07842533938','00676899412','2021-04-15'),
 (3,'09242983938','1111899412','2018-02-15');
 