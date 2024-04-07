CREATE TABLE [dbo].[Cuentas] (
    [id]           INT             IDENTITY (1, 1) NOT NULL,
    [Nombre]       NVARCHAR (50)   NOT NULL,
    [TipoCuentaId] INT             NOT NULL,
    [Balance]      DECIMAL (18, 2) NOT NULL,
    [Descripcion]  NVARCHAR (1000) NULL,
    CONSTRAINT [PK_Cuentas] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Cuentas_TiposCuentas] FOREIGN KEY ([TipoCuentaId]) REFERENCES [dbo].[TiposCuentas] ([id])
);

