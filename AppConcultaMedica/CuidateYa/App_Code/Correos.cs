using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

/// <summary>
/// Esta clase puede ser llamarla desde cualquier punto de la aplicación.
/// Sin olvidar agregar el Using Correspondiente: using System.Net.Mail;
/// </summary>
public class Correos
{
    /* No tenemos servidor de correo, usamos los que ya conocemos */
    /*
         * Cliente SMTP
         * Gmail:  smtp.gmail.com  puerto:587
         * Hotmail: smtp.live.com  puerto:25
    */

    //SmtpClient server = new SmtpClient("smtp.live.com", 25); // Microsoft bloqueo
    SmtpClient server = new SmtpClient("smtp.gmail.com", 587);

    public Correos()
    {
        /*
             * Autenticacion en el Servidor
             * Utilizaremos nuestra cuenta de correo
             * Direccion de Correo y Contraseña correspondiente
         */
        server.Credentials = new System.Net.NetworkCredential("cuidateya.noreply@gmail.com", "cuidate123");
        server.EnableSsl = true;
    }

    public void MandarCorreo(MailMessage mensaje)
    {
        server.Send(mensaje);
    }
}


