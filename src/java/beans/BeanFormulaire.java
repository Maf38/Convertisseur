/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 Ce Bean a été superbement modifié depuis gitHub
 */
package beans;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author gai
 */
public class BeanFormulaire {
    
    private String depart="";
    private String montant="";
    private String arrivee="";
    
    private Boolean isValid=true;    
    private Map errors;
  
    
    public BeanFormulaire(){
       
        this.errors=new HashMap();
        errors.put("errDepart","");
        errors.put("errArrivee","");
        errors.put("errMontant","");
        errors.put("errMontantErronne","");
     
    }
    
//    public ValiderFormulaire(String depart,String arrivee,String montant){
//         boolean ok=false;
//         boolean flagOn=false;
//            
//            if(depart.equals("")){
//                this.errDepart="Veuillez saisir une devise";
//                flagOn=true;
//             }
//            
//            if(arrivee.equals("")){
//                this.errArrivee="Veuillez saisir une devise";
//                flagOn=true;
//            }
//
//            if(montant.isEmpty()){
//                this.errMontant="Veuillez saisir un montant";
//                flagOn=true;
//            }
//
//            try{
//                Double.parseDouble(montant);
//            }
//            catch(Exception e){
//                this.errMontantErronne="Le montant est erroné";
//                flagOn=true;
//            } 
//            
//            if(!flagOn){
//                ok=true;
//            }
//
//           
//    }
    
    public void eraseErrors(){
        errors.put("errDepart","");
        errors.put("errArrivee","");
        errors.put("errMontant","");
        errors.put("errMontantErronne","");
    }
    
    public boolean validate(){
        
         boolean flagOn=false;
         boolean ok=false;
            
            if(depart.equals("")){
                errors.replace("errDepart","Veuillez saisir une devise");
                flagOn=true;
                isValid=false;
             }
            
            if(arrivee.equals("")){
                errors.replace("errArrivee","Veuillez saisir une devise");
                flagOn=true;
                isValid=false;
            }
                System.out.println("arrivee ds le bean= " +"depart= "+depart+"montant"+ montant+ "arrivee "+arrivee);
            if(montant.isEmpty()){
                errors.replace("errMontant","Veuillez saisir un montant");
                flagOn=true;
                isValid=false;
            }

            try{
                Double.parseDouble(montant);
            }
            catch(Exception e){
                errors.replace("errMontantErronne","Le montant est erroné");
                flagOn=true;
                isValid=false;
            } 
            
            if(!flagOn){
                
                ok=true;
            }
            
            return ok;
    }

    public String getDepart() {
        return depart;
    }

    public void setDepart(String depart) {
        this.depart = depart;
    }

    public String getArrivee() {
        return arrivee;
    }

    public void setArrivee(String arrivee) {
        this.arrivee = arrivee;
    }

    public String getMontant() {
        return montant;
    }

    public void setMontant(String montant) {
        this.montant = montant;
    }

    public Map getErrors(){
        return errors;
    }

    public void setErrors(Map errors){
        this.errors=errors;
    }
    
    public Boolean getIsValid() {
        return isValid;
    }

    public void setIsValid(Boolean isValid) {
        this.isValid = isValid;
    }
    
    
    
    
}
