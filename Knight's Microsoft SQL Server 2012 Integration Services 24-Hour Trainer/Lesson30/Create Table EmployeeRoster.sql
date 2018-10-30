CREATE TABLE [EmployeeRoster] (
    [EmployeeID] [smallint] IDENTITY(1,1) NOT NULL,
    [LastName] varchar(50),
    [FirstName] varchar(50),
    [OccupationID] smallint,
    [OccupationLabel] varchar(50)
)
