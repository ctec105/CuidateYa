using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// Importar librerías
using System.Data.SqlClient;
using System.Data;

public partial class App_Account_Manage : System.Web.UI.Page
{
    // Método que se ejecuta al cargar la clase
    protected void Page_Load(object sender, EventArgs e)
    {
        // Si la pagina no ha ido al servidor
        if (!IsPostBack)
        {
            try
            {
                // Si se ha identificado
                if (Context.User.Identity.IsAuthenticated)
                {
                    obtenerPermisos(Context.User.Identity.Name);
                }
                else
                    Response.Redirect("~/App/Account/Login.aspx");
            }
            catch (Exception ex)
            {
                lblOpciones.Text = ex.Message;
            }
        }

    }

    // Método para obtener los permisos del usuario logueado
    private void obtenerPermisos(string usuario)
    {
        try
        {
            // Instanciar la clase conexión
            Conexion cn = new Conexion();

            // Abrir conexión a BD
            cn.getCn.Open();

            // Comando para ejecutar una sentencia sql
            SqlCommand cmd = new SqlCommand("USP_USERS_PERMISOS", cn.getCn);

            // Indicamos que es un Store Procedure que vamos a ejecutar
            cmd.CommandType = CommandType.StoredProcedure;
            
            // se define los parámetros de entrada
            cmd.Parameters.Add("@USER_LOGIN", SqlDbType.VarChar, 50).Value = usuario;

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (Convert.ToBoolean(dr["ADMINISTRADOR"]))
                {
                    //lblOpciones.Text = lblOpciones.Text.Replace("{administrador}", "<a href='PanelAdministrador.aspx' class='pro-link' title='Cuenta de Usuario'>Administrador</a>");
                    lblOpciones.Text = lblOpciones.Text.Replace("{administrador}", "Administrador");
                }
                else
                {
                    lblOpciones.Text = lblOpciones.Text.Replace("{administrador}", "");
                }

                if (Convert.ToBoolean(dr["MEDICO"]))
                {
                    //lblOpciones.Text = lblOpciones.Text.Replace("{medico}", "<a href='PanelMedico.aspx' title='Cuenta de Usuariro!'>Médico</a>");
                    lblOpciones.Text = lblOpciones.Text.Replace("{medico}", "Médico");
                }
                else
                {
                    lblOpciones.Text = lblOpciones.Text.Replace("{medico}", "");
                }

                if (Convert.ToBoolean(dr["PACIENTE"]))
                {
                    //lblOpciones.Text = lblOpciones.Text.Replace("{paciente}", "<a href='PanelPaciente.aspx' title='Cuenta de Usuario'>Paciente</a>");
                    lblOpciones.Text = lblOpciones.Text.Replace("{paciente}", "Paciente");
                }
                else
                {
                    lblOpciones.Text = lblOpciones.Text.Replace("{paciente}", "");
                }

                lblOpciones.Visible = true;
            }

            dr.Close();
            cmd.Dispose();
            cn.getCn.Close();
            cn.getCn.Dispose();
        }
        catch (Exception ex)
        {
            lblOpciones.Text = ex.Message;
        }
    }
}