CREATE TABLE [dbo].[Occupation](
    [OccupationID] [smallint] IDENTITY(1,1) NOT NULL,
    [OccupationLabel] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Occupation_OccupationID] PRIMARY KEY CLUSTERED
(
    [OccupationID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
             
GO
INSERT INTO [dbo].[Occupation] Select 'CUSTOMER SERVICE REPRESENTATIVE'
INSERT INTO [dbo].[Occupation] Select 'SHIFT LEADER'
INSERT INTO [dbo].[Occupation] Select 'ASSISTANT MANAGER'
INSERT INTO [dbo].[Occupation] Select 'STORE MANAGER'
INSERT INTO [dbo].[Occupation] Select 'DISTRICT MANAGER'
INSERT INTO [dbo].[Occupation] Select 'REGIONAL MANAGER'
