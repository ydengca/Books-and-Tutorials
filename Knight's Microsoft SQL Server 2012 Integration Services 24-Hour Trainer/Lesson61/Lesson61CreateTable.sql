/****** Create Script for Lesson 61  ******/
USE [AdventureWorksDW2012]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
	WHERE TABLE_NAME = 'Lesson61FactFinance' AND TABLE_SCHEMA = 'dbo') 
	DROP TABLE [dbo].[Lesson61FactFinance];
GO
CREATE TABLE [dbo].[Lesson61FactFinance](
	[OrganizationKey] [int] NULL,
	[ScenarioKey] [int] NULL,
	[DepartmentGroupKey] [int] NULL,
	[AccountKey] [int] NULL,
	[DateKey] [int] NULL,
	[Amount] Money NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING ON
GO


