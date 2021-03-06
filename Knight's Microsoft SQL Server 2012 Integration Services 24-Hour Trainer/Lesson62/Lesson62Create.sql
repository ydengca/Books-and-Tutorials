/****** Create Script for Lesson 62  ******/
USE [AdventureWorks2012]
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
	WHERE TABLE_NAME = 'Lesson62VoterLoadAudit' AND TABLE_SCHEMA = 'dbo') 
	DROP TABLE [dbo].[Lesson62VoterLoadAudit];
	GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lesson62VoterLoadAudit](
	[LoadID] [int] IDENTITY(1,1) NOT NULL,
	[LoadFile] [varchar](100)   NOT NULL,
	[LoadFileDate] [datetime] NOT NULL,
	[NumberRowsLoaded] [int] NOT NULL,
 CONSTRAINT [PK_VoterLoadAudit] PRIMARY KEY CLUSTERED 
(
	[LoadID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
	WHERE TABLE_NAME = 'Lesson62PetitionData' AND TABLE_SCHEMA = 'dbo') 
	DROP TABLE [dbo].[Lesson62PetitionData];
	GO

CREATE TABLE [dbo].[Lesson62PetitionData](
	[Report_Type] [varchar](50)   NULL,
	[Report_Year] [varchar](50)   NULL,
	[Last_Name] [varchar](50)   NULL,
	[Name_Suffix] [varchar](50)   NULL,
	[First_Name] [varchar](50)   NULL,
	[Middle_Name] [varchar](50)   NULL,
	[Address1] [varchar](50)   NULL,
	[Address2] [varchar](50)   NULL,
	[City] [varchar](50)   NULL,
	[State] [varchar](10)   NULL,
	[Zip] [varchar](5)   NULL,
	[Date] [varchar](50)   NULL,
	[Contributor_Type] [varchar](50)   NULL,
	[Occupation] [varchar](50)   NULL,
	[Contribution_Type] [varchar](50)   NULL,
	[Inkind_Description] [varchar](50)   NULL,
	[Amount] [varchar](50)   NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON