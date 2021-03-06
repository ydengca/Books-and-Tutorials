/****** Create Script for Lesson 37  ******/
--SQL Agent should be running.
USE AdventureWorks2012
GO
--Must be executed by sysadmin.
IF( SELECT is_CDC_enabled from MASTER.SYS.Databases
Where name = 'AdventureWorks2012') = 0
BEGIN
EXEC sys.sp_cdc_enable_db
END
GO
--Must be executed by DBO.
IF( SELECT is_tracked_by_cdc from sys.tables
Where name = 'Lesson37ProductCategorySource') = 1
BEGIN
EXEC sys.sp_cdc_disable_table
@source_schema = N'Production',
@source_name = N'Lesson37ProductCategorySource',
@capture_instance = N'Production_Lesson37ProductCategorySource'
END


IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
	WHERE TABLE_NAME = 'Lesson37ProductCategorySource' AND TABLE_SCHEMA = 'Production') 
	DROP TABLE [Production].[Lesson37ProductCategorySource];
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
	WHERE TABLE_NAME = 'Lesson37ProductCategoryDestination' AND TABLE_SCHEMA = 'Production') 
DROP TABLE [Production].[Lesson37ProductCategoryDestination];
GO
CREATE TABLE [Production].[Lesson37ProductCategorySource](
	[ProductCategoryID] [int] NOT NULL PRIMARY KEY,
	[Name] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [Production].[Lesson37ProductCategoryDestination](
	[ProductCategoryID] [int] NOT NULL PRIMARY KEY,
	[Name] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Deleted Flag] Char(1) NOT NULL DEFAULT 'F'
) ON [PRIMARY]
GO
--Must be executed by DBO.
IF( SELECT is_tracked_by_CDC from sys.tables
Where name = 'Lesson37ProductCategorySource') =0
BEGIN
EXEC sys.sp_cdc_enable_table
@source_schema = N'Production',
@source_name = N'Lesson37ProductCategorySource',
@role_name = NULL,
@supports_net_changes = 1
END
GO
INSERT INTO [Production].[Lesson37ProductCategorySource]
SELECT ProductCategoryID, Name ,ModifiedDate
  FROM [Production].[ProductCategory]
GO

SELECT * FROM [Production].[Lesson37ProductCategorySource]
SELECT * FROM [Production].[Lesson37ProductCategoryDestination]
GO

--ALTER TABLE [Production].[Lesson37ProductCategoryDestination]
--DISABLE CHANGE_TRACKING;

--ALTER TABLE [Production].[Lesson37ProductCategoryDestination]
--ENABLE CHANGE_TRACKING
--WITH (TRACK_COLUMNS_UPDATED = ON)

--exec sys.sp_cdc_disable_db
--Delete from dbo.cdc_states

