CREATE TABLE [Dimensions].[LanguageProficency] (
    [Id]            INT             NOT NULL,
    [EuropeanLevel] CHAR (2)        NULL,
    [ENDescription] NVARCHAR (4000) NULL,
    [PLDescription] NVARCHAR (4000) NULL,
    CONSTRAINT [PK_LanguageProficency] PRIMARY KEY CLUSTERED ([Id] ASC)
);

