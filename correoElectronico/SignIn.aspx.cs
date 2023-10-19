using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using correoElectronico.DataSetUmailTableAdapters;

namespace correoElectronico
{
    public partial class SignIn : System.Web.UI.Page
    {
        UsuarioTableAdapter adaptadorUsuario = new UsuarioTableAdapter();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Correo"] != null)
                Response.Redirect("./DashboardPages/Recibidos.aspx");

            TextBoxName.Focus();
        }

        protected void ButtonCrearCuenta_Click(object sender, EventArgs e)
        {
            string name = char.ToUpper(TextBoxName.Text[0]) + TextBoxName.Text.Substring(1).Trim();
            string lastName = char.ToUpper(TextBoxLastName.Text[0]) + TextBoxLastName.Text.Substring(1).Trim();
            DateTime date = Convert.ToDateTime(TextBoxDate.Text);
            string gender = DropDownListGender.SelectedValue;
            string email = TextBoxEmail.Text.Trim().ToLower();
            string password = TextBoxPassword.Text.Trim();
            string confirmedPassword = TextBoxPasswordConfirmed.Text.Trim();

            if (!string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(lastName) && !string.IsNullOrEmpty(date.ToString()) && !string.IsNullOrEmpty(gender) && !string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(password) && !string.IsNullOrEmpty(confirmedPassword))
            {
                string expression = @"^\w{1,25}$";
                Regex regex = new Regex(expression);

                if (regex.IsMatch(email))
                {
                    if (adaptadorUsuario.BuscarUsuario(email + "@umail.com").Rows.Count == 0)
                    {
                        if (confirmedPassword == password)
                        {
                            adaptadorUsuario.CrearUsuario(email + "@umail.com", password, name, lastName, date, gender);
                            ScriptManager.RegisterStartupScript(this, GetType(), "showUserCreated", "showUserCreated();", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "showPasswordIncorrect", "showPasswordIncorrect();", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showUserExist", "showUserExist();", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showEmailIncorrect", "showEmailIncorrect();", true);
                }
            }
            else
            {
                Response.Write("<script>alert('Todos los campos son requeridos');</script>");
            }
        }
    }
}