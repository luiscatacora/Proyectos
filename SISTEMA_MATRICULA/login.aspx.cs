using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_MATRICULA
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        matriculaLINQDataContext bd = new matriculaLINQDataContext();
        private bool fnLogin(string prmUserLogin, string prmPassword)
        {
            bool _return = false;
            try
            {
                var xi = bd.SP_LOGIN(prmUserLogin, prmPassword).ToList();
                if (xi.Count() > 0)
                {
                    Session.Add("USR_LOGIN", xi.First().login.ToString());
                    Session.Add("USR_TIPO", xi.First().tipo.ToString());
                    Session.Add("USR_ONLINE", true);
                    _return = true;
                }
                else
                {
                    lblMensaje.Text = "Nombre de usuario o contraseña incorrectos";
                    _return = false;
                }
                return (_return);

            }
            catch (Exception ex)
            {
                lblMensaje.Text = ex.Message;
                return (false);
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "";
            if (fnLogin(txtUSER_LOGIN.Text, txtPASSWORD.Text))
            {
                //correcto           
                FormsAuthentication.RedirectFromLoginPage(txtUSER_LOGIN.Text, chkPersist.Checked);
            }
        }
    }
}