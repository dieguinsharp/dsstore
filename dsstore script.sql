CREATE TABLE DSS_User (
    [Id]					INT				IDENTITY(1,1)	NOT NULL,
	[Email]					VARCHAR(30)						NOT NULL,
	[Password]				VARCHAR(100)					NOT NULL,
    [Name]					VARCHAR(20)						NOT NULL,
	[LastName]				VARCHAR(30)						NOT NULL,
	[CPF]					CHAR(11)						NOT NULL,
    [Telephone]				CHAR(13)						NOT NULL,
	[AdditionalTelephone]	CHAR(13)						NULL,

	CONSTRAINT [PK_DSS_User] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [UK_DSS_User] UNIQUE NONCLUSTERED ([CPF] ASC)
);

CREATE TABLE DSS_Address (
    Id					INT				IDENTITY(1,1)	NOT NULL,
	IdUser				INT								NOT NULL,
    District			VARCHAR(40)						NOT NULL,
	ZipCode				VARCHAR(8)						NOT NULL,
	HouseNumber			INT								NOT NULL,
	AdditionalAddress	INT								NOT NULL,
	EditedBy			INT								NOT NULL,
	EditedTimestamp		DATETIME2						NOT NULL

	CONSTRAINT [PK_DSS_Address] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_DSS_ADDRESS_DSS_USER] FOREIGN KEY ([IdUser]) REFERENCES [dbo].[DSS_User] ([Id]),
	CONSTRAINT [FK_DSS_ADDRESS_DSS_USER1] FOREIGN KEY ([EditedBy]) REFERENCES [dbo].[DSS_User] ([Id])
);