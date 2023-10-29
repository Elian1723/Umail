using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using correoElectronico.DashboardPages;
using correoElectronico.DataSetUmailTableAdapters;

namespace correoElectronico
{
    public partial class Dashboard : System.Web.UI.MasterPage
    {
        UsuarioTableAdapter adaptadorUsuario = new UsuarioTableAdapter();
        CorreoTableAdapter adaptadorCorreo = new CorreoTableAdapter();
        IndexadorTableAdapter adaptadorIndexador = new IndexadorTableAdapter();
        IndexadorBusquedaTableAdapter adaptadorBusqueda = new IndexadorBusquedaTableAdapter();

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

                DataTable tablaRecibidos = adaptadorIndexador.ObtenerRecibidosNoLeidos(Convert.ToInt32(Session["Id"]));
                if (tablaRecibidos.Rows.Count > 0)
                {
                    ContainerBadge.Visible = true;
                    ContainerBadge2.Visible = true;

                    LabelIntRecibidos.Text = adaptadorIndexador.ObtenerRecibidosNoLeidos(Convert.ToInt32(Session["Id"])).Rows.Count.ToString();
                    LabelIntRecibidos2.Text = adaptadorIndexador.ObtenerRecibidosNoLeidos(Convert.ToInt32(Session["Id"])).Rows.Count.ToString();
                }
                else
                {
                    ContainerBadge.Visible = false;
                    ContainerBadge2.Visible = false;
                }
            }
            else
            {
                Response.Redirect("../Login.aspx");
            }
        }

        protected void ButtonCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("../Login.aspx");
        }

        protected void LinkButtonBuscar_Click(object sender, EventArgs e)
        {
            ContentPlaceHolder content = this.Page.Master.FindControl("MainContentPlaceHolder") as ContentPlaceHolder;

            if (content != null)
            {
                GridView gridViewCorreos = content.FindControl("GridViewCorreos") as GridView;

                if (gridViewCorreos != null)
                {
                    int idUsuario = Convert.ToInt32(Session["Id"]);
                    string textboxBusqueda = string.IsNullOrEmpty(TextBoxBusqueda.Text.Trim()) ? TextBoxBusqueda2.Text.Trim() : TextBoxBusqueda.Text.Trim();

                    if (content.Page is Recibidos)
                    {
                        if (!string.IsNullOrEmpty(textboxBusqueda))
                        {
                            if (DateTime.TryParse(textboxBusqueda, out DateTime fecha))
                            {
                                string fechaFormateada = fecha.ToString("dd-MM-yyyy");
                                gridViewCorreos.DataSource = adaptadorBusqueda.BuscarRecibidosFecha(idUsuario, fechaFormateada);
                            }
                            else
                            {
                                gridViewCorreos.DataSource = adaptadorBusqueda.BuscarRecibidos(idUsuario, textboxBusqueda, textboxBusqueda, textboxBusqueda);
                            }
                        }
                        else
                        {
                            gridViewCorreos.DataSource = adaptadorIndexador.ObtenerRecibidos(idUsuario);
                        }
                    }
                    else if (content.Page is Enviados)
                    {
                        if (!string.IsNullOrEmpty(textboxBusqueda))
                        {
                            if (DateTime.TryParse(textboxBusqueda, out DateTime fecha))
                            {
                                string fechaFormateada = fecha.ToString("dd-MM-yyyy");
                                gridViewCorreos.DataSource = adaptadorBusqueda.BuscarEnviadosFecha(idUsuario, fechaFormateada);
                            }
                            else
                            {
                                gridViewCorreos.DataSource = adaptadorBusqueda.BuscarEnviados(idUsuario, textboxBusqueda, textboxBusqueda, textboxBusqueda);
                            }
                        }
                        else
                        {
                            gridViewCorreos.DataSource = adaptadorIndexador.ObtenerEnviados(idUsuario);
                        }
                    }
                    else if (content.Page is Borradores)
                    {
                        // Obtener todos los correos borradores
                    }
                    else if (content.Page is Destacados)
                    {
                        // Obtener todos los correos destacados
                    }
                    else if (content.Page is Archivados)
                    {
                        if (!string.IsNullOrEmpty(textboxBusqueda))
                        {
                            if (DateTime.TryParse(textboxBusqueda, out DateTime fecha))
                            {
                                string fechaFormateada = fecha.ToString("dd-MM-yyyy");
                                gridViewCorreos.DataSource = adaptadorBusqueda.BuscarArchivadosFecha(idUsuario, fechaFormateada);
                            }
                            else
                            {
                                gridViewCorreos.DataSource = adaptadorBusqueda.BuscarArchivados(idUsuario, textboxBusqueda, textboxBusqueda, textboxBusqueda);
                            }
                        }
                        else
                        {
                            gridViewCorreos.DataSource = adaptadorIndexador.ObtenerArchivados(idUsuario);
                        }
                    }
                    else if (content.Page is Eliminados)
                    {
                        if (!string.IsNullOrEmpty(textboxBusqueda))
                        {
                            if (DateTime.TryParse(textboxBusqueda, out DateTime fecha))
                            {
                                string fechaFormateada = fecha.ToString("dd-MM-yyyy");
                                gridViewCorreos.DataSource = adaptadorBusqueda.BuscarEliminadosFecha(idUsuario, fechaFormateada);
                            }
                            else
                            {
                                gridViewCorreos.DataSource = adaptadorBusqueda.BuscarEliminados(idUsuario, textboxBusqueda, textboxBusqueda, textboxBusqueda);
                            }
                        }
                        else
                        {
                            gridViewCorreos.DataSource = adaptadorIndexador.ObtenerPapelera(idUsuario);
                        }
                    }

                    gridViewCorreos.DataBind();
                }
            }
        }
    }
}