using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_MATRICULA
{
    public partial class nuevaMatricula : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            fdsMatricula.Visible = false;
        }

        matriculaLINQDataContext bd = new matriculaLINQDataContext();
        protected void btnMatricula_Click(object sender, EventArgs e)
        {
            int idecar, idsem;
            fdsMatricula.Visible = true;
            try
            {
                idecar = Convert.ToInt32(ddlCarrera.SelectedValue);
                idsem = Convert.ToInt32(ddlSemestre.SelectedValue);
                var xi = bd.SP_LISTA_CURSO_CARRERA(idecar, idsem).ToList();
                int i = 0;
                if (cblCursos.Items.Count <= 0)
                {
                    foreach (var x in xi)
                    {
                        cblCursos.Items.Add("");
                        cblCursos.Items[i].Value = x.idcursos.ToString();
                        cblCursos.Items[i].Text = x.nombre.ToString();
                        i++;
                    }
                }
                else 
                { 
                    cblCursos.ClearSelection();
                    txtDNI.Text = "";
                    txtPago.Text = "";
                    lblMensaje.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = ex.Message;
            }      
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            string login, codigo_pago;
            int idalumno, semestre, idemat,idecur;
            try
            {
                login = Session["USR_LOGIN"].ToString();
                idalumno = Convert.ToInt32(txtDNI.Text);
                semestre = Convert.ToInt32(ddlSemestre.SelectedValue);
                codigo_pago = txtPago.Text;
                var xi = bd.SP_NUEVA_MATRICULA(login, idalumno, semestre, codigo_pago).ToList();
                idemat = Convert.ToInt32(xi.First().ideMat);
                for (int i = 0; i < cblCursos.Items.Count; i++)
                {
                    if (cblCursos.Items[i].Selected)
                    {
                        idecur = Convert.ToInt32(cblCursos.Items[i].Value);
                        bd.SP_MATRICULAR_CURSO(idemat, idecur);
                    }
                }
                lblMensaje.Text = "La matricula fue registrada...";
            }
            catch (Exception ex)
            {
                lblMensaje.Text = ex.Message;
            }            
        }
    }
}