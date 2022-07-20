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
    public partial class Log_In : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                Session.Add("Error", "Primero debes loguearte antes de ingresar");
                Response.Redirect("Error.aspx", false);

            }
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            Usuario usuario;
            UsuarioNegocio negocio = new UsuarioNegocio();

            try
            {
                usuario = new Usuario(TextBoxLogIn.Text, TextBoxLogInPassword.Text, false);
                if (negocio.Loguear(usuario))//valida el logueo
                {//redirigo a la pantalla de logueo 
                    // ACA SE LOGUEA EL USER
                    Session.Add("USUARIO", usuario);//agrego al usuario al sesion
                    Response.Redirect("Default.aspx", false); // SI ES TRUE VA AL ALA PAGINA DEL MENU
                }
                else
                {//sino error y redirigo a pagina de error.
                    Session.Add("error", "Usted a ingresado un Usuario o Password incorrecto");//SI ES INCORRECTO 
                    Response.Redirect("Error.aspx", false);
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}