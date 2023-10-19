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
    public partial class Login : System.Web.UI.Page
    {
        UsuarioTableAdapter adaptadorUsuario = new UsuarioTableAdapter();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Correo"] != null)
                Response.Redirect("./DashboardPages/Recibidos.aspx");

            TextBoxEmail.Focus();
        }

        protected void ButtonIniciarSesion_Click(object sender, EventArgs e)
        {
            string userEmail = TextBoxEmail.Text;
            string password = TextBoxPassword.Text;

            if (!string.IsNullOrEmpty(userEmail) && !string.IsNullOrEmpty(password))
            {
                try
                {
                    DataTable datosUsuario = adaptadorUsuario.BuscarUsuario(userEmail);
                    if (datosUsuario.Rows.Count > 0)
                    {
                        string a = Convert.ToString(datosUsuario.Rows[0]["contrasena"]).Trim();
                        int b = a.Length + password.Length;
                        if (a == password)
                        {
                            Session["Correo"] = userEmail;
                            Session.Timeout = 10080;
                            Response.Redirect("./DashboardPages/Recibidos.aspx");
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "showUserIncorrect", "showUserIncorrect();", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showUserIncorrect", "showUserIncorrect();", true);
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error en la conexión {ex}')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Todos los campos son requeridos')</script>");
            }
        }
    }
}