-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Transacciones_Actualizar
	@Id int,
	@FechaTransaccion datetime,
	@Monto decimal(18,2),
	@MontoAnterior decimal(18,2),
	@CuentaId int,
	@CuentaAnteriorId int,
	@CategoriaId int,
	@Nota nvarchar(1000) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Revertertir transaccion anterior
	UPDATE Cuentas
	Set Balance -= @MontoAnterior
	Where Id = @CuentaAnteriorId;

	-- Realizar nueva transaccion
	Update Cuentas
	Set Balance += @Monto
	Where Id = @CuentaId;

	UPDATE Transacciones
	SET Monto = ABS(@Monto), FechaTransaccion = @FechaTransaccion,
	CategoriaId = @CategoriaId, CuentaId = @CuentaId, Nota = @Nota
	WHERE Id = @Id
	
END
