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
<title>Rimuovi competenze</title>
</head>
<body>				
		<a href="homePageUtente.jsp"> Home </a>
		<br>
		
					<table width="100%" height="100%">
					<tr><td align="middle">
						<h3>Rimuovi competenze:</h3>
						<br>
						
						<%							
						ArrayList<String> lista=(ArrayList<String>) request.getSession().getAttribute("UserAbilities");
								
						
						if(lista!=null){
							
							out.println("<table>");
							for (String s : lista){
									out.println("<tr> <td>"+s+"</td>");
									out.println("<td><form action=\"RemoveAbilityServlet\" method=\"get\"><input type=\"hidden\" value=\""+s+"\" name=\"nomeCompCanc\"><input type=\"submit\" value=\"Rimuovi\"> </form>");
									out.println("</td></tr>");
								}
							
							out.println("</table>");
							out.println("<br>");
						}else{
							out.println("<p>Non hai dichiarato competenze</p> <p> Usa la nostra funzionalità di aggiunta competenze! </p>");
						}
						%>
							
					</td></tr>
					</table>
		
</body>	
</html>