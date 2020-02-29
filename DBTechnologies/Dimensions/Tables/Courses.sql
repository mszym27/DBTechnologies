CREATE TABLE [Dimensions].[Courses] (
    [Id]                     INT             IDENTITY (1, 1) NOT NULL,
    [IsRecrutationStillOpen] BIT             NOT NULL,
    [NumberOfSeats]          INT             NOT NULL,
    [Name]                   NVARCHAR (150)  NOT NULL,
    [Description]            NVARCHAR (4000) NULL,
    [StartDate]              DATE            NOT NULL,
    [EndDate]                DATE            NOT NULL,
    [NumberOfHours]          INT             NOT NULL,
    [LanguageProficencyId]   INT             NOT NULL,
    [IndividualPrice]        DECIMAL (18, 2) NOT NULL,
    CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Courses_LanguageProficency] FOREIGN KEY ([LanguageProficencyId]) REFERENCES [Dimensions].[LanguageProficency] ([Id]),
    CONSTRAINT [FK_Courses_Time_EndDate] FOREIGN KEY ([EndDate]) REFERENCES [Dimensions].[Time] ([Date]),
    CONSTRAINT [FK_Courses_Time_StartDate] FOREIGN KEY ([StartDate]) REFERENCES [Dimensions].[Time] ([Date])
);

