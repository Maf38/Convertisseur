/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tag;

import java.util.Map;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import metier.Convertisseur;

/**
 *
 * @author gai
 */
public class Select extends SimpleTagSupport {
    
    public String afficherSelect(String nom, String valeur) {
                String result = "";
                try {

               
                Map <String,Double> HashListeDevise;
                HashListeDevise= Convertisseur.getConversionTable();

                result  = result + "<select name =" + nom + ">";
                result  = result + "<option></option>";

                String sel;
                
               
                for (String dev : HashListeDevise.keySet()) {
                    sel ="";
                    if (dev.equals(valeur))
                    {
                        sel = "selected";
                    }
                    result  = result + "<option value='" + dev+ "'" + sel + ">" + dev + "</option>";
                }
                result  = result + "</select>";

            } catch (Exception e) {
            }
            return result;
        }
    
}
