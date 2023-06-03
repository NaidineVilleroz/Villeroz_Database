USE [master]
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'EnrollmentDB')
BEGIN
    CREATE DATABASE [EnrollmentDB]
    CONTAINMENT = NONE
    ON PRIMARY
    (NAME = N'EnrollmentDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EnrollmentDB.mdf', SIZE = 8192KB, MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB)
    LOG ON
    (NAME = N'EnrollmentDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EnrollmentDB_log.ldf', SIZE = 8192KB, MAXSIZE = 2048GB, FILEGROWTH = 65536KB)
    WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF;
END
GO

USE [EnrollmentDB]
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Course]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Course] (
        [CourseId] [bigint] IDENTITY(1, 1) NOT NULL,
        [Title] [nvarchar](50) NULL,
        [Credit] [nvarchar](50) NULL,
        CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED ([CourseId] ASC)
    ) ON [PRIMARY];
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enrollment]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Enrollment] (
        [EnrollmentId] [bigint] NOT NULL,
        [CourseId] [bigint] NULL,
        [StudentId] [bigint] NULL,
        [Grade] [int] NULL
    ) ON [PRIMARY];
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Student] (
        [StudentId] [bigint] IDENTITY(1, 1) NOT NULL,
        [Firstname] [nvarchar](50) NULL,
        [Lastname] [nvarchar](50) NULL,
        CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED ([StudentId] ASC)
    ) ON [PRIMARY];
END
GO

-- Course table
INSERT INTO [dbo].[Course] ([Title], [Credit])
VALUES ('Comprogramming', '4 Credits'),
       ('Accounting', '6 Credits'),
       ('P.E', '3 Credits'),
	   ('Purposive Communication', '3 Credits');

-- Student table
INSERT INTO [dbo].[Student] ([Firstname], [Lastname])
VALUES ('Naidine', 'Villeroz'),
       ('Therese Ann', 'Punzalan'),
	   ('Reignan', 'Tamoro'),
       ('Shereece', 'De gula');

-- Enrollment table
INSERT INTO [dbo].[Enrollment] ([EnrollmentId], [CourseId], [StudentId], [Grade])
VALUES (1, 2323, 202201, 90),
       (2, 2424, 202202, 85),
       (3, 2525, 202203, 95),
       (4, 1212, 202204, 88);

SELECT * FROM [dbo].[Course];
SELECT * FROM [dbo].[Student];
SELECT * FROM [dbo].[Enrollment];