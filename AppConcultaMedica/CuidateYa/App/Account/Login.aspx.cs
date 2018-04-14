using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Web.Security;

public partial class App_Account_Login : System.Web.UI.Page
{
    // Instanciar clases
    Usuario u = new Usuario();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnIngresar_Click(object sender, EventArgs e)
    {
        // Si la página terminó de ser validada
        if (Page.IsValid)
        {
            
            if (u.login(txtEmail.Text, txtContraseña.Text))
            {
                // Administramos los servicios de autenticación de usuario y 
                // redireccionamos al defaultUrl definido en Web,config 
                FormsAuthentication.RedirectFromLoginPage(txtEmail.Text, chkRecordar.Checked);
            }
            else
            {
                lblMensaje.Text = "Usuario y/o contraseña no válido";
            }
        }
    }

}