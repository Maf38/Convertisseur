<%-- 
    Document   : PageConversion
    Created on : 6 mars 2019, 11:33:42
    Author     : gai
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="metier.Convertisseur"%>
<%@page import="java.util.Map"%>
<%@page import="Element.Devise"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id= "valider" class="beans.BeanFormulaire" scope="request" >
        <jsp:setProperty name="valider" property="*" />
</jsp:useBean> 
     
 <%!
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

    
    %>    
    
    
   <%
       
       if (request.getParameter("btnGo")!=null)//si on a chargé une fois la page
           {
             
            if (valider.validate()){
                            RequestDispatcher dispatcher=request.getRequestDispatcher("page-resultat.jsp");
                            dispatcher.forward(request,response);
            }
         }
        Map errors=valider.getErrors();
        %>
    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Convertisseur de devise</title>
        <link href="CSSFormulaire.css" rel="stylesheet" type="text/css"/>
         

    </head>
   
    <body>
        <%@taglib tagdir="/WEB-INF/tags" prefix="tag" %>  
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        
        <br/>
        <h1> Entrez les données à convertir</h1>
        <br/>
        <%-- creation de la liste --%>

        <div id="cadre">
            <p>
           
            <span><tag:testTag message="super message"/></span>
            <c:out value = "${valider.isValid}" />

            <form  method="get" action= "page-conversion.jsp"/>
                <table>
                    <tr>  
                        <td>Monnaie de départ:</td> 
                        <td>    <%= afficherSelect("depart", valider.getDepart())%> 
                          
                              
                        </td>                    
                        <td><%= (String)errors.get("errDepart")%></td>
                    <tr/>
                    <tr>
                        <td>Montant à convertir:</td>
                        <td> <input type =" text" name="montant" placeholder=" montant" value="<jsp:getProperty name='valider' property='montant' />"/></td>
                        <td><%= (String)errors.get("errMontant")%><%= (String)errors.get("errMontantErronne")%></td>
                       
                    <tr/>
                    <tr>
                        <td>Monnaie d'arrivée:</td>
                        <td> 
                            <%= afficherSelect("arrivee", valider.getArrivee()) %> 
                          
                        </td>
                        <td><%= (String)errors.get("errArrivee")%></td>
                    <tr/>
                    <tr>
                        <td></td>
                        <td><input type="submit" id="go" name="btnGo"/><td/> 
                    <tr/>
                </table>
            </form>
                    
            </p>
               
        </div> 
                        <tag:footerTag message="depechez vous!"  />       
        
    </body>     
            
    </html>
