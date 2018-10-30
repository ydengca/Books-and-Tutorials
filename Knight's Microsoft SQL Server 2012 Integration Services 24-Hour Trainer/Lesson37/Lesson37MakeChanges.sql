/****** Make Changes Script for Lesson 37  ******/
USE AdventureWorks2012
GO

--Insert a new row
INSERT INTO [Production].[Lesson37ProductCategorySource](ProductCategoryID, Name, ModifiedDate)
VALUES (5,'New Category','Jun 4, 2012')
GO

--Update Bikes Row
UPDATE [Production].[Lesson37ProductCategorySource]
  SET Name = 'Bikes - Updated',
	  ModifiedDate = 'Jun 3, 2002'
  WHERE ProductCategoryID =1
GO

--Delete Accessories
DELETE [Production].[Lesson37ProductCategorySource]
  WHERE ProductCategoryID =4
GO

SELECT * FROM [Production].[Lesson37ProductCategorySource]
SELECT * FROM [Production].[Lesson37ProductCategoryDestination]
GO