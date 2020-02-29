CREATE TABLE [Dimensions].[Clients] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [CompanyId]   INT           NULL,
    [Name]        NVARCHAR (50) NOT NULL,
    [Surname]     NVARCHAR (50) NOT NULL,
    [PhoneNumber] VARCHAR (15)  NOT NULL,
    [EmailAdress] VARCHAR (255) NULL,
    CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Clients_Companies] FOREIGN KEY ([CompanyId]) REFERENCES [Dimensions].[Companies] ([Id])
);

