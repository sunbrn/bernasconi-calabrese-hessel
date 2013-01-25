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
<title> SWIMv2 - Aggiungi Competenza Admin </title>
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

		<div id="center">		
		<form name="Aggiungi_comp" action="AddAbilityAdminServlet" method="get">
				
				<table border="0" cellpadding="1" cellspacing="2" width="100%">
					<TBODY>									
							<tr>
							<td widht="100%"><p>Competenza:</p>
							<p><INPUT id="nuovaCompetenzaAdmin" name="nuovaCompetenzaAdmin" style="height: 33" type="text" value=""></p>
							
							<br>
							<p>Codice Competenza:</p>
							<p><INPUT id="nuovoCodiceAdmin" name="nuovoCodiceAdmin" style="height: 33" type="text" value=""></p>
							
							<br>
							<p><input type="submit" style="width:70;height: 33" value="submit" onClick=""></p>
							</td>
							</tr>		
					</TBODY>
				</table>
		</form>		
		</div>	
		
		<div id=chiusura>
		</div>
		
</div>
</div>
</body>
</html>