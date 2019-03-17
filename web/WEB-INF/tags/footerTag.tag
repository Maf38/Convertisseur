<%-- 
    Document   : footerTag
    Created on : 14 mars 2019, 06:15:43
    Author     : mafal
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="message"%>

<%-- any content can be specified here e.g.: --%>

<footer>
    <h1>Ceci est un Footer dynamique<h1>
    <h2>${message}</h2>
    <h6>Powered by TresTresMoche Company<h6>
</footer>