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
		
		<!-- INIZIO TABELLA ESTERNA --> 
		<table width="100%" height="100%" border="1">    
			<tr width="100%"  >
			
				<!-- colonna1 -->
				<td align="middle" width="20%" bgcolor=#007FFF> 
					<a href="aggiungiCompetenzaAdmin.html"><img src="/SWIM-web/Immagini/AggiungiCompetenza.jpg\" width="100" height="20"> </a>
				</td>
					
				<!-- colonna2 -->
				<td align="middle" width="60%" frame=void border="1">
					<table width="100%" height="100%">
					<tr>
					
					<%					
						String esito=(String)request.getSession().getAttribute("esitoAggiuntaCompetenzaAdmin");
					
						if(esito.equals("nonIserita")){
							out.println("<h3>&nbsp;La competenza non e' stata aggiunta.<br>Controlla nell'elenco competenze se esiste gia'.</h3>");
						}else{
							out.println("<h3>&nbsp;La competenza e' stata aggiunta correttamente.</h3>");
						}
					%>
						<td align="middle">
						<a href="adminHomePage.html">Home Admin</a>
						<br>
						</td>
						
						<td align="middle">
							<form action="ShowAblityListServlet" method="post"><input type="submit" value="Torna a lista competenze">
							</form>
						<br>
						</td>
						
						<td align="middle">
							<form action="ShowAblityRequestListServlet" method="post"><input type="submit" value="Torna a lista di richieste competenza">
							</form>
						<br>
						</td>
						
					</tr>
					</table>
				</td>					
				
				<!-- colonna3 -->				
				<td align="middle" width="20%" bgcolor=#007FFF>
						
				</td>	
				
			</tr>
		</table> <!-- FINE TABELLA ESTERNA --> 
		
</body>	
</html>