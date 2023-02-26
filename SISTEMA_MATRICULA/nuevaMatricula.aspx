<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla.Master" AutoEventWireup="true" CodeBehind="nuevaMatricula.aspx.cs" Inherits="SISTEMA_MATRICULA.nuevaMatricula" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1
        {
            width: 92px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <legend>Seleccione las Opciones
        </legend>
        Carrera profesional  &nbsp;<asp:DropDownList ID="ddlCarrera" runat="server" DataSourceID="ldsCarrera" DataTextField="nombre_carrera" DataValueField="idcarrera">
        </asp:DropDownList>
        &nbsp;Semestre &nbsp;<asp:DropDownList ID="ddlSemestre" runat="server">
            <asp:ListItem Value="1">Primer Semestre</asp:ListItem>
            <asp:ListItem Value="2">Segundo Semestre</asp:ListItem>
            <asp:ListItem Value="3">Tercer Semestre</asp:ListItem>
            <asp:ListItem Value="4">Cuarto Semestre</asp:ListItem>
            <asp:ListItem Value="5">Quinto Semestre</asp:ListItem>
            <asp:ListItem Value="6">Sexto Semestre</asp:ListItem>
        </asp:DropDownList>
        &nbsp;<asp:Button ID="btnMatricula" runat="server" Text="Iniciar Matricula" OnClick="btnMatricula_Click" />
        <asp:LinqDataSource ID="ldsCarrera" runat="server" ContextTypeName="SISTEMA_MATRICULA.matriculaLINQDataContext" EntityTypeName="" Select="new (idcarrera, nombre_carrera)" TableName="carrera_profesional" Where="estado == @estado">
            <WhereParameters>
                <asp:Parameter DefaultValue="A" Name="estado" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>
    </fieldset>
    <fieldset id="fdsMatricula" runat="server">
        <legend>Matricular Alumno</legend>
        <table style="width: 100%;">
            <tr style="vertical-align: top">
                <td class="auto-style1">DNI</td>
                <td>
                    <asp:TextBox ID="txtDNI" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr  style="vertical-align: top">
                <td class="auto-style1">Codigo Pago</td>
                <td>
                    <asp:TextBox ID="txtPago" runat="server"></asp:TextBox>
                </td>
            </tr>

            <tr  style="vertical-align: top">
                <td class="auto-style1">Cursos</td>
                <td>
                    <asp:CheckBoxList ID="cblCursos" runat="server">
                    </asp:CheckBoxList>
                </td>
            </tr>

        </table>
        <asp:Button ID="btnRegistrar" runat="server" Text="Registrar Matricula" OnClick="btnRegistrar_Click" />
    </fieldset>
    <br />
    <asp:Label ID="lblMensaje" runat="server" Text="       "></asp:Label>

</asp:Content>
