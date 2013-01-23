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
<title>SWIMv2 - Pagina di Conferma</title>
</head>
<body>				
		
					<%					
						String esito=(String)request.getSession().getAttribute("esitoAggiuntaCompetenzaAdmin");
					
						if(esito.equals("nonIserita")){
							out.println("<h3>&nbsp;La competenza non e' stata aggiunta.<br>Controlla nell'elenco competenze se esiste gia'.</h3>");
						}else{
							out.println("<h3>&nbsp;La competenza e' stata aggiunta correttamente.</h3>");
						}
					%>
						
						<p><a href="adminHomePage.html"> Home</a></p><br>
						
						<p><a href="ShowAblityListServlet"> Lista competenze</a></p><br>
						
						<p><a href="ShowAblityRequestListServlet"> Richieste competenze </a></p><br>
						
								
				
</body>	
</html>