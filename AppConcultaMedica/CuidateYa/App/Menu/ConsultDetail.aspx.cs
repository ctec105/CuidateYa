using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Collections;

public partial class App_Menu_ConsultDetail : System.Web.UI.Page
{
    string enfermedadID;
    Enfermedad enf = new Enfermedad();

    protected void Page_Load(object sender, EventArgs e)
    {
        // Si la pagina no ha ido al servidor
        if (!Page.IsPostBack)
        {
            // Si no se ha seleccionado una enfermedad
            if (Request.QueryString.Get("enfermedadID") == null)
            {
                Response.Redirect("Consult.aspx");
            } else {
                // Recuperamos el ID de la enfermedad seleccionada
                enfermedadID = Request.QueryString.Get("enfermedadID");

                // Obtenemos la información de la enfermedad según su ID
                DataTable tb = enf.obtenerEnfermedad(enfermedadID);

                lblTitulo.Text = tb.Rows[0]["titulo_cont"].ToString().Trim();
                lblResumen.Text = tb.Rows[0]["resumen_cont"].ToString().Trim();
                lblDescripcionGeneral.Text = tb.Rows[0]["desc_general_cont"].ToString().Trim();
                lblCausas.Text = tb.Rows[0]["causas_cont"].ToString().Trim();
                lblSintomas.Text = tb.Rows[0]["sintomas_cont"].ToString().Trim();
                lblPruebas.Text = tb.Rows[0]["pruebas_cont"].ToString().Trim();
                lblTratamiento.Text = tb.Rows[0]["tratamientos_cont"].ToString().Trim();
                lblInfoAdicional.Text = tb.Rows[0]["info_adi_cont"].ToString().Trim();
                lblBibliografia.Text = tb.Rows[0]["refe_biblio_cont"].ToString().Trim();
                lblLsEpidemiologia.Text = tb.Rows[0]["ls_epidemiologia_cont"].ToString().Trim();

                string ls_sintomas = tb.Rows[0]["ls_sintomas_cont"].ToString().Trim();
                string[] arraySintomas;
                arraySintomas = ls_sintomas.Split(',');
                RepeaterlsSintomas.DataSource = arraySintomas;
                RepeaterlsSintomas.DataBind();

                string ls_FactoresDesencadenantes = tb.Rows[0]["ls_factores_desc_cont"].ToString().Trim();
                string[] arrayFactores;
                arrayFactores = ls_FactoresDesencadenantes.Split(',');
                RepeaterLsFactoresDesc.DataSource = arrayFactores;
                RepeaterLsFactoresDesc.DataBind();

                string ls_Especialidades = tb.Rows[0]["ls_especialidades_cont"].ToString().Trim();
                string[] arrayEspecialidades;
                arrayEspecialidades = ls_Especialidades.Split(',');
                RepeaterLsEspecialidades.DataSource = arrayEspecialidades;
                RepeaterLsEspecialidades.DataBind();

                lblAutor.Text = tb.Rows[0]["medico"].ToString().Trim();

                string fechaCreacion = tb.Rows[0]["fec_cre_cont"].ToString().Trim();
                string fechaActualizacion = tb.Rows[0]["fec_mod_cont"].ToString().Trim();
                string version;
                if (fechaActualizacion != "")
                    version = fechaActualizacion.Split(' ')[0];
                else
                    version = fechaCreacion.Split(' ')[0];
                lblVersion.Text = version;
            }
        }
    }
}