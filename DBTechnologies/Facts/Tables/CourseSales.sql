CREATE TABLE [Facts].[CourseSales] (
    [Id]          INT             IDENTITY (1, 1) NOT NULL,
    [CourseId]    INT             NOT NULL,
    [ClientId]    INT             NULL,
    [SalesRepId]  INT             NULL,
    [LocationId]  INT             NOT NULL,
    [Date]        DATE            NOT NULL,
    [Amount]      INT             NOT NULL,
    [TotalNetto]  DECIMAL (18, 2) NULL,
    [TotalBrutto] DECIMAL (18, 2) NULL,
    CONSTRAINT [PK_FactBikeSales] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CourseSales_Clients] FOREIGN KEY ([ClientId]) REFERENCES [Dimensions].[Clients] ([Id]),
    CONSTRAINT [FK_CourseSales_Courses] FOREIGN KEY ([CourseId]) REFERENCES [Dimensions].[Courses] ([Id]),
    CONSTRAINT [FK_CourseSales_Locations] FOREIGN KEY ([LocationId]) REFERENCES [Dimensions].[Locations] ([Id]),
    CONSTRAINT [FK_CourseSales_SalesReps] FOREIGN KEY ([SalesRepId]) REFERENCES [Dimensions].[SalesReps] ([Id]),
    CONSTRAINT [FK_CourseSales_Time] FOREIGN KEY ([Date]) REFERENCES [Dimensions].[Time] ([Date])
);

