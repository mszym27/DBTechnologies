CREATE TABLE [Dimensions].[SalesReps] (
    [Id]                 INT            IDENTITY (1, 1) NOT NULL,
    [HiringDate]         DATE           NOT NULL,
    [Name]               NVARCHAR (25)  NOT NULL,
    [Surname]            NVARCHAR (50)  NOT NULL,
    [City]               NVARCHAR (150) NOT NULL,
    [Street]             NVARCHAR (150) NOT NULL,
    [HouseNumber]        NVARCHAR (50)  NOT NULL,
    [HomeNumber]         NVARCHAR (50)  NOT NULL,
    [PrivatePhoneNumber] VARCHAR (15)   NOT NULL,
    [PublicPhoneNumber]  VARCHAR (15)   NULL,
    [EmailAdress]        VARCHAR (255)  NULL,
    CONSTRAINT [PK_SalesReps] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SalesReps_Time_HiringDate] FOREIGN KEY ([HiringDate]) REFERENCES [Dimensions].[Time] ([Date])
);

