CREATE TABLE [dbo].[TiposCuentas] (
    [id]        INT           IDENTITY (1, 1) NOT NULL,
    [Nombre]    NVARCHAR (50) NOT NULL,
    [UsuarioId] INT           NOT NULL,
    [Orden]     INT           NOT NULL,
    CONSTRAINT [PK_TiposCuentas] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_TiposCuentas_Usuarios] FOREIGN KEY ([UsuarioId]) REFERENCES [dbo].[Usuarios] ([id])
);

