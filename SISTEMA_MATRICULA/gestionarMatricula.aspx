<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla.Master" AutoEventWireup="true" CodeBehind="gestionarMatricula.aspx.cs" Inherits="SISTEMA_MATRICULA.gestionarMatricula" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <legend>Filtro de Matriculas</legend>
        Carrera:
        <asp:DropDownList ID="ddlCarrera" runat="server" DataSourceID="ldsCarrera" DataTextField="nombre_carrera" DataValueField="idcarrera"></asp:DropDownList>
    &nbsp; Fecha Inicio:
        <asp:TextBox ID="txtInicio" runat="server"></asp:TextBox>
&nbsp; Fecha Fin:
        <asp:TextBox ID="txtFin" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="btnListar" runat="server" OnClick="btnListar_Click" Text="Listar Matricula" />
        <asp:LinqDataSource ID="ldsCarrera" runat="server" ContextTypeName="SISTEMA_MATRICULA.matriculaLINQDataContext" EntityTypeName="" Select="new (idcarrera, nombre_carrera)" TableName="carrera_profesional" Where="estado == @estado">
            <WhereParameters>
                <asp:Parameter DefaultValue="A" Name="estado" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>
    </fieldset>
    <fieldset>
        <legend>Lista de Matriculas</legend>
        <asp:GridView ID="grvMatricula" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="grvMatricula_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="iddetalle_matricula" HeaderText="ID" />
                <asp:BoundField DataField="idmatricula" HeaderText="Codigo" />
                <asp:BoundField DataField="dni" HeaderText="DNI" />
                <asp:BoundField DataField="nombres" HeaderText="Nombres y Apellidos" />
                <asp:BoundField DataField="semestre" HeaderText="Semestre" />
                <asp:BoundField DataField="idcursos" HeaderText="ID Curso" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre Curso" />
                <asp:BoundField DataField="fecha_matricula" HeaderText="Fecha" />
                <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Eliminar" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:Label ID="lblMessage" runat="server" Text="       "></asp:Label>
    </fieldset>
</asp:Content>
