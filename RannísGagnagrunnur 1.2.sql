-- Gagnagrunnur fyrir starfsmenn og störf

 --Töflur í gagnagrunni
CREATE TABLE Starfsmaður
(
	ID INT IDENTITY PRIMARY KEY,
	Nafn NVARCHAR(50) NOT NULL,
	[Fæðingardagur] DATE NOT NULL,
	[Hóf störf] DATE NOT NULL,
	Kyn BINARY NOT NULL, -- 0 KVK - 1 KK
	Heimilisfang TEXT,
	Menntun INT, 
	FOREIGN KEY (Menntun) REFERENCES [dbo].['ÍSNÁM2008 á vef 1997-2011$'] ([Fastanúmer Hagstofu]),
)

DROP TABLE Starfsmaður

CREATE TABLE ÍSTARF95
(
	ID INT IDENTITY, 
	Starfanúmer NVARCHAR(255) NOT NULL UNIQUE,
	Starfsheiti NVARCHAR(255) NOT NULL,
	PRIMARY KEY (STARFANÚMER),
)
drop table ÍSTARF95

CREATE TABLE [Staða í skipuriti]
(
	ID INT IDENTITY PRIMARY KEY, 
	Heiti NVARCHAR(255) NOT NULL, 
	Lýsing NVARCHAR(255), 
)
drop table [Staða í skipuriti]

CREATE TABLE Starf
(
	ID INT IDENTITY PRIMARY KEY,
	Starfanúmer NVARCHAR(255) NOT NULL,
	[Staða í skipuriti] INT,
	Menntunarkröfur INT, 
	Deild INT,
	FOREIGN KEY (Starfanúmer) REFERENCES Ístarf95 (Starfanúmer),
	FOREIGN KEY ([Staða í skipuriti]) REFERENCES [dbo].[Staða í skipuriti](ID),
	FOREIGN KEY (Menntunarkröfur) REFERENCES Menntunarstig(Stig),
	FOREIGN KEY (Deild) REFERENCES Deild(ID),
)
drop table starf

CREATE TABLE Menntunarstig
(
	ID INT IDENTITY, 
	Stig INT UNIQUE, 
	Lýsing NVARCHAR(20) NOT NULL,
)
drop table Menntunarstig

Insert into Menntunarstig
values('3', 'Framhaldsskólastig')
Insert into Menntunarstig
values('4', 'Viðbótarstig')
Insert into Menntunarstig
values('5', 'Háskólastig')
Insert into Menntunarstig
values('6', 'Doktorsstig')

CREATE TABLE Hæfni
(
	ID INT IDENTITY PRIMARY KEY, 
	Heiti NVARCHAR(255) NOT NULL, 
	Lýsing NVARCHAR(255),
)



CREATE TABLE Fyrirtæki 
(
	ID INT IDENTITY PRIMARY KEY,
	Heiti NVARCHAR(255) UNIQUE NOT NULL, 
	Iðnaður INT,
	FOREIGN KEY (Iðnaður) REFERENCES [dbo].[ÍSAT2008]([ÍSAT2008_áp]),
)
drop table Fyrirtæki

CREATE TABLE Svið
(
	ID INT IDENTITY PRIMARY KEY, 
	Nafn NVARCHAR(100),
	Fyrirtæki INT NOT NULL,
	FOREIGN KEY (Fyrirtæki) REFERENCES Fyrirtæki(ID),
)

CREATE TABLE Deild
(
	ID INT IDENTITY PRIMARY KEY, 
	Nafn NVARCHAR(100) NOT NULL, 
	Svið INT NOT NULL, 
	FOREIGN KEY (Svið) REFERENCES Svið(ID),
)

CREATE TABLE Umbun
(
	ID INT IDENTITY PRIMARY KEY, 
	Tegund NVARCHAR(255),
	Lýsing NVARCHAR(255),
)

-- TENGI TÖFLUR
CREATE TABLE Hæfnikröfur
(
	ID INT IDENTITY, 
	Starf INT NOT NULL, 
	Hæfni INT NOT NULL, 
	Einkunn INT NOT NULL, 
	FOREIGN KEY (Starf) REFERENCES Starf(ID),
	FOREIGN KEY (Hæfni) REFERENCES Hæfni(ID),
)
drop table Hæfnikröfur

CREATE TABLE [Starfar]
(
	ID INT IDENTITY PRIMARY KEY, 
	Starfsmaður INT, 
	Starf INT, 
	Deild INT, 
	[Dags. ráðningar] DATE NOT NULL, 
	[Dags. starfsloka] DATE, 
	FOREIGN KEY (Starfsmaður) REFERENCES Starfsmaður(ID),
	FOREIGN KEY (Starf) REFERENCES Starf(ID),
)

drop table Starfar

CREATE TABLE [Fær greitt]
(
	ID INT IDENTITY PRIMARY KEY,
	Starfsmaður INT, 
	Umbun INT, 
	Upphæð INT,
	Dagsetning DATE, 
	FOREIGN KEY (Starfsmaður) REFERENCES Starfsmaður(ID), 
	FOREIGN KEY (Umbun) REFERENCES Umbun(ID),
)

--insert into Ístarf95
--Select * FROM ÍSTARF95_2#útgáfa$;