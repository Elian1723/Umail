using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using correoElectronico.DataSetUmailTableAdapters;

namespace correoElectronico.DashboardPages
{
    public partial class Eliminados : System.Web.UI.Page
    {
        IndexadorTableAdapter adaptadorIndexador = new IndexadorTableAdapter();
        UsuarioTableAdapter adaptadorUsuario = new UsuarioTableAdapter();

        protected void CargarCorreos()
        {
            DataTable tablaCorreos = adaptadorIndexador.ObtenerPapelera(Convert.ToInt32(Session["Id"]));

            if (tablaCorreos.Rows.Count > 0)
            {
                ImgEmpty.Visible = false;
                GridViewContainer.Visible = true;
                GridViewCorreos.DataSource = tablaCorreos;
                GridViewCorreos.DataBind();
            }
            else
            {
                ImgEmpty.Visible = true;
                GridViewContainer.Visible = false;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            CargarCorreos();
        }

        protected void SacarCorreo(int index)
        {
            try
            {
                int idCorreo = Convert.ToInt32(GridViewCorreos.Rows[index].Cells[1].Text);
                adaptadorIndexador.ActualizarEstadoPapelera(false, Convert.ToInt32(Session["Id"]), idCorreo);
                ScriptManager.RegisterStartupScript(this, GetType(), "showToastFueraPapelera", "showToastFueraPapelera();", true);

                CargarCorreos();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Ocurrió un error inesperado')</script>");
                Response.Write($"<script>alert('{ex.Message}')</script>");
            }
        }

        protected void VerCorreo(int index)
        {
            try
            {
                if (GridViewCorreos.Rows[index].Cells[2].Text == "False")
                {
                    int idCorreo = Convert.ToInt32(GridViewCorreos.Rows[index].Cells[1].Text);
                    adaptadorIndexador.ToggleLeido(true, Convert.ToInt32(Session["Id"]), idCorreo);
                }

                DataTable usuarioDestino = adaptadorUsuario.BuscarUsuarioPorId(Convert.ToInt32(GridViewCorreos.Rows[index].Cells[0].Text));
                DataTable grupoCorreo = adaptadorIndexador.BuscarIndexador(Convert.ToInt32(Session["Id"]), Convert.ToInt32(GridViewCorreos.Rows[index].Cells[1].Text));

                LabelGrupo.Text = "Origen: ";

                if (grupoCorreo.Rows[0]["archivado"].ToString() == "True")
                {
                    LabelGrupo.Text += "Archivados";
                }
                else if (grupoCorreo.Rows[0]["recibido"].ToString() == "True")
                {
                    LabelGrupo.Text += "Recibidos";
                }
                else if (grupoCorreo.Rows[0]["enviado"].ToString() == "True")
                {
                    LabelGrupo.Text += "Enviados";
                }
                else
                {
                    LabelGrupo.Text += "Desconocido";
                }


                LabelDate.Text = GridViewCorreos.Rows[index].Cells[8].Text;
                LabelOrigen.Text = GridViewCorreos.Rows[index].Cells[4].Text;
                LabelEmail.Text = $"< {usuarioDestino.Rows[0]["correo"].ToString()} >";
                LabelAsunto.Text = GridViewCorreos.Rows[index].Cells[6].Text;
                LabelMensaje.Text = GridViewCorreos.Rows[index].Cells[7].Text;
                LabelIDCorreo.Text = $"ID: {GridViewCorreos.Rows[index].Cells[1].Text}";


                ScriptManager.RegisterStartupScript(this, GetType(), "showModalCorreo", "showModalCorreo();", true);
                CargarCorreos();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Ocurrió un error inesperado')</script>");
                Response.Write($"<script>alert('{ex.Message}')</script>");
            }
        }

        protected void EliminarDefinitivamente(int idCorreo)
        {
            try
            {
                adaptadorIndexador.EliminarIndexador(Convert.ToInt32(Session["Id"]), idCorreo);

                if (adaptadorIndexador.BuscarIndexadorGeneral(idCorreo).Rows.Count <= 0)
                {
                    adaptadorIndexador.EliminarCorreo(idCorreo);
                }

                ScriptManager.RegisterStartupScript(this, GetType(), "showToastEliminadoDefinitivo", "showToastEliminadoDefinitivo();", true);

                CargarCorreos();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Ocurrió un error inesperado')</script>");
                Response.Write($"<script>alert('{ex.Message}')</script>");
            }
        }

        protected void GridViewCorreos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            switch (e.CommandName)
            {
                case "Sacar":
                    SacarCorreo(rowIndex);
                    break;
                case "Ver":
                    VerCorreo(rowIndex);
                    break;
                case "Eliminar":
                    EliminarDefinitivamente(Convert.ToInt32(GridViewCorreos.Rows[rowIndex].Cells[1].Text));
                    break;
            }
        }

        protected void GridViewCorreos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[4].Text += " " + e.Row.Cells[5].Text;

            e.Row.Cells[5].Visible = false;
            e.Row.Cells[0].Visible = false;
            e.Row.Cells[1].Visible = false;
            e.Row.Cells[2].Visible = false;
        }

        protected void ButtonEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                EliminarDefinitivamente(Convert.ToInt32(LabelIDCorreo.Text.Replace("ID: ", "")));

                CargarCorreos();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Ocurrió un error inesperado')</script>");
                Response.Write($"<script>alert('{ex.Message}')</script>");
            }
        }
    }
}