<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla.Master" AutoEventWireup="true" CodeBehind="nuevoAlumno.aspx.cs" Inherits="SISTEMA_MATRICULA.nuevoAlumno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1
        {
            width: 229px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset id="fisAlumno" runat="server">
        <legend>
            <asp:Label ID="lblTitulo" runat="server" Text="Registro de Nuevo Alumno"></asp:Label></legend>

        <table style="width: 100%; margin-bottom: 0px;">
            <tr>
                <td class="auto-style1">Nombre</td>
                <td>
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Apellido Paterno</td>
                <td>
                    <asp:TextBox ID="txtApePaterno" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Apellido Materno</td>
                <td>
                    <asp:TextBox ID="txtApeMaterno" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Sexo</td>
                <td>
                    <asp:RadioButtonList ID="rblSexo" runat="server" RepeatDirection="Horizontal" Width="248px">
                        <asp:ListItem Selected="True" Value="M">Masculino</asp:ListItem>
                        <asp:ListItem Value="F">Femenino</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">DNI</td>
                <td>
                    <asp:TextBox ID="txtDNI" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Fecha Nacimiento</td>
                <td>
                    <asp:TextBox ID="txtNacimiento" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Email</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Telefono</td>
                <td>
                    <asp:TextBox ID="txtFono" runat="server" TextMode="Phone"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Carrera Profesional</td>
                <td>
                    <asp:DropDownList ID="ddlCarrera" runat="server" DataSourceID="ldsCarrera" DataTextField="nombre_carrera" DataValueField="idcarrera">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <asp:Button ID="btnRestablecer" runat="server" Text="Restablecer" OnClick="btnRestablecer_Click" />
        <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" />
        <asp:LinqDataSource ID="ldsCarrera" runat="server" ContextTypeName="SISTEMA_MATRICULA.matriculaLINQDataContext" EntityTypeName="" Select="new (idcarrera, nombre_carrera)" TableName="carrera_profesional" Where="estado == @estado">
            <WhereParameters>
                <asp:Parameter DefaultValue="A" Name="estado" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>
        <br />
        <asp:Label ID="lblMensaje" runat="server" Text="       "></asp:Label>
    </fieldset>

</asp:Content>
