<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SISTEMA_MATRICULA.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            width: 158px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin:0 auto; width:300px; margin-top:200px; border:double 1px; border-radius:5px; padding:10px;">
    <table class="verde" style="width:100%">
        <tr>
            <td colspan="2" >               
            <h3 style="text-align:center"> Inicio de Sesión </h3>   
            </td>
        </tr>
        <tr>
            <td >Usuario:</td>
            <td class="auto-style1" >
                <asp:TextBox ID="txtUSER_LOGIN" runat="server" ToolTip="Usuario" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >Contraseña:</td>
            <td class="auto-style1" >
                    <asp:TextBox ID="txtPASSWORD" runat="server" TextMode="Password" 
                    ToolTip="Contraseña" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" > 
                <asp:CheckBox ID="chkPersist" runat="server" Text="Recordar usuario" />
            </td>
        </tr>
        <tr>
            <td colspan="2" >    
                <asp:Button ID="btnSubmit" runat="server" 
                OnClick="btnSubmit_Click" Text="Entrar" Font-Bold="True" Width="100px" />        
            </td>
        </tr>            
    </table>
        <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
