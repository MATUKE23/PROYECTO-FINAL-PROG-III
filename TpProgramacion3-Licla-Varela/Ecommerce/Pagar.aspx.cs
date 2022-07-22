using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace Ecommerce
{
    public partial class Pagar : System.Web.UI.Page
    {
        public decimal total { get; set; }
        public List<Articulo> carrito { get; set; } 

        protected void Page_Load(object sender, EventArgs e)
        {
            carrito = (List<Articulo>)Session["carritoCompra"];

            dgvArticulos.DataSource = carrito;
            dgvArticulos.DataBind();

            DbxFormaPago.Items.Add("EFECTIVO");
            DbxFormaPago.Items.Add("TARJETA");
            DbxFormaPago.Items.Add("TRANSFERENCIA");

            total = 0;
            foreach (Articulo aux in carrito)
            {
                total += (aux.CANTIDAD * aux.PRECIO);
            }
        }

        protected void EnviarPedido(object sender, EventArgs e)
        {
            Usuario auxUsuario = new Usuario();
            auxUsuario = (Usuario)Session["usuarioActual"];

            Pedido auxPedido = new Pedido();
            DetallePedido auxDetalle = new DetallePedido();

            auxPedido.usuario = auxUsuario.User;
            auxPedido.formaPago = DbxFormaPago.Text;
            auxPedido.Total = total;

        }
    }
}