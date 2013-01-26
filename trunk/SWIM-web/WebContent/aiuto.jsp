<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.persistence.*"%>
<%@page import="javax.persistence.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Date"%>
<%@page import="swim.sessionbeans.*"%>    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title> Aiuto </title>
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
            </ul>
		</div>
		
		<div id="center">
		<table style="border: 1px solid #004eFF" width="100%">
		 
			
			<tr>
				<td align="center">							
					<p><H1><u><b> Aiuto </b></u></H1> 
					</p>
					<br>
					
					<p> Richiedente: 
					
					
					<% String nomeRich=(String) request.getSession().getAttribute("nomeRichiedente"); %> 
					<%=nomeRich %>
					<% String cognomeRich=(String) request.getSession().getAttribute("cognomeRichiedente"); %>
					<%=cognomeRich %>	
					
					</p> 
					<br>
					<p>	Offerente: 
					
					 
					<% String nomeOff=(String) request.getSession().getAttribute("nomeOfferente"); %>
					<%=nomeOff %>
					<% String cognomeOff=(String) request.getSession().getAttribute("cognomeOfferente"); %>
					<%=cognomeOff %>		

					
					</p>
					<br>
					<p>	Competenza: 
																		

					<% String comp=(String) request.getSession().getAttribute("competenzaRichiestaAiuto"); %>
					<%=comp %>
		
					
					</p>
					<br>
					<p>	Data: 
					

					<% 
						Date data=(Date)request.getSession().getAttribute("dataRichiestaAiuto");
						String d=data.toString();
						String dCorta = d.substring(0, Math.min(d.length(), 16));  
						
						
					%>
					<%=dCorta %>

					
					</p>												
					<br>
					<p>	Messaggio richiesta: 
						

						<% String mexRich=(String) request.getSession().getAttribute("messaggioRichiedenteAiuto"); %>
						<%=mexRich %>

					</p>
					<br>
					
						
						<%
						boolean accettato = (Boolean) request.getSession().getAttribute("accettato");
						if (!accettato) { 
							out.println("<p><form name=\"Aiuto\" action=\"AnswerHelpRequestServlet\" method=\"get\">"+						
											"<table border=\"0\" cellpadding=\"1\" cellspacing=\"2\" width=\"100%\">"+		
												"<TBODY>"+
														"<tr><td>Per accettare l'aiuto inserire una risposta e premere 'submit':"+
														"<textarea cols=\"70\" rows=\"5\" id=\"messaggio_risposta\" name=\"messaggio_risposta\"></textarea><br>"+
														"</td></tr>"+
														"<tr><td><input type=\"hidden\" value=\"accettato\" name=\"rispostaAiuto\"><br>"+
														"<input type=\"submit\" style=\"width:80;height: 33\" value=\" submit \">"+
														"</td></tr>"+
												"</TBODY>"+	
											"</table>"+
										"</form></p>"+
										"<p><form name=\"Login\" action=\"AnswerHelpRequestServlet\" method=\"get\">"+					
											"<table border=\"0\" cellpadding=\"1\" cellspacing=\"2\" width=\"100%\">"+
												"<TBODY>"+
													"<tr><td width=\"50%\"> <input type=\"hidden\" value=\"rifiutato\" name=\"rispostaAiuto\">"+
													"<input type=\"submit\" style=\"width:80;height: 33\" value=\" rifiuta \">"+
													"</td></tr>	"+
												"</TBODY>"+
											"</table>"+
										"</form></p>");
						}else {

							
							String mexRisp =(String)request.getSession().getAttribute("messaggioOfferenteAiuto");
							out.println("<p>Messaggio risposta:");
							out.println(mexRisp+"</p>");
							
							long userID=(Long)request.getSession().getAttribute("idUser");
							long richiedenteID=(Long)request.getSession().getAttribute("richiedente_ID");
							long helpID=(Long)request.getSession().getAttribute("help_ID");
							
							if(userID==richiedenteID){
								out.println("<br><p><form action=\"HelpTerminationServlet\" method=\"get\"><input type=\"submit\" value=\" Concludi aiuto e inserisci Feedback \"> </form></p>");
							}
						}
						
						%>

				</td>
			</tr>
		</table> 
		</div>
		
		<div id=chiusura>
		</div>
		
	</div>				
	</div>
	</body>
</html>