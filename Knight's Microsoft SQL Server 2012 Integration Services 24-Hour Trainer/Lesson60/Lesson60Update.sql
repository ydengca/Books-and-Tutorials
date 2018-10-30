/****** Create Script for Lesson 60  ******/
USE AdventureWorks2012
GO

SELECT * FROM Production.Lesson60ProductSource
SELECT * FROM AdventureWorksDW2012.dbo.Lesson60DimProduct
GO
UPDATE Production.Lesson60ProductSource
SET Color = 'Blue'
WHERE ProductID = 1

UPDATE Production.Lesson60ProductSource
SET ListPrice = $2.00
WHERE ProductID = 2

Delete from Production.Lesson60ProductSource
Where ProductID = 3

USE [AdventureWorks2012]
GO

INSERT INTO [Production].[Lesson60ProductSource]
  ([ProductID] ,[Name] ,[ProductNumber] ,[MakeFlag] ,[Color] ,[ListPrice] ,[ModifiedDate])
     VALUES
  (600,'New Product','NP001',0,'Black',$1.00,'Jan 5, 2012')
GO



SELECT * FROM Production.Lesson60ProductSource
SELECT * FROM AdventureWorksDW2012.dbo.Lesson60DimProduct
GO