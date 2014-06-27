-- Gagnagrunnur fyrir starfsmenn og st�rf

 --T�flur � gagnagrunni
CREATE TABLE Starfsma�ur
(
	ID INT IDENTITY PRIMARY KEY,
	Nafn NVARCHAR(50) NOT NULL,
	[F��ingardagur] DATE NOT NULL,
	[H�f st�rf] DATE NOT NULL,
	Kyn BINARY NOT NULL, -- 0 KVK - 1 KK
	Heimilisfang TEXT,
	Menntun INT, 
	FOREIGN KEY (Menntun) REFERENCES [dbo].['�SN�M2008 � vef 1997-2011$'] ([Fastan�mer Hagstofu]),
)

DROP TABLE Starfsma�ur

CREATE TABLE �STARF95
(
	ID INT IDENTITY, 
	Starfan�mer NVARCHAR(255) NOT NULL UNIQUE,
	Starfsheiti NVARCHAR(255) NOT NULL,
	PRIMARY KEY (STARFAN�MER),
)
drop table �STARF95

CREATE TABLE [Sta�a � skipuriti]
(
	ID INT IDENTITY, 
	Heiti NVARCHAR(255) NOT NULL, 
	L�sing NVARCHAR(255), 
)

CREATE TABLE Starf
(
	ID INT IDENTITY PRIMARY KEY,
	Starfan�mer NVARCHAR(255) NOT NULL,
	[Sta�a � skipuriti] INT,
	Menntunarkr�fur INT, 
	Deild INT,
	FOREIGN KEY (Starfan�mer) REFERENCES �starf95 (Starfan�mer),
	FOREIGN KEY (Menntunarkr�fur) REFERENCES Menntunarstig(Stig),
	FOREIGN KEY (Deild) REFERENCES Deild(ID),
)
drop table starf

CREATE TABLE Menntunarstig
(
	ID INT IDENTITY, 
	Stig INT UNIQUE, 
	L�sing NVARCHAR(20) NOT NULL,
)
drop table Menntunarstig

Insert into Menntunarstig
values('3', 'Framhaldssk�lastig')
Insert into Menntunarstig
values('4', 'Vi�b�tarstig')
Insert into Menntunarstig
values('5', 'H�sk�lastig')
Insert into Menntunarstig
values('6', 'Doktorsstig')

CREATE TABLE H�fni
(
	ID INT IDENTITY PRIMARY KEY, 
	Heiti NVARCHAR(255) NOT NULL, 
	L�sing NVARCHAR(255),
)

CREATE TABLE H�fnikr�fur
(
	ID INT IDENTITY, 
	Starf INT NOT NULL, 
	H�fni INT NOT NULL, 
	Einkunn INT NOT NULL, 
	FOREIGN KEY (Starf) REFERENCES Starf(ID),
	FOREIGN KEY (H�fni) REFERENCES H�fni(ID),
)
drop table H�fnikr�fur

CREATE TABLE Fyrirt�ki 
(
	ID INT IDENTITY PRIMARY KEY,
	Heiti NVARCHAR(255) UNIQUE NOT NULL, 
	I�na�ur INT,
	FOREIGN KEY (I�na�ur) REFERENCES [dbo].[�SAT2008]([�SAT2008_�p]),
)
drop table Fyrirt�ki

CREATE TABLE Svi�
(
	ID INT IDENTITY PRIMARY KEY, 
	Nafn NVARCHAR(100),
	Fyrirt�ki INT NOT NULL,
	FOREIGN KEY (Fyrirt�ki) REFERENCES Fyrirt�ki(ID),
)

CREATE TABLE Deild
(
	ID INT IDENTITY PRIMARY KEY, 
	Nafn NVARCHAR(100) NOT NULL, 
	Svi� INT NOT NULL, 
	FOREIGN KEY (Svi�) REFERENCES Svi�(ID),
)

CREATE TABLE Umbun
(
	ID INT IDENTITY PRIMARY KEY, 
	Tegund NVARCHAR(255),
	L�sing NVARCHAR(255),
)

-- TENGI T�FLUR

CREATE TABLE [Starfar]
(
	ID INT IDENTITY PRIMARY KEY, 
	Starfsma�ur INT, 
	Starf INT, 
	Deild INT, 
	[Dags. r��ningar] DATE NOT NULL, 
	[Dags. starfsloka] DATE, 
	FOREIGN KEY (Starfsma�ur) REFERENCES Starfsma�ur(ID),
	FOREIGN KEY (Starf) REFERENCES Starf(ID),
)



--insert into �starf95
--Select * FROM �STARF95_2#�tg�fa$;