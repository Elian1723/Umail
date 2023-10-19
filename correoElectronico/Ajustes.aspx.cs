using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using correoElectronico.DataSetUmailTableAdapters;

namespace correoElectronico
{
    public partial class Ajustes : System.Web.UI.Page
    {
        UsuarioTableAdapter adaptadorUsuario = new UsuarioTableAdapter();

        string name, lastName, gender;
        DateTime date;

        protected void CargarDatos()
        {
            DataTable datosUsuario = adaptadorUsuario.BuscarUsuario(Session["Correo"].ToString());

            name = datosUsuario.Rows[0]["nombre"].ToString().Trim();
            lastName = datosUsuario.Rows[0]["apellido"].ToString().Trim();
            date = Convert.ToDateTime(datosUsuario.Rows[0]["fechaNacimiento"]);
            gender = datosUsuario.Rows[0]["genero"].ToString().Trim();

            TextBoxName.Text = name;
            TextBoxLastName.Text = lastName;
            TextBoxDate.Text = date.ToString("yyyy-MM-dd").Trim();
            DropDownListGender.SelectedIndex = gender == "masculino" ? 1 : 2;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Correo"] == null)
                Response.Redirect("./Login.aspx");

            if (!IsPostBack)
                CargarDatos();
            
            TextBoxName.Focus();
        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            DataTable datosUsuario = adaptadorUsuario.BuscarUsuario(Session["Correo"].ToString());

            string newName, newLastName, newGender, pass, email;
            DateTime newDate;

            newName = TextBoxName.Text.Trim() != name ? TextBoxName.Text.Trim() : name;
            newLastName = TextBoxLastName.Text.Trim() != lastName ? TextBoxLastName.Text.Trim() : lastName;
            newDate = TextBoxDate.Text.Trim() != date.ToString("yyyy-MM-dd").Trim() ? Convert.ToDateTime(TextBoxDate.Text.Trim()) : date;
            newGender = DropDownListGender.SelectedValue != gender ? DropDownListGender.SelectedValue : gender;
            pass = datosUsuario.Rows[0]["contrasena"].ToString().Trim();
            email = datosUsuario.Rows[0]["correo"].ToString().Trim();

            if (!string.IsNullOrEmpty(TextBoxOldPassword.Text) || !string.IsNullOrEmpty(TextBoxNewPassword.Text) || !string.IsNullOrEmpty(TextBoxConfirmedPassword.Text))
            {
                if (!string.IsNullOrEmpty(TextBoxOldPassword.Text) && !string.IsNullOrEmpty(TextBoxNewPassword.Text) && !string.IsNullOrEmpty(TextBoxConfirmedPassword.Text))
                {
                    if (TextBoxOldPassword.Text == pass)
                    {
                        if (TextBoxNewPassword.Text.Trim() == TextBoxConfirmedPassword.Text.Trim())
                        {
                            pass = TextBoxNewPassword.Text;
                            adaptadorUsuario.ActualizarUsuario(newName, newLastName, newDate, newGender, pass, email);

                            ScriptManager.RegisterStartupScript(this, GetType(), "showChangesSaved", "showChangesSaved();", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "showPasswordIncorrect", "showPasswordIncorrect();", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showUserIncorrect", "showUserIncorrect();", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showPasswordRequired", "showPasswordRequired();", true);
                }
            }
            else
            {
                adaptadorUsuario.ActualizarUsuario(newName, newLastName, newDate, newGender, pass, email);

                ScriptManager.RegisterStartupScript(this, GetType(), "showChangesSaved", "showChangesSaved();", true);
            }
        }
    }
}