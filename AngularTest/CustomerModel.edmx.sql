
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/08/2016 19:31:51
-- Generated from EDMX file: D:\Users\Lwandle\Desktop\AngularTest\AngularTest\CustomerModel.edmx
-- --------------------------------------------------
CREATE DATABASE CustomerDb
GO

SET QUOTED_IDENTIFIER OFF;
GO
USE [CustomerDb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__PhoneNumb__Custo__2B3F6F97]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PhoneNumber] DROP CONSTRAINT [FK__PhoneNumb__Custo__2B3F6F97];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Customer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customer];
GO
IF OBJECT_ID(N'[dbo].[PhoneNumber]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PhoneNumber];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [CustomerID] int IDENTITY(1,1) NOT NULL,
    [Initials] varchar(40)  NULL,
    [FirstName] varchar(50)  NULL,
    [LastName] varchar(50)  NULL,
    [IDNumber] varchar(20)  NULL,
    [Active] bit  NULL
);
GO

-- Creating table 'PhoneNumbers'
CREATE TABLE [dbo].[PhoneNumbers] (
    [PhoneNumberID] int IDENTITY(1,1) NOT NULL,
    [CustomerID] int  NULL,
    [PhoneCode] varchar(10)  NULL,
    [PhoneNumber1] varchar(20)  NULL,
    [Active] bit  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CustomerID] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([CustomerID] ASC);
GO

-- Creating primary key on [PhoneNumberID] in table 'PhoneNumbers'
ALTER TABLE [dbo].[PhoneNumbers]
ADD CONSTRAINT [PK_PhoneNumbers]
    PRIMARY KEY CLUSTERED ([PhoneNumberID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerID] in table 'PhoneNumbers'
ALTER TABLE [dbo].[PhoneNumbers]
ADD CONSTRAINT [FK__PhoneNumb__Custo__2B3F6F97]
    FOREIGN KEY ([CustomerID])
    REFERENCES [dbo].[Customers]
        ([CustomerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__PhoneNumb__Custo__2B3F6F97'
CREATE INDEX [IX_FK__PhoneNumb__Custo__2B3F6F97]
ON [dbo].[PhoneNumbers]
    ([CustomerID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------