CREATE TABLE [dbo].[Product_OLEDBCommand](
    [ProductID] [smallint] IDENTITY(1,1) NOT NULL,
    [ProductBusinessKey] int,
    [ProductName] [varchar](50) NOT NULL,
    [ListPrice] [money],
    [CurrentFlag] [smallint],
    [RowStartDate] [datetime],
    [RowEndDate] [datetime]
 CONSTRAINT [PK_Product_OLEDBCommand_ProductID] PRIMARY KEY CLUSTERED
(
        [ProductID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
             
GO
INSERT INTO [dbo].[Product_OLEDBCommand] Select 101,
    'Professional Dartboard','49.99','1','1/1/2006',Null
INSERT INTO [dbo].[Product_OLEDBCommand] Select 102,
    'Professional Darts',15.99,1,'1/1/2006',Null
INSERT INTO [dbo].[Product_OLEDBCommand] Select 103,
    'Scoreboard',26.99,1,'1/1/2006',Null
INSERT INTO [dbo].[Product_OLEDBCommand] Select 104,
    'Beginner Dartboard',45.99,1,'1/1/2006',Null
INSERT INTO [dbo].[Product_OLEDBCommand] Select 105,
    'Dart Tips',1.99,1,'1/1/2006',Null
INSERT INTO [dbo].[Product_OLEDBCommand] Select 106,
    'Dart Shafts',7.99,1,'1/1/2006',Null
