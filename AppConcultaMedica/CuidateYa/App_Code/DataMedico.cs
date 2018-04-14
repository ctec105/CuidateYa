using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class DataMedico
{
    private string nom_med;
    private string ape_med;
    private int edad_med;
    private DateTime fec_nac_med;
    private string sex_med;
    private string dir_med;
    private string tele_med;
    private string email_med;
    private string com_med;
    private string biblio_med;
    private int id_espe;
    private int id_nacio;
    private int id_pais_resi;

    public DataMedico()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public string Nom_med { get => nom_med; set => nom_med = value; }
    public string Ape_med { get => ape_med; set => ape_med = value; }
    public int Edad_med { get => edad_med; set => edad_med = value; }
    public DateTime Fec_nac_med { get => fec_nac_med; set => fec_nac_med = value; }
    public string Sex_med { get => sex_med; set => sex_med = value; }
    public string Dir_med { get => dir_med; set => dir_med = value; }
    public string Tele_med { get => tele_med; set => tele_med = value; }
    public string Email_med { get => email_med; set => email_med = value; }
    public string Com_med { get => com_med; set => com_med = value; }
    public string Biblio_med { get => biblio_med; set => biblio_med = value; }
    public int Id_espe { get => id_espe; set => id_espe = value; }
    public int Id_nacio { get => id_nacio; set => id_nacio = value; }
    public int Id_pais_resi { get => id_pais_resi; set => id_pais_resi = value; }
}