CREATE TABLE [Dimensions].[Time] (
    [Date]          DATE NOT NULL,
    [DayId]         INT  NOT NULL,
    [MonthId]       INT  NOT NULL,
    [QuarterNumber] INT  NOT NULL,
    [Year]          INT  NOT NULL,
    [IsHoliday]     BIT  NOT NULL,
    CONSTRAINT [PK_DimTime] PRIMARY KEY CLUSTERED ([Date] ASC),
    CONSTRAINT [FK_Time_Days] FOREIGN KEY ([DayId]) REFERENCES [Dimensions].[Days] ([Id]),
    CONSTRAINT [FK_Time_Months] FOREIGN KEY ([MonthId]) REFERENCES [Dimensions].[Months] ([Id])
);

