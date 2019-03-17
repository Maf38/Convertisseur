<%-- 
    Document   : PageResultat
    Created on : 7 mars 2019, 06:12:37
    Author     : mafal
--%>

<%@page import="metier.Convertisseur"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tag" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page Resultat</title>
        <link href="CSSFormulaire.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Le résultat est:</h2>
        <br/>
        <p> 
            <% 
                try{
               String devDepart;
               String devArrivee;
               int montant;
               Map HashListeDevise;
               HashListeDevise= Convertisseur.getConversionTable();               
               
               devDepart=request.getParameter("depart").toString();
               devArrivee=request.getParameter("arrivee").toString();
               montant= Integer.parseInt(request.getParameter("montant"));
               
               if(devDepart==null || devArrivee==null){
                  out.println("<h1> Monnaie non définie </h1>");
               }
               else if(devDepart==""|| devArrivee==""){
                    out.println("<h1> Veuillez sélectionner une monnaie de départ et/ou d'arrivée </h1>");
               }
               else{
                    Object coeffDepart=HashListeDevise.get(devDepart);
                    Object coeffArrivee=HashListeDevise.get(devArrivee);
                    double nbDepart= Double.parseDouble(coeffDepart.toString());
                    double nbArrivee=Double.parseDouble(coeffArrivee.toString());

                    double resultat= (nbArrivee*montant)/nbDepart;

                    out.println("<h2>"+ montant+ " "+devDepart+" ="+ resultat+" "+devArrivee+"</h2>");
               }
                }
                catch(Exception e){
                    out.println("<h1> problème de calcul...Veuillez contacter l'administrateur</h1>");
                }

            %>
        <p/>
        <br/>
 
        <a href="page-conversion.jsp">Retour</a>
        <tag:footerTag message="Merci d'avoir converti des  ${valider.depart} en ${valider.arrivee}"  />
    </body>
</html>
