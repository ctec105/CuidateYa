using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

public class Pais
{
    Conexion cn = new Conexion();

    public Pais()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public DataTable listarPaises()
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM PAIS;", cn.getCn);
        DataTable tb = new DataTable();
        da.Fill(tb);
        return tb;
    }
}