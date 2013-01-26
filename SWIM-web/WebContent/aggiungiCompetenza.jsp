<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.persistence.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="swim.entitybeans.Archivio_comp"%>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SWIMv2 - Aggiungi Competenza</title>
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
			<a href="homePageUtente.jsp">Home</a>
			</li>
			<li>
			<a href="/SWIM-web/richiediCompetenza.html"> Richiedi Competenza </a>
			</li>
			</ul>
		</div>
		
		<div id="center">
		
		<p>Nuova Competenza:</p>
		<p>Scegli una nuova competenza da aggiungere. </p>
		<p>Consiglio per aggiungere una competenza:  se ad esempio sei un insegnante di chitarra ma offri anche lezioni di solfeggio aggiungi fra le tue competenze sia insegnante di chitarra che insegnanate di musica, in questo modo sarai contattato anche dagli utenti che cercano un insegnanate di musica e potrai avere così molte più offerte di lavoro!</p> 
		<br>
		<br> 
		<p>
		
		<%						
			ArrayList<Archivio_comp> elenco= (ArrayList<Archivio_comp>) request.getSession().getAttribute("listaCodiciECompetenze");
			
			if(elenco.size()!=0){
				out.println("<form name=\"DichiaraCompetenze\" action=\"AbilitySetUpServlet\" method=\"get\">");
				out.println("<select name=\"nuovaCompetenza\">");
				for(Archivio_comp c: elenco){
					out.println("<option value=\""+ c.getNome() +"\"> "+ c.getNome() +" </option>");				
				}
				out.println("<input type=\"submit\" style=\"width:70;height: 33\" value=\"submit\">");
				out.println("</select>");
				out.println("</form>");
			}else{
				out.println("non sono ancora state definite competenze dichiarabili");
			}
		%>
		
	</p>
	<br><br><br>
	
	<div class="adv">
	<p> Se non hai trovato la competenza che desideravi dichiarare, invia una richiesta all'amministratore selezionando la voce Richiedi Competenza! </p>
	</div>
	</div>

	<div id=chiusura>
	</div>

</div>
</div>
</body>
</html>