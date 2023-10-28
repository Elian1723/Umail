using System;
using System.Collections.Generic;
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
                        
                        //adaptadorIndexador.InsertarIndexador(Convert.ToInt32(Session["Id"]), Convert.ToInt32(adaptadorUsuario.BuscarUsuario(destino).Rows[0]["id"]), false, true, true, 0);
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