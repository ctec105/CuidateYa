using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

public class Especialidad
{
    Conexion cn = new Conexion();

    public Especialidad()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public DataTable listarEspecialidades()
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM ESPECIALIDAD;;", cn.getCn);
        DataTable tb = new DataTable();
        da.Fill(tb);
        return tb;
    }
}