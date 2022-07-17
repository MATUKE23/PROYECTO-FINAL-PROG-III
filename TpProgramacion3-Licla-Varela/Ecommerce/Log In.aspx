<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Log In.aspx.cs" Inherits="Ecommerce.Log_In" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Ingrese su E-Mail&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBoxLogInEmail" runat="server"></asp:TextBox></h2>

    <h2>Ingrese su contraseña <asp:TextBox ID="TextBoxLogInPassword" runat="server"></asp:TextBox> </h2>
    <asp:Button ID="ButtonIniciarSesion" runat="server" Text="Iniciar Sesion" />

</asp:Content>
