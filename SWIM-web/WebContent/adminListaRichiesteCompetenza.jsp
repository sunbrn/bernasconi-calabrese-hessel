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
<title>SWIMv2 - Lista di richieste aggiunta competenza</title>
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
					<form action="LogoutServlet" method="get"><input type="submit" value="Log-Out"></form>
					</form>
				</td>
					
				<!-- colonna2 -->
				<td align="middle" width="60%" frame=void border="1">
					<table width="100%" height="100%">
					<tr><td align="middle">
						<h3>&nbsp;Richieste aggiunta competenza pervenute dagli utenti:</h3>
						<br>
						
						<%							
						ArrayList<Richieste_agg_comp> lista=(ArrayList<Richieste_agg_comp>) request.getSession().getAttribute("richiesteAggCompList");
								
							out.println("<table>");
							
							for (Richieste_agg_comp a: lista){
									out.println("<tr> <td>"+ a.getData().toString() + "</td>");
									out.println("<td>" + a.getTesto_richiesta() + "</td>");
									String s=Long.toString(a.getRichiesta_ID());
									
									out.println("<td>");
									
									out.println("<form action=\"RemoveAbilityRequestServlet\" method=\"get\"><input type=\"hidden\" value=\""+s+"\" name=\"idRichiesta\"><input type=\"submit\" value=\"Esiste gia'!\"> </form>");
									
									out.println("<form action=\"RemoveAbilityRequestServlet\" method=\"post\"><input type=\"hidden\" value=\""+s+"\" name=\"idRichiesta\"><input type=\"submit\" value=\"Rifiuta!\"> </form>");
									
									out.println("<nobr><form name=\"AccettaRichiesta\" action=\"AddAbilityAdminServlet\" method=\"get\">" +
													"<table border=\"0\" cellpadding=\"1\" cellspacing=\"2\" width=\"100%\">" +
														"<TBODY>" +	
															"<tr>" +
															"<td align=\"left\" width=\"0%\">Competenza:</td>" +
															"<td align=\"left\" width=\"100%\"><INPUT id=\"nuovaCompetenzaAdmin\" name=\"nuovaCompetenzaAdmin\" style=\"height: 23\" type=\"text\" value=\"\"></td>" +
															"</tr>" +			
															"<tr>" +
															"<td align=\"left\" width=\"0%\">Codice competenza:</td>" +
															"<td align=\"left\" width=\"100%\"><INPUT id=\"nuovoCodiceAdmin\" name=\"nuovoCodiceAdmin\" style=\"height: 23\" type=\"text\" value=\"\"></td>" +
															"</tr>" +
															"<tr>" +
															"<td align=\"left\" width=\"0%\"></td>" +
															"<td align=\"left\" width=\"50%\"><input type=\"submit\" style=\"width:70;height: 23\" value=\"submit\" onClick=\"\"></td>" +
															"</tr>" +	
														"</TBODY>" +
													"</table>" +
												"</form></nobr>");	
									
									out.println("</td></tr>");
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