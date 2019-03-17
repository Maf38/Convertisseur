<%-- 
    Document   : testTag
    Created on : 13 mars 2019, 13:52:15
    Author     : gai
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>


<%-- any content can be specified here e.g.: --%>


<%@ attribute name="couleur" required="false" %>
<%@ attribute name="message" required="false"%>
<%@ attribute name="titre1" required="false"%>

<%--<jsp:invoke fragment="titre1">
    <jsp:attribute name="couleur">    <h1>Hello World!</h1>
   </jsp:attribute>
</jsp:invoke>--%>


        <h2> ${message}<h2/>

