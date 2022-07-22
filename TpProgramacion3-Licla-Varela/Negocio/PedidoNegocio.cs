using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class  PedidoNegocio
    {
        public List<Pedido> Listar()
        {
            List<Pedido> Lista = new List<Pedido>();
            return Lista;


        }

        public List<Pedido> ListarPorCliente(string usuario)
        {
            List<Pedido> Lista = new List<Pedido>();




            return Lista;
        }

        public void AltaPedidoyDetallePedidoSP(Pedido nuevo)
        {
            AccesoaDatos datos = new AccesoaDatos();

            datos.setearSP("AltaPedido");
            datos.setearParametro("@cliente", nuevo.cliente);
            datos.setearParametro("@FormaDePago", nuevo.formaPago);
            datos.setearParametro("@Total", nuevo.Total);
            datos.ejecutarAccion();
        }


    }
}
