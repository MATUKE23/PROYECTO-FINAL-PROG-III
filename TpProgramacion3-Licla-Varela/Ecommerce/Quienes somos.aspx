﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Quienes somos.aspx.cs" Inherits="Ecommerce.Quienes_somos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1>Quienes somos</h1>
    <br />

    <asp:Label ID="LabelQuienesSomos" runat="server" Text="Somos un emprendimiento familiar. 
        Comenzamos con este proyecto en 2009. Nuestro primer producto fue un biombo en esterilla de junco.
        Con el tiempo fuimos evolucionando para adaptarnos a los pedidos de nuestros clientes.
        Mutando hasta alcanzar una amplia variedad de productos.
        Tenemos nuestro taller de trabajo en Benavidez, partido de Tigre. Los invitamos a recorrer la página y ver nuestros productos.
        Son bienvenidos!
"></asp:Label>
     
    <br />
    <br />
    
    <h1>Mision</h1>
    <br />
    <asp:Label ID="LabelMision" runat="server" Text="Dar al cliente el mejor servicio y variedad, calidad y valor de productos."></asp:Label>
    
    <br />
    <br />
    
    <h1>Vision</h1>
    <asp:Label ID="LabelVision" runat="server" Text="Trabajamos en ser los lideres indiscutidos en la produccion de biombos de madera en terminos de precio-calidad."></asp:Label>
</asp:Content>
