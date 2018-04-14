using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_Account_Register : System.Web.UI.Page
{
    Pais pais = new Pais();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // Cargar países
            cboNacionalidad.DataSource = pais.listarPaises();
            cboNacionalidad.DataTextField = "nom_pais";
            cboNacionalidad.DataValueField = "id_pais";
            cboNacionalidad.DataBind();
            cboNacionalidad.Items.Insert(0, new ListItem("<Seleccione>", "0"));
        }
    }

    protected void btnRegistrarse_Click(object sender, EventArgs e)
    {

    }
}