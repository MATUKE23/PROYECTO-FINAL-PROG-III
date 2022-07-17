<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="caja.aspx.cs" Inherits="Ecommerce.caja" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <%if (carrito.Count != 0)
            {%>
        <asp:GridView ID="DgvCaja" runat="server" CssClass="table table-dark table-borderless" AutoGenerateColumns="false" HeaderStyle-CssClass="text-center">
            <Columns>
                <asp:BoundField HeaderText="Articulo" DataField="CODIGO" ItemStyle-CssClass="text-center" />
                <asp:BoundField HeaderText="Descripción" DataField="DESCRIPCION" ItemStyle-CssClass="text-center" />
                <asp:BoundField HeaderText="Cantidad" DataField="Cantidad" ItemStyle-CssClass="text-center" />

                <asp:TemplateField ItemStyle-CssClass="text-center">
                    <HeaderTemplate>
                        <p>Acciones</p>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton runat="server"  CssClass="btn btn-dark btn-outline-light" Text="<i class='fa-solid fa-plus'></i>" ToolTip="Agregar una cantidad" OnClick="Agregar1"/>
                        <asp:LinkButton runat="server" CssClass="btn btn-dark btn-outline-light" Text="<i class='fa-solid fa-minus'></i>" ToolTip="Quitar una cantidad" />
                        <asp:LinkButton runat="server" CssClass="btn btn-dark btn-outline-light" Text="<i class='fa-solid fa-xmark'></i>" ToolTip="Quitar todo" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <%}
            else
            { %>
        <h1 class="text-center mt-4">Aun no has añadido artículos al carrito</h1>
        <p class="text-center">Hacé clic <a href="Productos.aspx" class="text-dark">acá</a> para ver los productos.</p>
        <% } %>
        
    </div>
</asp:Content>
