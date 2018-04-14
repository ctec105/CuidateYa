using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Esta clase Utilidades, contiene métodos que serán usadas en toda la Aplicación
/// </summary>
public class Utilidades
{
    public Utilidades()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    /*Función que permite limpiar todos los controles de una página Web
      recursivamente. Útil cuando en la página existen varios controles
      evita tener que limpiar uno por uno. */
    public void CleanControl(ControlCollection controles)
    {
        foreach (Control control in controles)
        {
            if (control is TextBox)
                ((TextBox)control).Text = string.Empty;
            else if (control is DropDownList)
                ((DropDownList)control).ClearSelection();
            else if (control is RadioButtonList)
                ((RadioButtonList)control).ClearSelection();
            else if (control is CheckBoxList)
                ((CheckBoxList)control).ClearSelection();
            else if (control is RadioButton)
                ((RadioButton)control).Checked = false;
            else if (control is CheckBox)
                ((CheckBox)control).Checked = false;
            else if (control.HasControls())
                //Esta linea detécta un Control que contenga otros Controles
                //Así ningún control se quedará sin ser limpiado.
                CleanControl(control.Controls);
        }
    }
    
}