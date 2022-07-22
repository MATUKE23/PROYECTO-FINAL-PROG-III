using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    class PedidoNegocio
    {
        public List<DetallePedido> Listar()
        {
            List<DetallePedido> Lista = new List<DetallePedido>();
            return Lista;
        }

        public List<DetallePedido> ListarPorCliente(string usuario)
        {
            List<DetallePedido> Lista = new List<DetallePedido>();
            return Lista;
        }
    }
}
