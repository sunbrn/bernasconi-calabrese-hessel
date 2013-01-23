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
		<title> Aiuto </title>
	</head>	
	
	<body>
		
		 
					<a href="homePageUtente.jsp"></a><br>
					<H1><u><b> Aiuto </b></u></H1>
					<table width="100%" border="1" >  
						<tr>
							<td align="middle">							
								
								<p> Richiedente: 
								
								
								<% String nomeRich=(String) request.getSession().getAttribute("nomeRichiedente"); %> 
								<%=nomeRich %>
								<% String cognomeRich=(String) request.getSession().getAttribute("cognomeRichiedente"); %>
								<%=cognomeRich %>	
								
								</p> 
								
								<p>	Offerente: 
								
								
								<% String nomeOff=(String) request.getSession().getAttribute("nomeOfferente"); %>
								<%=nomeOff %>
								<% String cognomeOff=(String) request.getSession().getAttribute("cognomeOfferente"); %>
								<%=cognomeOff %>		

								
								</p>
								
								<p>	Competenza: 
																					

								<% String comp=(String) request.getSession().getAttribute("competenzaRichiestaAiuto"); %>
								<%=comp %>
					
								
								</p>
								
								<p>	Data: 
								

								<% 
									Date data=(Date)request.getSession().getAttribute("dataRichiestaAiuto");
									String d=data.toString();
								%>
								<%=d %>

								
								</p>												
									
								<table width="100%" border="1" >
									<tr>
									<td><H5><u><b> Messaggi: </b></u></H5>
									

									<% String mexRich=(String) request.getSession().getAttribute("messaggioRichiedenteAiuto"); %>
									<%=mexRich %>

									</td>
									</tr>
									
									<%
									boolean accettato = (Boolean) request.getSession().getAttribute("accettato");
									if (!accettato) { 
										out.println("<form name=\"Aiuto\" action=\"AnswerHelpRequestServlet\" method=\"get\">"+						
														"<table border=\"0\" cellpadding=\"1\" cellspacing=\"2\" width=\"100%\">"+		
															"<TBODY>"+
																	"<tr><td><H5><u><b> Per accettare l'aiuto inserire una risposta e premere 'submit': </b></u></H5>"+
																	"<textarea cols=\"40\" rows=\"5\" id=\"messaggio_risposta\" name=\"messaggio_risposta\"></textarea><br>"+
																	"<p align=\"middle\"></p>"+
																	"</td></tr>"+
																	"<tr><td align=\"left\"></td>"+
																	"<td align=\"left\" width=\"50%\"> <input type=\"hidden\" value=\"accettato\" name=\"rispostaAiuto\">"+
																	"<input type=\"submit\" style=\"width:70;height: 33\" value=\"submit\">"+
																	"</td></tr>"+
															"</TBODY>"+	
														"</table>"+
													"</form>"+
													"<form name=\"Login\" action=\"AnswerHelpRequestServlet\" method=\"get\">"+					
														"<table border=\"0\" cellpadding=\"1\" cellspacing=\"2\" width=\"100%\">"+
															"<TBODY>"+
																"<tr><td align=\"left\" width=\"0%\"></td>"+
																"<td align=\"left\" width=\"50%\"> <input type=\"hidden\" value=\"rifiutato\" name=\"rispostaAiuto\">"+
																"<input type=\"submit\" style=\"width:70;height: 33\" value=\"rifiuta\">"+
																"</td></tr>	"+
															"</TBODY>"+
														"</table>"+
													"</form>");
									}else {

										
										String mexRisp =(String)request.getSession().getAttribute("messaggioOfferenteAiuto");
										out.println("<tr><td><H5><u><b> Risposta: </b></u></H5>");
										out.println(mexRisp+"</td></tr>");
										
										long userID=(Long)request.getSession().getAttribute("idUser");
										long richiedenteID=(Long)request.getSession().getAttribute("richiedente_ID");
										long helpID=(Long)request.getSession().getAttribute("help_ID");
										
										if(userID==richiedenteID){
											out.println("<form action=\"HelpTerminationServlet?offerente_ID="+userID+"&help_ID="+helpID+"\" method=\"get\"> <input type=\"submit\" value=\"Concludi Aiuto e Inserisci Feedback!\"> </form>");
										}
									}
									
									%>
									
														
									
									
									
									
									
									
								</table>
								
							</td>
						</tr>
					</table> 
					

	</body>
</html>