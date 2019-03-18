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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Convertisseur de devise</title>
        <link href="CSSFormulaire.css" rel="stylesheet" type="text/css"/>
         

    </head>
    <%!
        public void afficherSelect(JspWriter out, String nom) {
            try {
                
               
                Map <String,Double> HashListeDevise;
                HashListeDevise= Convertisseur.getConversionTable();

                out.println("<select name =" + nom + ">");
                out.println("<option value=''>--Faites votre choix--</option>");
                for (String dev : HashListeDevise.keySet()) {
                   
                    out.println("<option value='" + dev+ "'>" + dev + "</option>");
                }
                out.println("</select>");

            } catch (Exception e) {
            }
        }

    
    %>    
    <body>
        <jsp:useBean id= "valider" class="beans.BeanFormulaire" scope="request" >
        <jsp:setProperty name="valider" property="*" />
        </jsp:useBean> 
        
        <%             
             Map errors=valider.getErrors();
             System.out.println("erreur montant avant attribut=" +errors.get("errMontantErronne"));
             if (session.getAttribute("erreur")!=null){//cas où on a eu une erreur de saisi (on a sauvegardé ces erreurs dans l'attribut de session "erreur")
                 errors=(Map) session.getAttribute("erreur");
                 System.out.println("avant l'erreur montant etait= "+errors.get("errMontantErronne")+"/n"
                                     );
             }
        %>
        <br/>
        <h1> Entrez les données à convertir</h1>
        <br/>
        <%-- creation de la liste --%>

        <div id="cadre">
            <p>
                               
               

            <form  method="get" action= "page-conversion.jsp"/>
                <table>
                    <tr>  
                        <td>Monnaie de départ:</td> 
                        <td><% afficherSelect(out,"depart"); %> </td>                    
                        <td><%= (String)errors.get("errDepart")%></td>
                    <tr/>
                    <tr>
                        <td>Montant à convertir:</td>
                        <td> <input type =" text" name="montant" placeholder=" montant"/></td>
                        <td><%= (String)errors.get("errMontant")%><%= (String)errors.get("errMontantErronne")%></td>
                       
                    <tr/>
                    <tr>
                        <td>Monnaie d'arrivée:</td>
                        <td> <%  afficherSelect(out,"arrivee"); %> </td>
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
                    <%  
                        
                        if (request.getParameter("btnGo")!=null){//si on a chargé une fois la page
                        session.removeAttribute("erreur");//on supprime l'attribut de ssesion erreur car c'est un deuxième affichage
                        valider.eraseErrors();
                    
                        
                        if (valider.validate()){
                            RequestDispatcher dispatcher=request.getRequestDispatcher("page-resultat.jsp");
                            dispatcher.forward(request,response);
                           
                        }
                        else {
                                
                               
                                System.out.println("erreur montant= "+errors.get("errMontantErronne"));
                               
                                session.setAttribute("erreur", errors);//stockage des erreurs dans un attribut de session
                              
                            }
                        

                    }
        %>
        
    </body>     
            
    </html>
