<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla.Master" AutoEventWireup="true" CodeBehind="nuevoCurso.aspx.cs" Inherits="SISTEMA_MATRICULA.nuevoCurso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1
        {
            width: 163px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <legend>
            <asp:Label ID="lblTitulo" runat="server" Text="Registro de Nuevo Curso"></asp:Label></legend>

        <table style="width: 100%; margin-bottom: 0px;">
            <tr>
                <td class="auto-style1">Nombre</td>
                <td>
                    <asp:TextBox ID="txtNombre" runat="server" Style="margin-left: 0px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Carrera profesional</td>
                <td>
                    <asp:DropDownList ID="ddlCarrera" runat="server" DataSourceID="LinqDataSource1" DataTextField="nombre_carrera" DataValueField="idcarrera">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Semestre</td>
                <td>
                    <asp:DropDownList ID="ddlSemestre" runat="server">
                        <asp:ListItem Value="1">Primer Semestre</asp:ListItem>
                        <asp:ListItem Value="2">Segundo Semestre</asp:ListItem>
                        <asp:ListItem Value="3">Tercer Semestre</asp:ListItem>
                        <asp:ListItem Value="4">Cuarto Semestre</asp:ListItem>
                        <asp:ListItem Value="5">Quinto Semestre</asp:ListItem>
                        <asp:ListItem Value="6">Sexto Semestre</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Descripcion</td>
                <td>
                    <asp:TextBox ID="txtDescripcion" runat="server" Height="51px" TextMode="MultiLine" Width="257px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:Button ID="btnRestablecer" runat="server" Text="Restablecer" OnClick="btnRestablecer_Click" />
        <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" />
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="SISTEMA_MATRICULA.matriculaLINQDataContext" EntityTypeName="" Select="new (idcarrera, nombre_carrera)" TableName="carrera_profesional" Where="estado == @estado">
            <WhereParameters>
                <asp:Parameter DefaultValue="A" Name="estado" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource><br />
        <asp:Label ID="lblMensaje" runat="server" Text="       "></asp:Label>
    </fieldset>
</asp:Content>
