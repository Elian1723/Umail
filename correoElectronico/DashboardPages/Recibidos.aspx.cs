using correoElectronico.DataSetUmailTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace correoElectronico.DashboardPages
{
    public partial class Recibidos : System.Web.UI.Page
    {
        UsuarioTableAdapter adaptadorUsuario = new UsuarioTableAdapter();
        IndexadorTableAdapter adaptadorIndexador = new IndexadorTableAdapter();

        protected void CargarCorreos()
        {
            DataTable tablaCorreos = adaptadorIndexador.ObtenerRecibidos(Convert.ToInt32(Session["Id"]));

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

        protected void ToggleLeido(int index)
        {
            try
            {
                if (GridViewCorreos.Rows[index].Cells[2].Text == "False")
                {
                    int idCorreo = Convert.ToInt32(GridViewCorreos.Rows[index].Cells[1].Text);
                    adaptadorIndexador.ToggleLeido(true, Convert.ToInt32(Session["Id"]), idCorreo);
                    ScriptManager.RegisterStartupScript(this, GetType(), "toggleLeido", "showToastLeido();", true);
                }
                else
                {
                    int idCorreo = Convert.ToInt32(GridViewCorreos.Rows[index].Cells[1].Text);
                    adaptadorIndexador.ToggleLeido(false, Convert.ToInt32(Session["Id"]), idCorreo);
                    ScriptManager.RegisterStartupScript(this, GetType(), "showToastNoLeido", "showToastNoLeido();", true);
                }

                CargarCorreos();
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Ocurrió un error inesperado')</script>");
                Response.Write($"<script>alert('{ex.Message}')</script>");
            }
        }

        protected void EliminarCorreo(int index)
        {
            try
            {
                int idCorreo = Convert.ToInt32(GridViewCorreos.Rows[index].Cells[1].Text);
                adaptadorIndexador.ActualizarEstadoPapelera(true, Convert.ToInt32(Session["Id"]), idCorreo);

                CargarCorreos();
                ScriptManager.RegisterStartupScript(this, GetType(), "showToastEliminado", "showToastEliminado();", true);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Ocurrió un error inesperado')</script>");
                Response.Write($"<script>alert('{ex.Message}')</script>");
            }
        }

        protected void ArchivarCorreo(int index)
        {
            try
            {
                int idCorreo = Convert.ToInt32(GridViewCorreos.Rows[index].Cells[1].Text);
                adaptadorIndexador.ActualizarEstadoArchivado(true, Convert.ToInt32(Session["Id"]), idCorreo);

                CargarCorreos();
                ScriptManager.RegisterStartupScript(this, GetType(), "showToastArchivado", "showToastArchivado();", true);
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

                LabelDate.Text = GridViewCorreos.Rows[index].Cells[8].Text;
                LabelOrigen.Text = GridViewCorreos.Rows[index].Cells[4].Text;
                LabelEmail.Text = $"< {usuarioDestino.Rows[0]["correo"].ToString()} >";
                LabelAsunto.Text = GridViewCorreos.Rows[index].Cells[6].Text;
                LabelMensaje.Text = GridViewCorreos.Rows[index].Cells[7].Text;
                LabelIDCorreo.Text = $"ID: {GridViewCorreos.Rows[index].Cells[1].Text}";

                CargarCorreos();
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalCorreo", "showModalCorreo();", true);
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
                case "Leido":
                    ToggleLeido(rowIndex);
                    break;
                case "Eliminado":
                    EliminarCorreo(rowIndex);
                    break;
                case "Ver":
                    VerCorreo(rowIndex);
                    break;
                case "Archivar":
                    ArchivarCorreo(rowIndex);
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

            if (e.Row.Cells[2].Text == "False")
            {
                e.Row.CssClass = "table-active";
            }
        }

        protected void ButtonResponder_Click(object sender, EventArgs e)
        {
            string email = LabelEmail.Text.Replace("<", "");
            email = email.Replace(">", "");
            email = email.Trim();

            string asunto = LabelAsunto.Text.Trim();

            ScriptManager.RegisterStartupScript(this, GetType(), "showModalRedactar", $"showModalRedactar('{email}', '{asunto}');", true);
        }
    }
}