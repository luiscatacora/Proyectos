using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_MATRICULA
{
    public partial class nuevoAlumno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        matriculaLINQDataContext bd = new matriculaLINQDataContext();
        void limpiar()
        {
            txtApePaterno.Text = "";
            txtApeMaterno.Text = "";
            txtNombre.Text = "";
            txtDNI.Text = "";
            txtEmail.Text = "";
            txtFono.Text = "";
            txtNacimiento.Text = "";
            rblSexo.SelectedValue = "M";
            ddlCarrera.SelectedValue = "1";
        }
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                string apepaterno, apematerno, nombre, dni, email, tel;
                DateTime fechnac;
                char sex;
                int idcar;
                apepaterno = txtApePaterno.Text;
                apematerno = txtApeMaterno.Text;
                nombre = txtNombre.Text;
                dni = txtDNI.Text;
                email = txtEmail.Text;
                tel = txtFono.Text;
                fechnac = Convert.ToDateTime(txtNacimiento.Text);
                sex = Convert.ToChar(rblSexo.SelectedValue);
                idcar = Convert.ToInt32(ddlCarrera.SelectedValue);
                bd.SP_NUEVO_ALUMNO(apepaterno, apematerno, nombre, sex, dni, fechnac, email, tel, idcar);
                lblMensaje.Text = "Alumno registrado...";
                limpiar();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = ex.Message;
            }
        }

        protected void btnRestablecer_Click(object sender, EventArgs e)
        {
            limpiar();
        }
    }
}