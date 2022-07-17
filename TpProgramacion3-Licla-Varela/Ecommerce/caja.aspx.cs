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
    public partial class caja : System.Web.UI.Page
    {
        public List<Articulo> carrito { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            carrito = (List<Articulo>)Session["carritoCompra"];
            DgvCaja.DataSource = carrito;
            DgvCaja.DataBind();
        }

        protected void Agregar1(object sender, EventArgs e)
        {
            int indice = DgvCaja.SelectedRow.RowIndex;
            
            if(carrito[indice].CANTIDAD >= 1)
            {
                carrito[indice].CANTIDAD++;
            }

        }
    }
}