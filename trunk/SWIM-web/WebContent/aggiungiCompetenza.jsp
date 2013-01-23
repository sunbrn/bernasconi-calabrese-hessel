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
</head>
<body>
					
				<table border="0" cellpadding="1" cellspacing="2" width="100%">
	
				<TBODY>
	
				<tr>
					
					<td>
					
					</td>
					
					
					<td>
						<p>Nuova Competenza:</p>
						<p>scegli una nuova competenza da aggiungere: </p>
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
					</td>
				</tr>
				
				<tr>
				<td>
				<br><br><br>
				<p> se non hai trovato la competenza che desideravi dichiarare, invia una richiesta all'amministratore! </p>
				<p> <a href="/SWIM-web/richiediCompetenza.html"> Richiedi Competenza </a> </p>
				<p><a href="homePageUtente.jsp"> Torna alla Home </a></p>
				</td>
				</tr>
				
				</table>
</body>
</html>