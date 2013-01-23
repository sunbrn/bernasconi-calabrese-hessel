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
</head>
<body>				
		
		<!-- INIZIO TABELLA ESTERNA --> 
		<table width="100%" height="100%" border="1">    
			<tr width="100%"  >
			
				<!-- colonna1 -->
				<td align="middle" width="20%" bgcolor=#007FFF> 
					<form action="adminAggiungiCompetenza.jsp" method="get"><input type="submit" value="Aggiungi nuova competenza"></form>
					<br>
					<form action="adminHomePage.html" method="get"><input type="submit" value="Torna alla home"></form>
					<br>
					<form action="LogoutServlet" method="post"><input type="submit" value="Log-Out"></form>
				</td>
					
				<!-- colonna2 -->
				<td align="middle" width="60%" frame=void border="1">
					<table width="100%" height="100%">
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
				</td>					
				
				<!-- colonna3 -->				
				<td align="middle" width="20%" bgcolor=#007FFF>
						
				</td>	
				
			</tr>
		</table> <!-- FINE TABELLA ESTERNA --> 
		
</body>	
</html>