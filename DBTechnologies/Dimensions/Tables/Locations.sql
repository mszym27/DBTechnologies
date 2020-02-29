CREATE TABLE [Dimensions].[Locations] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (150) NOT NULL,
    [City]        NVARCHAR (150) NOT NULL,
    [Street]      NVARCHAR (150) NOT NULL,
    [HouseNumber] NVARCHAR (50)  NOT NULL,
    [HomeNumber]  NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED ([Id] ASC)
);

