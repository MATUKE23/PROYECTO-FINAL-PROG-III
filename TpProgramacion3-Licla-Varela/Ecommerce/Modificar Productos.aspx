<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Modificar Productos.aspx.cs" Inherits="Ecommerce.Modificar_Productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Modificar Productos</h2>

    
   <%foreach (var arti in ListaArticulos)
                {%>
            <div class="card m-5" style="width: 18rem;">
                <img src="<%=arti.URLIMAGEN%>" class="card-img-top" alt="No Disponible">
                <div class="card-body">
                    <h5 class="card-title"><%=arti.DESCRIPCION%></h5>
                    
                       <asp:Button ID="ButtonModificarImagen" runat="server" Text="Modificar Imagen" />

                      <br />
                      <br />

                        <asp:Button ID="Button1" runat="server" Text="Modificar Texto" />

                </div>
            </div>
            <%}%>

       

</asp:Content>
