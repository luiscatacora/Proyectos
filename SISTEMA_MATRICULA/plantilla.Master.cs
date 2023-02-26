using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_MATRICULA
{
    public partial class plantilla : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["USR_ONLINE"]))
            {
                lblUsuario.Text=Session["USR_LOGIN"].ToString();
            }
            else
            { 
                Session.Abandon();
                Response.Redirect("login.aspx");                 
            }
        }

        protected void mnuPrincipal_MenuItemClick(object sender, MenuEventArgs e)
        {
            switch (e.Item.Value) { 
                case "cuenta":
                   break;
                case "usuarios":
                   break;
                case "salir":
                   Session.Abandon();
                   Response.Redirect("login.aspx");
                   break;
                case "inicio":
                   break;
                case "nmatricula":
                   break;
                case "gmatricula":
                   break;
                case "nalumno":
                   break;
                case "galumno":
                   break;
                case "ncurso":
                   break;
                case "gcurso":
                   break;
            }
        }
    }
}