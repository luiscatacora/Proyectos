using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_MATRICULA
{
    public partial class gestionarAlumno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            fdsEdita.Visible = false;
        }
        matriculaLINQDataContext bd = new matriculaLINQDataContext();
        void listar_alumno()
        {

        }

        bool eliminar(int ide)
        {
            try
            {
                var xi = (from x in bd.alumno
                          where x.idalumno == ide
                          select x).ToList();
                bd.alumno.DeleteAllOnSubmit(xi);
                bd.SubmitChanges();
                return (true);
            }
            catch (Exception ex)
            {
                lblMensaje.Text = ex.Message;
                return (false);
            }            
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Editar" || e.CommandName == "Eliminar")
                {
                    lblMensaje.Text = "";
                    int indice = Convert.ToInt32(e.CommandArgument);
                    int ide = Convert.ToInt32(grvAlumnos.Rows[indice].Cells[0].Text);
                    if (e.CommandName == "Editar")
                    {
                        difcodAlu.Value = ide.ToString();
                        txtApePaterno.Text = grvAlumnos.Rows[indice].Cells[1].Text;
                        txtApeMaterno.Text=grvAlumnos.Rows[indice].Cells[2].Text;
                        txtNombre.Text = grvAlumnos.Rows[indice].Cells[3].Text;
                        txtDNI.Text = grvAlumnos.Rows[indice].Cells[5].Text;
                        txtEmail.Text = grvAlumnos.Rows[indice].Cells[7].Text;
                        txtFono.Text = grvAlumnos.Rows[indice].Cells[8].Text;
                        txtNacimiento.Text = grvAlumnos.Rows[indice].Cells[6].Text;
                        rblSexo.SelectedValue = grvAlumnos.Rows[indice].Cells[4].Text;
                        ddlCarrera.SelectedValue = grvAlumnos.Rows[indice].Cells[9].Text;
                        fdsEdita.Visible = true;                        
                        //lblMensaje.Text = grvAlumnos.Rows[indice].Cells[6].Text;
                    }
                    if (e.CommandName == "Eliminar")
                    {
                        if (eliminar(ide))
                        {
                            lblMensaje.Text = "Alumno <b>" + ide + "</b> Eliminado correctamente";
                            grvAlumnos.DataBind();
                        }
                        else
                        {
                            lblMensaje.Text = "Error al Eliminar..!!!";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = ex.Message;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            fdsEdita.Visible = false;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string apepaterno, apematerno, nombre, dni, email, tel;
            DateTime fechnac;
            char sex;
            int idcar,idealu;
            apepaterno = txtApePaterno.Text;
            apematerno = txtApeMaterno.Text;
            nombre = txtNombre.Text;
            dni = txtDNI.Text;
            email = txtEmail.Text;
            tel = txtFono.Text;
            fechnac = Convert.ToDateTime(txtNacimiento.Text);
            sex = Convert.ToChar(rblSexo.SelectedValue);
            idcar = Convert.ToInt32(ddlCarrera.SelectedValue);
            idealu =  Convert.ToInt32(difcodAlu.Value);
            bd.SP_EDITAR_ALUMNO(apepaterno, apematerno, nombre, sex, dni, fechnac, email, tel, idcar, idealu);
            grvAlumnos.DataBind();
            lblMensaje.Text = "Alumno Actualizado...";
        }
    }
}