using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class Medico
{
    Conexion cn = new Conexion();

    public Medico()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public int registrarMedico(DataMedico me)
    {
        int filasAfectadas = 0;

        // Se indica la sentencia sql
        SqlCommand cmd = new SqlCommand("USP_REGISTRAR_MEDICO", cn.getCn);

        // Se establece que se está llamando a un Stored Procedure
        cmd.CommandType = CommandType.StoredProcedure;

        // Se define los parámetros de entrada
        cmd.Parameters.Add("@NOM_USU", SqlDbType.VarChar).Value = me.Nom_med;
        cmd.Parameters.Add("@APE_USU", SqlDbType.VarChar).Value = me.Ape_med;
        cmd.Parameters.Add("@EDAD_USU", SqlDbType.Int).Value = DBNull.Value;
        cmd.Parameters.Add("@FEC_NAC_USU", SqlDbType.Date).Value = DBNull.Value;
        cmd.Parameters.Add("@SEX_USU", SqlDbType.Char).Value = DBNull.Value;
        cmd.Parameters.Add("@DIR_USU", SqlDbType.Text).Value = DBNull.Value;
        cmd.Parameters.Add("@TELE_USU", SqlDbType.Char).Value = me.Tele_med;
        cmd.Parameters.Add("@EMAIL_USU", SqlDbType.VarChar).Value = me.Email_med;
        cmd.Parameters.Add("@CONTRASEÑA_USU", SqlDbType.Char).Value = DBNull.Value;
        cmd.Parameters.Add("@ID_NACIO", SqlDbType.Int).Value = me.Id_nacio;
        cmd.Parameters.Add("@ID_TIPO_USUARIO", SqlDbType.Int).Value = 2; // Tipo Médico
        cmd.Parameters.Add("@COM_MED", SqlDbType.Text).Value = me.Com_med;
        cmd.Parameters.Add("@BIBLIO_MED", SqlDbType.Text).Value = DBNull.Value;
        cmd.Parameters.Add("@ID_ESPE", SqlDbType.Int).Value = me.Id_espe;
        cmd.Parameters.Add("@ID_PAIS_RES", SqlDbType.Int).Value = me.Id_pais_resi;
        
        // Se define los parámetros de salida
        //cmd.Parameters.Add("@MSG", SqlDbType.VarChar,100).Direction = ParameterDirection.Output;

        // Abrimos la conexión 
        cn.getCn.Open();
        try
        {
            // Registramos al médico 
            filasAfectadas = cmd.ExecuteNonQuery();
        }
        catch (Exception)
        {
            filasAfectadas = 0;
        }
        finally
        {
            cn.getCn.Close();
        }

        return filasAfectadas;
    }
}