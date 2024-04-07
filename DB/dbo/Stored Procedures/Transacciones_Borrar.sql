-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Transacciones_Borrar
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Monto decimal (18,2);
	DECLARE @CuentaID int;
	DECLARE @TipoOperacionId int;

	Select @Monto = Monto, @CuentaID = CuentaId,@TipoOperacionId = cat.TipoOperacionId
	From Transacciones
	inner join Categorias cat
	On cat.Id = Transacciones.CategoriaId
	WHERE Transacciones.Id = @Id;

	DECLARE @FactorMultiplicativo int = 1;

	if(@TipoOperacionId = 2)
		set @FactorMultiplicativo = -1;

	Set @Monto = @Monto * @FactorMultiplicativo;

	Update Cuentas 
	Set Balance -=@Monto
	WHERE Id = @CuentaID;

	DELETE Transacciones WHERE Id = @Id;
END
