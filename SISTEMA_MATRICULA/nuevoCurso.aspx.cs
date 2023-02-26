using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_MATRICULA
{
    public partial class nuevoCurso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        matriculaLINQDataContext bd = new matriculaLINQDataContext();
        void limpiar()
        {
            txtNombre.Text = "";
            ddlCarrera.SelectedValue = "1";
            ddlSemestre.SelectedValue = "1";
            txtDescripcion.Text = "";
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                string nombre = txtNombre.Text;
                string obs = txtDescripcion.Text;
                int idecar = Convert.ToInt32(ddlCarrera.SelectedValue);
                int semestre = Convert.ToInt32(ddlSemestre.SelectedValue);
                bd.SP_NUEVO_CURSO(nombre, idecar, semestre, obs);
                lblMensaje.Text = "El curso fue registrado correctamente ";
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