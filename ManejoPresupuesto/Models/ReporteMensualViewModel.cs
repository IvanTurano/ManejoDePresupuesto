namespace ManejoPresupuesto.Models
{
    public class ReporteMensualViewModel
    {
        public IEnumerable<ResultadoObtenerPorMes> TransaccionesPorMes { get; set; }
        public decimal Ingresos => TransaccionesPorMes.Sum(x => x.Ingreso);
        public decimal Gastos => TransaccionesPorMes.Sum(_ => _.Ingreso);
        public decimal Total => Ingresos - Gastos;
        public int Año {  get; set; }
    }
}
