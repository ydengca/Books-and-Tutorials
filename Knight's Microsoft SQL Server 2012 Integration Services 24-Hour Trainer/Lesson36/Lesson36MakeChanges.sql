/****** Make Changes Script for Lesson 36  ******/
USE AdventureWorks2012
GO
SELECT * FROM [Production].[Lesson36ProductCategorySource]
SELECT * FROM [Production].[Lesson36ProductCategoryDestination]
GO

--Insert a new row
INSERT INTO [Production].[Lesson36ProductCategorySource](ProductCategoryID, Name, ModifiedDate)
VALUES (5,'New Category','Jun 4, 2012')
GO

--Update Bikes Row
UPDATE [Production].[Lesson36ProductCategorySource]
  SET Name = 'Bikes - Updated',
	  ModifiedDate = 'Jun 3, 2002'
  WHERE ProductCategoryID =1
GO

--Delete Accessories
DELETE [Production].[Lesson36ProductCategorySource]
  WHERE ProductCategoryID =4
GO

SELECT * FROM [Production].[Lesson36ProductCategorySource]
SELECT * FROM [Production].[Lesson36ProductCategoryDestination]
GO