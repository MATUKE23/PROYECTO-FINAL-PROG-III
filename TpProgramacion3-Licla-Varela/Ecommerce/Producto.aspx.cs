﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace Ecommerce
{
    public partial class Producto : System.Web.UI.Page
    {
        public Articulo articulo { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            int id_articulo = int.Parse(Request.QueryString["id_producto"].ToString());
            List<Articulo> lista = (List<Articulo>)Session["ListaArticulos"];
            foreach(Articulo art in lista)
            {
                if (art.ID == id_articulo)
                {
                    articulo = art;
                }
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            List <Articulo> carrito = (List<Articulo>)Session["carritoCompra"];
            Articulo aux = new Articulo();
            aux = articulo;
            aux.CANTIDAD =  int.Parse(txtCantidad.Text);
            carrito.Add(aux);
            Session.Add("carritoCompra", carrito);
        }
    }
}