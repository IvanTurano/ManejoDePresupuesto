CREATE TABLE [dbo].[Categorias] (
    [id]              INT           IDENTITY (1, 1) NOT NULL,
    [Nombre]          NVARCHAR (50) NOT NULL,
    [TipoOperacionId] INT           NOT NULL,
    [UsuarioId]       INT           NOT NULL,
    CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Categorias_Categorias] FOREIGN KEY ([UsuarioId]) REFERENCES [dbo].[Usuarios] ([id]),
    CONSTRAINT [FK_Categorias_TiposOperaciones] FOREIGN KEY ([TipoOperacionId]) REFERENCES [dbo].[TiposOperaciones] ([Id])
);

