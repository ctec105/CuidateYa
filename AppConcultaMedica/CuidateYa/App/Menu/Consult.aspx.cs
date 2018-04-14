using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Consult : System.Web.UI.Page
{
    Enfermedad enf = new Enfermedad();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DataListEnfermedades.DataSource = enf.buscarEnfermedades(" ");
            DataListEnfermedades.DataBind();

            RepeaterEnfermedades.DataSource = enf.buscarEnfermedades(" ");
            RepeaterEnfermedades.DataBind();
        }
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        RepeaterEnfermedades.DataSource = enf.buscarEnfermedades(txtEnfermedad.Text);
        RepeaterEnfermedades.DataBind();
    }
}