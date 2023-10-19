using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using correoElectronico.DataSetUmailTableAdapters;

namespace correoElectronico
{
    public partial class Dashboard : System.Web.UI.MasterPage
    {
        UsuarioTableAdapter adaptadorUsuario = new UsuarioTableAdapter();
        protected string emailUser;
        protected string userName;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Correo"] != null)
            {
                emailUser = Convert.ToString(Session["Correo"]);

                DataTable datosUsuario = adaptadorUsuario.BuscarUsuario(emailUser);

                string name = char.ToUpper(Convert.ToString(datosUsuario.Rows[0]["nombre"])[0]) + Convert.ToString(datosUsuario.Rows[0]["nombre"]).Substring(1);
                string lastName = char.ToUpper(Convert.ToString(datosUsuario.Rows[0]["apellido"])[0]) + Convert.ToString(datosUsuario.Rows[0]["apellido"]).Substring(1);

                userName = $"{name} {lastName}";

                LabelNombre.Text = userName;
                LabelNombre2.Text = userName;
            }
            else
            {
                Response.Redirect("../Login.aspx");
            }
            TextBoxDestino.Text = null;
            TextBoxAsunto.Text = null;
            TextBoxMensaje.Text = null;
        }

        protected void ButtonEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(TextBoxDestino.Text) && !string.IsNullOrEmpty(TextBoxAsunto.Text) && !string.IsNullOrEmpty(TextBoxDestino.Text))
                {
                    if (adaptadorUsuario.BuscarUsuario(TextBoxDestino.Text).Rows.Count > 0)
                    {
                        string destino = TextBoxDestino.Text;
                        string asunto = TextBoxAsunto.Text;
                        string mensaje = TextBoxMensaje.Text;
                        DateTime fecha = DateTime.Now;



                        ScriptManager.RegisterStartupScript(this, GetType(), "showToastEnviado", "showToastEnviado();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showDestinyNotExist", "showDestinyNotExist();", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showRequiredFields", "showRequiredFields();", true);
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Ocurrió un error inesperado')</script>");
                Response.Write($"<script>alert('{ex.Message}')</script>");
            }
        }

        protected void ButtonCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("../Login.aspx");
        }
    }
}