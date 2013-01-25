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
		<tr><td align="middle">
			<h3>Richieste aggiunta competenza pervenute dagli utenti:</h3>
			<br>
			
			<%							
			ArrayList<Richieste_agg_comp> lista=(ArrayList<Richieste_agg_comp>) request.getSession().getAttribute("richiesteAggCompList");
			ArrayList<User> listaUtenti=(ArrayList<User>)request.getSession().getAttribute("NomiCognomiUtenti");		
			
				out.println("<table>");
				int i=0;
				for (Richieste_agg_comp a: lista){
						String aData=a.getData().toString();
						String aDataCorta = aData.substring(0, Math.min(aData.length(), 16)); 
						
						out.println("<tr> <td>"+ listaUtenti.get(i).getNome()+" "+listaUtenti.get(i).getCognome() + "<br><br><br><br>");
						String s=Long.toString(a.getUser_ID());
						
						
						out.println("<form action=\"ShowUserProfileServlet\" method=\"get\"><input type=\"hidden\" value=\""+s+"\" name=\"idProfilo\"><input type=\"submit\" value=\"Guarda profilo\"> </form>");
						out.println("<br><br><br></td>");
						
						out.println("<td>"+ aDataCorta + "<br><br><br></td>");
						out.println("<td>" + a.getTesto_richiesta() + "<br><br><br></td>");
						s=Long.toString(a.getRichiesta_ID());
						
						out.println("<td>");
						out.println("<form action=\"RemoveAbilityRequestServlet\" method=\"get\"><input type=\"hidden\" value=\""+s+"\" name=\"idRichiesta\"><input type=\"submit\" value=\"Esiste già\"> </form>");
						out.println("<br><br><br></td>");
						
						out.println("<td>");
						out.println("<form action=\"RemoveAbilityRequestServlet\" method=\"post\"><input type=\"hidden\" value=\""+s+"\" name=\"idRichiesta\"><input type=\"submit\" value=\"Rifiuta\"> </form>");
						out.println("<br><br><br></td>");
						
						out.println("<td>");
						out.println("<form name=\"AccettaRichiesta\" action=\"AddAbilityAdminServlet\" method=\"get\">" +
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
												"<td align=\"left\" width=\"50%\">" +
													"<input type=\"hidden\" value=\""+s+"\" name=\"idRichiesta\">" +
													"<input type=\"submit\" style=\"width:70;height: 23\" value=\"Aggiungi\" onClick=\"\"></td>" +
												"</tr>" +	
											"</TBODY>" +
										"</table>" +
									"</form>");
						out.println("</td>");
						
						out.println("<br><br><br></td></tr>");
						i++;
					}
				
				out.println("</table>");
				out.println("<br>");
			
			%>
				
		</td></tr>
		</table>
		
		<div id=chiusura>
		</div>
				
</div>
</div>		
</body>	
</html>