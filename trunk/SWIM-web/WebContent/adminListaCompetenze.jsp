<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.persistence.*"%>
<%@page import="javax.persistence.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collection"%>
<%@page import="swim.sessionbeans.*"%>
<%@page import="swim.entitybeans.*"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SWIMv2 - Lista di competenze</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div id="cont">
	<div id="layout">
	
		<div id="header">
			<img src="/SWIM-web/ImmaginiNuove/logo.png" alt="mio logo" 	class="logo" /> 
		</div>					
		
		<div id="nav">
            <ul>
            <li>
            <a href="adminHomePage.html"> Home </a>
            </li>
            <li>
         	<a href="ShowAbilityListServlet"> Lista competenze</a>
            </li>
            <li>
           	<a href="adminAggiungiCompetenza.jsp"> Aggiungi Competenza </a>
            </li>
            <li>
           	<a href="ShowAbilityRequestServlet"> Richieste Competenze </a>
            </li>
            </ul>
		</div>
				
		<table width="100%" height="100%">
		<tr><td height="20px"></td></tr>
		<tr><td align="middle">
			<h3>&nbsp;Competenze disponibili:</h3>
			<br>
			
			<%							
				ArrayList<Archivio_comp> lista=(ArrayList<Archivio_comp>) request.getSession().getAttribute("listaCodiciECompetenze");
				out.println("<table>");
				for (Archivio_comp a: lista){
						out.println("<tr> <td>"+ a.getCodice_comp() + "</td>");
						out.println("<td>" + a.getNome() + "</td> </tr>");							
				}							
				out.println("</table>");
				out.println("<br>");
			%>
				
		</td></tr>
		</table>
		
</body>	
</html>