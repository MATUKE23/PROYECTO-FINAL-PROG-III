using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Negocio;

namespace Negocio
{
    public class UsuarioNegocio
    {
        public bool Loguear(Usuario usuario)
        {

            AccesoaDatos datos = new AccesoaDatos();

            try
            {
                datos.setearConsulta("Select DNI, USUARIO, PASS, TIPO from Usuarios where usuario = @user AND pass = @pass");
                datos.agregarParametro("@user", usuario.User);
                datos.agregarParametro("@pass", usuario.Pass);

                datos.ejecutarLectura();       //Deberia leer una sola vez o nunca
                while (datos.Lector.Read()) // si lee que hay un usuario me devuelve el tipo de usuario , sino return false
                {
                    usuario.DNI = (int)datos.Lector["DNI"];
                    usuario.TipoUsuario = (int)(datos.Lector["TIPO"]) == 2 ? TipoUsuario.Admin : TipoUsuario.Normal;
                    return true;

                }
                return false;// Si no tiene Id
            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                datos.cerrarConexion();
            }




        }
    }

}