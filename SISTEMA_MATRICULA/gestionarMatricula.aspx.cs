using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_MATRICULA
{
    public partial class gestionarMatricula : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        matriculaLINQDataContext bd = new matriculaLINQDataContext();
        void listar()
        {
            int idecar;
            DateTime inicio, fin;
            idecar = Convert.ToInt32(ddlCarrera.SelectedValue);
            inicio = Convert.ToDateTime(txtInicio.Text);
            fin = Convert.ToDateTime(txtFin.Text);
            var xi = bd.SP_LISTA_MATRICULA(idecar, inicio, fin).ToList();
            grvMatricula.DataSource = xi;
            grvMatricula.DataBind();        
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            listar();
        }

        bool eliminar(int ide)
        {
            try
            {
                var xi = (from x in bd.detalle_matricula
                          where x.iddetalle_matricula == ide
                          select x).ToList();
                bd.detalle_matricula.DeleteAllOnSubmit(xi);
                bd.SubmitChanges();
                listar();
                return (true);
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
                return (false);
            }
        }

        protected void grvMatricula_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Editar" || e.CommandName == "Eliminar")
                {
                    int indice = Convert.ToInt32(e.CommandArgument);
                    int ide = Convert.ToInt32(grvMatricula.Rows[indice].Cells[0].Text);
                    if (e.CommandName == "Eliminar")
                    {
                        if (eliminar(ide))
                        {
                            eliminar(ide);
                            lblMessage.Text = "cursos <b>" + ide + "</b> Eliminado correctamente";  
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
    }
}