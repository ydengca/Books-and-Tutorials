/****** Create Script for Lesson 60  ******/
USE [AdventureWorks2012]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
	WHERE TABLE_NAME = 'Lesson60ProductSource' AND TABLE_SCHEMA = 'Production') 
	DROP TABLE [Production].[Lesson60ProductSource];
GO

CREATE TABLE [Production].[Lesson60ProductSource](
	[ProductID] [int]  NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	[ProductNumber] [nvarchar](25) NOT NULL,
	[MakeFlag] [dbo].[Flag] NOT NULL,
	[Color] [nvarchar](15) NULL,
	[ListPrice] [money] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [Lesson60Source_PK_Product_ProductID] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE AdventureWorksDW2012
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
	WHERE TABLE_NAME = 'Lesson60DimProduct' AND TABLE_SCHEMA = 'dbo') 
	DROP TABLE [dbo].[Lesson60DimProduct];
GO
CREATE TABLE [dbo].[Lesson60DimProduct](
	[DWProductID] [int] IDENTITY(1,1) NOT NULL,
	[Business Key ProductID] [int] NOT NULL,
	[Product Name] nvarchar(50) NOT NULL,
	[Product Number] [nvarchar](25) NOT NULL,
	[Make Flag] bit NOT NULL,
	[Color] [nvarchar](15) NULL,
	[List Price] [money] NOT NULL,
	[Modified Date] [datetime] NOT NULL,
	[Effective Start Date] Datetime NOT NULL,
	[Effective End Date] Datetime NULL 
 CONSTRAINT [Lesson60Dest_PK_Product_ProductID] PRIMARY KEY CLUSTERED 
(
	[DWProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE AdventureWorks2012

INSERT INTO [Production].Lesson60ProductSource
(ProductID,Name,ProductNumber,Color,ListPrice,MakeFlag,ModifiedDate)
SELECT ProductID, Name, ProductNumber,Color,ListPrice,MakeFlag , ModifiedDate
FROM .Production.Product 
WHERE ProductID < 5
GO


SELECT * FROM AdventureWorks2012.Production.Lesson60ProductSource
SELECT * FROM AdventureWorksDW2012.dbo.Lesson60DimProduct

GO