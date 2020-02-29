CREATE TABLE [Dimensions].[Companies] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (150) NULL,
    [City]        NVARCHAR (150) NOT NULL,
    [Street]      NVARCHAR (150) NOT NULL,
    [HouseNumber] NVARCHAR (50)  NOT NULL,
    [HomeNumber]  NVARCHAR (50)  NOT NULL,
    [PhoneNumber] VARCHAR (15)   NOT NULL,
    [EmailAdress] VARCHAR (255)  NULL,
    CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED ([Id] ASC)
);

