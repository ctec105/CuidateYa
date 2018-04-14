using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : System.Web.UI.Page
{
    Pais pais = new Pais();
    Especialidad esp = new Especialidad();
    Medico me = new Medico();
    Utilidades ut = new Utilidades();

    protected void Page_Load(object sender, EventArgs e)
    {
        // Si la página no ha ido al servidor
        if (!Page.IsPostBack)
        {
            // Cargar países
            cboNacionalidad.DataSource = pais.listarPaises();
            cboNacionalidad.DataTextField = "nom_pais";
            cboNacionalidad.DataValueField = "id_pais";
            cboNacionalidad.DataBind();
            cboNacionalidad.Items.Insert(0, new ListItem("<Seleccione>", "0"));

            // Cargar especialidades
            cboEspecialidad.DataSource = esp.listarEspecialidades();
            cboEspecialidad.DataTextField = "nom_espe";
            cboEspecialidad.DataValueField = "id_espe";
            cboEspecialidad.DataBind();
            cboEspecialidad.Items.Insert(0, new ListItem("<Seleccione>", "0"));

            // Cargar pais de residencia
            cboPaisDeResidencia.DataSource = pais.listarPaises();
            cboPaisDeResidencia.DataTextField = "nom_pais";
            cboPaisDeResidencia.DataValueField = "id_pais";
            cboPaisDeResidencia.DataBind();
            cboPaisDeResidencia.Items.Insert(0, new ListItem("<Seleccione>", "0"));
        }

    }

    protected void btnRegistrarse_Click(object sender, EventArgs e)
    {
        string msg = "";

        // Instanciamos la clase DataMedico
        DataMedico med = new DataMedico();
        // Seteamos los campos a guardar
        med.Nom_med = txtNombre.Text;
        med.Ape_med = txtApellido.Text;
        med.Id_nacio = int.Parse(cboNacionalidad.SelectedValue);
        med.Email_med = txtEmail.Text;
        med.Tele_med = txtTelefono.Text;
        med.Id_espe = int.Parse(cboEspecialidad.SelectedValue);
        med.Id_pais_resi = int.Parse(cboPaisDeResidencia.SelectedValue);
        med.Com_med = txtComentario.Text;

        // Si la página terminó de ser validada
        if (Page.IsValid)
        {
            try
            {
                // Registramos al médico
                int i = me.registrarMedico(med);

                // Si se registro correctamente en la bd
                if (i > 0)
                {
                    // Guardamos su cv en el servidor
                    subirArchivo();

                    // Enviamos el correo
                    enviarCorreo(med);

                    // Mostramos mensaje
                    msg = "¡Gracias por suscribirse en la aplicación! En breve recibirás \\n un correo electrónco.";
                }
                else
                {
                    msg = "No se pudo registrar su solicitud, intente nuevamente";
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
            }
            finally
            {
                // Liampiamos los controles
                ut.CleanControl(this.Controls);

                // Mostramos la alerta
                string script = @"<script type = 'text/javascript'> alert('{0}'); </script>";
                script = string.Format(script, msg);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
        }
        /*else
        {
            msg = "La página no ha sido validada."; // test
        }*/
    }

    private void subirArchivo()
    {
        // Si se cargo un archivo
        if (fileCurriculum.HasFile)
        {
            // Lo guardamos en una carpeta del servidor
            string fullPath = Path.Combine(Server.MapPath("~/App/Files"), txtEmail.Text + Path.GetExtension(fileCurriculum.FileName));
            fileCurriculum.SaveAs(fullPath);
        }
        else
        {
            lblMensaje.Text = "No se pudo guardar el cv al servidor";
        }
    }

    private void enviarCorreo(DataMedico med)
    {
        try
        {
            // Instanciamos la clase Correo
            Correos correo = new Correos();
            // Iniciallizamos el mensaje del correo electrónico
            MailMessage mnsj = new MailMessage();
            // Establecemos el Asunto
            mnsj.Subject = "¡Hola! Gracias por suscribirse. Revisaremos su solictud";
            // Aqui el Correo de destino
            string email = med.Email_med;
            mnsj.To.Add(new MailAddress(email));
            // Aqui el Correo de origen
            mnsj.From = new MailAddress("cuidateya.noreply@gmail.com", "CuidateYa");
            // Aquí si desea adjuntar algún archivo
            /*string ruta = HttpContext.Current.Request.MapPath("~/App/Images/check.png");
            mnsj.Attachments.Add(new Attachment(ruta));*/
            // Aqui el contenido del mensaje
            mnsj.Body = plantillaMedico(med);
            mnsj.IsBodyHtml = true;
            // Enviamos el correo
            correo.MandarCorreo(mnsj);
            lblMensaje.Text = "El correo se ha enviado correctamente";
        }
        catch (Exception ex)
        {
            lblMensaje.Text = "Ocurrio un error al intentar enviar el correo: " + ex.Message;
        }
    }

    private string plantillaMedico(DataMedico med)
    {
        StringBuilder myBuilder = new StringBuilder();
        myBuilder.Append("<!DOCTYPE html>");
        myBuilder.Append("<html>");
        myBuilder.Append("<head>");
        myBuilder.Append("<meta charset='utf - 8' />");
        myBuilder.Append("<title></title>");
        myBuilder.Append("</head>");
        myBuilder.Append("<body>");
        myBuilder.Append("<form id='form1'>");
        myBuilder.Append("<div>");
        myBuilder.Append("<table cellspacing='0' cellpadding='0' border='0' style='color: #333; background: #fff; padding: 0; margin: 0; width: 100%; font: 15px 'Helvetica Neue',Arial,Helvetica' >");
        myBuilder.Append("<tbody>");
        myBuilder.Append("<tr width='100%'>");
        myBuilder.Append("<td valign='top' align='left' style='background: #f0f0f0; font: 15px 'Helvetica Neue',Arial,Helvetica'>");
        myBuilder.Append("<table style='border: none; padding: 0 18px; margin: 50px auto; width: 500px'>");
        myBuilder.Append("<tbody>");
        myBuilder.Append("<tr width='100%' height='57'>");
        myBuilder.Append("<td valign='top' align='left' style='border-top-left-radius: 4px; border-top-right-radius: 4px; background: #CBCACA; padding: 12px 18px; text-align: center'>");
        myBuilder.Append("<img height='37' width='122' src='https://lh3.googleusercontent.com/fGzIpQmBsQh7q6gwi7SOGx7VDWQ-T0Xu1I-SEkq6ovzWUSSivZBJpLSJ_mBc1VS1EdYFD09YxA-Hozaz-Jg8gvKnCQX-tZ9doY32PMM4aEr5nkbYE58-fpVBVr3qbWIurCTrH3G_JZ8udIFSXeH3vuKWtOf4nr7bYtc88BEPoYD-fZfAnLiGvOyhUducOdRHa5o8wunnAHmcIPWroKCxunyTblmIAaFN2-9Yd66CGqO755RIBtpvMweI5w7MTipE16BWjdq_pTHSaPA4gLD5eX3zcJKkzvYjEZopyFXhI0543QhHb4fkldN5MVm0mU07ty-n4Lr4JBz71C44QnKvYfUvihyPWgGBa40D88wf0r-_LNUKU4OiWtvmBo_ddiGjinFayp_Ld96w8T-6WWnfwJo6ZJdyu4bCOLC4Ei5TwfOP74p27yxAZI18uAJto_f6a-_jSECLIy2GF7k7iTfzCYbqbFdBsmiQ-p4lZNrg1i3LHKQ-mc8cdyVkJP3ZNPq6NbxoC7Wk7aOqUAA38Xef0Sajgb_atypjR0B2u34nUbCwLWMSMlVqfjXo173ZoUPD8S80KeRl0tj1QEgV1Id60tlUz-Morkb5SecjrMw=w300-h66-no' title='CuidateYa' style='font-weight: bold; font-size: 18px; color: #fff; vertical-align: top'>");
        myBuilder.Append("</td>");
        myBuilder.Append("</tr>");
        myBuilder.Append("<tr width='100%'>");
        myBuilder.Append("<td valign='top' align='left' style='border-bottom-left-radius: 4px; border-bottom-right-radius: 4px; background: #fff; padding: 18px'>");
        myBuilder.Append("<h1 style='font-size: 20px; margin: 0; color: #333'> Hola " + med.Nom_med + " " + med.Ape_med + "</h1>");
        myBuilder.Append("<p style='font: 15px/1.25em 'Helvetica Neue',Arial,Helvetica; color: #333'> Su solicitud será revisada por nuestro equipo.En breve recibirá un correo electrónico cuando haya sido aprobado.</p>");
        myBuilder.Append("<p style='font: 15px/1.25em 'Helvetica Neue',Arial,Helvetica; color: #333'>");
        myBuilder.Append("<a href='http://localhost:45396/App/Menu/Home.aspx' style='border-radius: 3px; background: #3aa54c; color: #fff; display: block; font-weight: 700; font-size: 16px; line-height: 1.25em; margin: 24px auto 24px; padding: 10px 18px; text-decoration: none; width: 180px; text-align: center' target='_blank'> Ir a la aplicación</a>");
        myBuilder.Append("</p>");
        myBuilder.Append("<p style='font: 15px/1.25em 'Helvetica Neue',Arial,Helvetica; color: #939393; margin-bottom: 0'> Si no ha creado una cuenta de CuidateYa, elimine este correo electrónico y todo volverá a ser como antes. </p>");
        myBuilder.Append("</td>");
        myBuilder.Append("</tr>");
        myBuilder.Append("</tbody>");
        myBuilder.Append("</table>");
        myBuilder.Append("</td>");
        myBuilder.Append("</tr>");
        myBuilder.Append("</tbody>");
        myBuilder.Append("</table>");
        myBuilder.Append("</div>");
        myBuilder.Append("</form>");
        myBuilder.Append("</body>");
        myBuilder.Append("</html>");
        return myBuilder.ToString();
    }

}