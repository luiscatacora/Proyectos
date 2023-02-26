<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla.Master" AutoEventWireup="true" CodeBehind="gestionarAlumno.aspx.cs" Inherits="SISTEMA_MATRICULA.gestionarAlumno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset id="fdsEdita" runat="server">
        <legend>
            <asp:Label ID="lblTitulo" runat="server" Text="Editar Alumno"></asp:Label></legend>

        <table style="width: 100%; margin-bottom: 0px;">
            <tr>
                <td class="auto-style1">Nombre</td>
                <td>
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                    <asp:HiddenField ID="difcodAlu" runat="server" />
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
                    <asp:TextBox ID="txtNacimiento" runat="server"></asp:TextBox>
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
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click"/>
        <asp:LinqDataSource ID="ldsCarrera" runat="server" ContextTypeName="SISTEMA_MATRICULA.matriculaLINQDataContext" EntityTypeName="" Select="new (idcarrera, nombre_carrera)" TableName="carrera_profesional" Where="estado == @estado">
            <WhereParameters>
                <asp:Parameter DefaultValue="A" Name="estado" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>
        <br />
        
    </fieldset>
    
    <hr /><asp:Label ID="lblMensaje" runat="server" Text="       "></asp:Label>
    <asp:GridView ID="grvAlumnos" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ldsAlumno" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="idalumno" HeaderText="Cod Alum" ReadOnly="True" SortExpression="idalumno" />
            <asp:BoundField DataField="apellido_paterno" HeaderText="Apellido Paterno" ReadOnly="True" SortExpression="apellido_paterno" />
            <asp:BoundField DataField="apellido_materno" HeaderText="Apellido Materno" ReadOnly="True" SortExpression="apellido_materno" />
            <asp:BoundField DataField="nombres" HeaderText="Nombres" ReadOnly="True" SortExpression="nombres" />
            <asp:BoundField DataField="sexo" HeaderText="Sexo" ReadOnly="True" SortExpression="sexo" />
            <asp:BoundField DataField="dni" HeaderText="DNI" ReadOnly="True" SortExpression="dni" />
            <asp:BoundField DataField="fecha_nacimiento" HeaderText="Fecha Nacimiento" ReadOnly="True" SortExpression="fecha_nacimiento" DataFormatString="{0:d}" />
            <asp:BoundField DataField="email" HeaderText="e-mail" ReadOnly="True" SortExpression="email" />
            <asp:BoundField DataField="telefono" HeaderText="Telefono" ReadOnly="True" SortExpression="telefono" />
            <asp:BoundField DataField="idcarrera" HeaderText="ID Carrera" ReadOnly="True" SortExpression="idcarrera" />
            <asp:ButtonField ButtonType="Button" CommandName="Editar" HeaderText="Editar" Text="Editar" />
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
    <asp:LinqDataSource ID="ldsAlumno" runat="server" ContextTypeName="SISTEMA_MATRICULA.matriculaLINQDataContext" EntityTypeName="" Select="new (idalumno, apellido_paterno, apellido_materno, nombres, sexo, dni, fecha_nacimiento, email, telefono, matricula, carrera_profesional, idcarrera)" TableName="alumno">
    </asp:LinqDataSource>    
</asp:Content>
