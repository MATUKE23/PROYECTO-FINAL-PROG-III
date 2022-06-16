using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;


namespace Negocio
{
    public class ArticuloNegocio
    {
        public List<Articulo> listar()
        {
            List<Articulo> lista = new List<Articulo>();
            SqlConnection conexion = new SqlConnection();
            SqlCommand comando = new SqlCommand();
            SqlDataReader lector;

            try
            {
                conexion.ConnectionString = "server=.\\SQLEXPRESS; database=ECOMMERCE; integrated security=true";
                comando.CommandType = System.Data.CommandType.Text;
                comando.CommandText = "SELECT a.Id as id, A.CODIGO,  a.Descripcion dart,  A.PRECIO, A.TIPO, a.OBS, A.ESTADO, a.ID_CATEGORIA IdCategoria from ARTICULOS a";
                comando.Connection = conexion;

                conexion.Open();
                lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.id = (int)lector["id"];
                    aux.codigo = (string)lector["Codigo"];
                    aux.descripcion = (string)lector["dart"];
                    aux.nombre = (string)lector["Nombre"];

                    aux.precio = (decimal)lector["precio"];

                   lista.Add(aux);

                }

                conexion.Close();
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }


        }


    }
}
