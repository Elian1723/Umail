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
        CorreoTableAdapter adaptadorCorreo = new CorreoTableAdapter();
        IndexadorTableAdapter adaptadorIndexador = new IndexadorTableAdapter();

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
                LabelIntRecibidos.Text = adaptadorIndexador.ObtenerRecibidos(Convert.ToInt32(Session["Id"])).Rows.Count.ToString();
                LabelIntRecibidos2.Text = adaptadorIndexador.ObtenerRecibidos(Convert.ToInt32(Session["Id"])).Rows.Count.ToString();
            }
            else
            {
                Response.Redirect("../Login.aspx");
            }
        }

        protected void ButtonEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(TextBoxDestino.Text) && !string.IsNullOrEmpty(TextBoxAsunto.Text) && !string.IsNullOrEmpty(TextBoxDestino.Text))
                {
                    if (adaptadorUsuario.BuscarUsuario(TextBoxDestino.Text).Rows.Count > 0)
                    {
                        int idDestino = Convert.ToInt32(adaptadorUsuario.BuscarUsuario(TextBoxDestino.Text).Rows[0]["id"]);
                        int idRemitente = Convert.ToInt32(Session["Id"]);
                        string asunto = TextBoxAsunto.Text;
                        string mensaje = TextBoxMensaje.Text;
                        DateTime fecha = DateTime.Now;


                        DataTable tablaID = adaptadorCorreo.ObtenerUltimoID();
                        int newID = Convert.ToInt32(tablaID.Rows[0]["id"]) == 0 ? 0 : Convert.ToInt32(tablaID.Rows[0]["id"]) + 1;

                        adaptadorCorreo.InsertarCorreo(newID, asunto, fecha, mensaje);
                        adaptadorIndexador.InsertarIndexador(idRemitente, idDestino, false, true, true, newID);
                        adaptadorIndexador.InsertarIndexador(idDestino, idRemitente, true, false, false, newID);

                        TextBoxAsunto.Text = null;
                        TextBoxDestino.Text = null;
                        TextBoxMensaje.Text = null;

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