<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla.Master" AutoEventWireup="true" CodeBehind="gestionarCurso.aspx.cs" Inherits="SISTEMA_MATRICULA.gestionarCurso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%;">
        <tr style="vertical-align:top">
            <td>
                <fieldset>
                    <legend>
                        <asp:Label ID="lblTitulo" runat="server" Text="Gestionar Carrera Profesional"></asp:Label></legend>

                    Seleccione Carrera
        <asp:DropDownList ID="ddlCarrera" runat="server" DataSourceID="ldsCarrera" DataTextField="nombre_carrera" DataValueField="idcarrera">
        </asp:DropDownList>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Gestionar Cursos" />
                    <asp:GridView ID="grvCursos" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="grvCursos_RowCommand">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="idcursos" HeaderText="Codigo" />
                            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                            <asp:BoundField DataField="semestre" HeaderText="Semestre" />
                            <asp:BoundField DataField="obs" HeaderText="Descripcion" />
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
                    <asp:HiddenField ID="hifIde" runat="server" />
                    <asp:LinqDataSource ID="ldsCarrera" runat="server" ContextTypeName="SISTEMA_MATRICULA.matriculaLINQDataContext" EntityTypeName="" Select="new (idcarrera, nombre_carrera)" TableName="carrera_profesional" Where="estado == @estado">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="A" Name="estado" Type="Char" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                    <asp:Label ID="lblMessage" runat="server" Text="            "></asp:Label>

                </fieldset>
            </td>
            <td>
                <fieldset id="fdsEdita" runat="server">
                    <legend>
                        <asp:Label ID="Label1" runat="server" Text="Editar Curso"></asp:Label></legend>

                    <table style="width: 100%; margin-bottom: 0px;">
                        <tr>
                            <td class="auto-style1">Codigo</td>
                            <td>
                                <asp:TextBox ID="txtCodigo" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Nombre</td>
                            <td>
                                <asp:TextBox ID="txtNombre" runat="server" Style="margin-left: 0px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Carrera profesional</td>
                            <td>
                                <asp:DropDownList ID="ddlCarrerau" runat="server" DataSourceID="ldsCarrera" DataTextField="nombre_carrera" DataValueField="idcarrera">
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
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click"/>
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click"/>
                    <br />
                    <asp:Label ID="lblMensaje" runat="server" Text="       "></asp:Label>
                </fieldset>
            </td>

        </tr>
    </table>

</asp:Content>
