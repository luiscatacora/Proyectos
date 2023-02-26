using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_MATRICULA
{
    public partial class gestionarCurso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            fdsEdita.Visible = false;
        }

        matriculaLINQDataContext bd = new matriculaLINQDataContext();
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int idecar = Convert.ToInt32(ddlCarrera.SelectedValue);
                listar_curso(idecar);
                hifIde.Value = idecar.ToString();
                lblMessage.Text = "";
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        void listar_curso(int idecar)
        {
            var xi = bd.SP_LISTA_CURSO_CARRERA(idecar,0).ToList();
            grvCursos.DataSource = xi;
            grvCursos.DataBind();
        }

        bool eliminar(int ide)
        {
            try
            {
                var xi = (from x in bd.cursos
                          where x.idcursos == ide
                          select x).ToList();
                bd.cursos.DeleteAllOnSubmit(xi);
                bd.SubmitChanges();
                return (true);
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
                return (false);
            }
        }

        protected void grvCursos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Editar" || e.CommandName == "Eliminar")
                {
                    int indice = Convert.ToInt32(e.CommandArgument);
                    int ide = Convert.ToInt32(grvCursos.Rows[indice].Cells[0].Text);
                    if (e.CommandName == "Editar")
                    {
                        fdsEdita.Visible = true;
                        txtCodigo.Text = ide.ToString();
                        txtNombre.Text = grvCursos.Rows[indice].Cells[1].Text;
                        ddlCarrerau.SelectedValue = hifIde.Value;
                        ddlSemestre.SelectedValue = grvCursos.Rows[indice].Cells[2].Text;
                        txtDescripcion.Text = grvCursos.Rows[indice].Cells[3].Text;                    
                    }
                    if (e.CommandName == "Eliminar")
                    {
                        if (eliminar(ide))
                        {
                            lblMessage.Text = "cursos <b>" + ide + "</b> Eliminado correctamente";
                            int idecar = Convert.ToInt32(ddlCarrera.SelectedValue);
                            listar_curso(idecar);
                        }
                        else
                        {
                            lblMessage.Text = "Error al Eliminar..!!!";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                int	ide ,idecar,semes;
	            string nom,desc;
                ide = Convert.ToInt32(txtCodigo.Text);
                nom = txtNombre.Text;
                idecar = Convert.ToInt32(ddlCarrerau.SelectedValue);
                semes = Convert.ToInt32(ddlSemestre.SelectedValue);
                desc = txtDescripcion.Text;
                bd.SP_EDTAR_CURSO(ide,nom,idecar,semes,desc);
                listar_curso(idecar);
                lblMessage.Text = "El Curso fue actualizado...";
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            fdsEdita.Visible = false;
        }
    }
}