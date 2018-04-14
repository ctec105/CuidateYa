using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

public class Enfermedad
{
    Conexion cn = new Conexion();

    public Enfermedad()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public DataTable buscarEnfermedades(string cadena)
    {
        SqlDataAdapter da = new SqlDataAdapter("USP_BUSCAR_ENFERMEDAD", cn.getCn);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.Add("@CADENA",SqlDbType.VarChar).Value = cadena;
        DataTable tb = new DataTable();
        da.Fill(tb);
        return tb;
    }

    public DataTable obtenerEnfermedad(string enfermedadID)
    {
        SqlDataAdapter da = new SqlDataAdapter("USP_OBTENER_ENFERMEDAD", cn.getCn);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.Add("@ID", SqlDbType.VarChar).Value = enfermedadID;
        DataTable tb = new DataTable();
        da.Fill(tb);
        return tb;
    }
}