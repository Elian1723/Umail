using correoElectronico.DataSetUmailTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace correoElectronico.DashboardPages
{
    public partial class Borradores : System.Web.UI.Page
    {
        UsuarioTableAdapter adaptadorUsuario = new UsuarioTableAdapter();
        BorradorTableAdapter adaptadorBorrador = new BorradorTableAdapter();

        protected void CargarCorreos()
        {
            DataTable tablaCorreos = adaptadorBorrador.ObtenerBorradores(Convert.ToInt32(Session["Id"]));

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

        protected void EditarCorreo(int index)
        {
            try
            {
                string email = GridViewCorreos.Rows[index].Cells[3].Text.Trim();
                string asunto = GridViewCorreos.Rows[index].Cells[4].Text.Trim();
                string mensaje = GridViewCorreos.Rows[index].Cells[5].Text.Trim();

                ScriptManager.RegisterStartupScript(this, GetType(), "showModalEditar", $"showModalEditar('{email}', '{asunto}', '{mensaje}');", true);
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
                case "Editar":
                    EditarCorreo(rowIndex);
                    break;
                case "Eliminar":
                    //EliminarCorreo(rowIndex);
                    break;
            }
        }

        protected void GridViewCorreos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Visible = false;
            e.Row.Cells[1].Visible = false;
        }
    }
}