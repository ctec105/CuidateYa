using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

public class Usuario
{
    // Instanciar la clase Conexión
    Conexion cn = new Conexion();

    public Usuario()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public bool login(string usuario, string contraseña)
    {
        try
        {
            cn.getCn.Open();
            SqlCommand cmd = new SqlCommand("USP_USUARIO_LOGIN", cn.getCn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@USER_LOGIN", SqlDbType.VarChar, 50).Value = usuario;
            cmd.Parameters.Add("@USER_PASSWORD", SqlDbType.Char, 20).Value = contraseña;
            int result = Int32.Parse(cmd.ExecuteScalar().ToString());
            cn.getCn.Close();
            return result > 0;
        }
        catch (Exception)
        {
            return false;
        }
        
    }
}