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
    public partial class controller : System.Web.UI.Page
    {
        UsuarioTableAdapter adaptadorUsuario = new UsuarioTableAdapter();
        CorreoTableAdapter adaptadorCorreo = new CorreoTableAdapter();
        IndexadorTableAdapter adaptadorIndexador = new IndexadorTableAdapter();
        BorradorTableAdapter adaptadorBorrador = new BorradorTableAdapter();

        protected void ValidarRedactar()
        {
            if (Request.Headers["X-Test-Header"] != null && Request.Headers["X-Test-Header"] == "validar-campos")
            {
                string destino = Request["address"];
                string asunto = Request["subject"];
                string mensaje = Request["message"];

                if (!string.IsNullOrEmpty(destino.ToString()) && !string.IsNullOrEmpty(asunto.Trim()) && !string.IsNullOrEmpty(mensaje.Trim()))
                {

                    if (adaptadorUsuario.BuscarUsuario(destino).Rows.Count > 0)
                    {
                        if (mensaje.Length > 500)
                        {
                            Response.AddHeader("X-Test-Header", "mensajeLargo");
                            Response.Write("error");
                        }
                        else
                        {
                            int idDestino = Convert.ToInt32(adaptadorUsuario.BuscarUsuario(destino).Rows[0]["id"]);
                            int idRemitente = Convert.ToInt32(Session["Id"]);
                            DateTime fecha = DateTime.Now;

                            DataTable tablaID = adaptadorCorreo.ObtenerUltimoID();
                            int newID = Convert.ToInt32(tablaID.Rows[0]["id"]) == 0 ? 0 : Convert.ToInt32(tablaID.Rows[0]["id"]) + 1;

                            adaptadorCorreo.InsertarCorreo(newID, asunto, fecha, mensaje);
                            adaptadorIndexador.InsertarIndexador(idRemitente, idDestino, false, true, true, newID);
                            adaptadorIndexador.InsertarIndexador(idDestino, idRemitente, true, false, false, newID);
                        }
                    }
                    else
                    {
                        Response.AddHeader("X-Test-Header", "destinoNoExiste");
                        Response.Write("error");
                    }
                }
                else
                {
                    Response.AddHeader("X-Test-Header", "camposVacios");
                    Response.Write("error");
                }
            }

            if (Request.Headers["X-Test-Header"] != null && Request.Headers["X-Test-Header"] == "enviar-borrador")
            {
                string destino = Request["address"];
                string asunto = Request["subject"];
                string mensaje = Request["message"];
                string id = Request["id"];

                if (!string.IsNullOrEmpty(destino.ToString()) && !string.IsNullOrEmpty(asunto.Trim()) && !string.IsNullOrEmpty(mensaje.Trim()))
                {

                    if (adaptadorUsuario.BuscarUsuario(destino).Rows.Count > 0)
                    {
                        if (mensaje.Length > 500)
                        {
                            Response.AddHeader("X-Test-Header", "mensajeLargo");
                            Response.Write("error");
                        }
                        else
                        {
                            int idDestino = Convert.ToInt32(adaptadorUsuario.BuscarUsuario(destino).Rows[0]["id"]);
                            int idRemitente = Convert.ToInt32(Session["Id"]);
                            DateTime fecha = DateTime.Now;

                            DataTable tablaID = adaptadorCorreo.ObtenerUltimoID();
                            int newID = Convert.ToInt32(tablaID.Rows[0]["id"]) == 0 ? 0 : Convert.ToInt32(tablaID.Rows[0]["id"]) + 1;

                            adaptadorCorreo.InsertarCorreo(newID, asunto, fecha, mensaje);
                            adaptadorIndexador.InsertarIndexador(idRemitente, idDestino, false, true, true, newID);
                            adaptadorIndexador.InsertarIndexador(idDestino, idRemitente, true, false, false, newID);
                        }
                    }
                    else
                    {
                        Response.AddHeader("X-Test-Header", "destinoNoExiste");
                        Response.Write("error");
                    }
                }
                else
                {
                    Response.AddHeader("X-Test-Header", "camposVacios");
                    Response.Write("error");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidarRedactar();
        }
    }
}