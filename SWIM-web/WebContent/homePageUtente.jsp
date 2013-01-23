 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.persistence.*"%>
<%@page import="javax.persistence.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collection"%>
<%@page import="swim.entitybeans.*"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>HomePageUtente</title>
	</head>
	
	<body>				
		
		<!-- INIZIO TABELLA ESTERNA --> 
		<table width="100%" height="100%" border="1" frame=void> 
			<tr width="100%" >			
			
				<!-- colonna1 -->				
				<td align="middle" width="20%" bgcolor=#007FFF>
					<br><br><br><br><br><br><br><br>
					
					<form action="ShowFriendsServlet" method="get">
					<input type="submit" value="Amici">
					</form>
					<br>
					<form action="HelpRequestListServlet" method="get">
					<input type="submit" value="Richieste d'Aiuto">
					</form>
					<br>
					<form action="ShowFriendsRequestSuggestionsServlet" method="post">
					<input type="submit" value="Richieste e Suggerimenti Amicizia">
					</form>
					<br>
					<form action="LogoutServlet" method="post">
					<input type="submit" value="Log-Out">
					</form>
					<br>
					<form action="RemoveProfileServlet" method="get">
					<input type="submit" value="Elimina Profilo Swim">
					</form>
				</td>
					
				<!-- colonna2 -->
				<td align="middle" width="60%" frame=void border="1">
					<table width="100%" height="100%" >  
						
						<!-- PRIMO RIQUADRO -->
						<tr>
							<td width="50%">
								<FONT SIZE="2"><H1><u><b>
									<img src="C:\Users\Anna\Dropbox\POLITECNICO\IS1\SWIMv2 HCB\IMPLEMENTAZIONE\SCHERMATE HTML\HomePageUtente\fotoanna.jpg" width="90" height="90" align="left" border="5" style="border:medium groove rgb(0, 153, 255)">
									<%
									User u = (User) request.getSession().getAttribute("User");
									String nome = u.getNome();
									String cognome = u.getCognome();
									String età = Long.toString(u.getData_nascita());
									String città = u.getCittà();
									String mail = u.getMail();
									String diploma = u.getDiploma();
									String laurea = u.getLaurea();
									String altro = u.getAltro();
									
									%><%=nome %> <%=cognome %>
									</b></u></H1></FONT>
									<br>
							</td>
						</tr>
				
						<!-- SECONDO RIQUADRO -->
						<tr>
							<td width="50%">
							<FONT SIZE="3"><b>Competenze:</b><a href="DeclareAbilityServlet?param=ciao" align="right">Aggiungi</a><br>
															 <a href="rimuoviCompetenza.jsp" align="right">Elimina</a><br>
							<ul type="circle">
								<% ArrayList<String> elencoCompetenze=(ArrayList<String>)request.getSession().getAttribute("UserAbilities"); 
									if(elencoCompetenze==null){
										out.println("non hai dichiarato nessuna competenza");
									}else{
										for(String competenza:elencoCompetenze){
											out.println("<li>"+competenza+"</li>");
										}
									}
								%>
							</ul>
							<FONT SIZE="3"><b>Informazioni:</b></FONT> <a href="modificaDati.jsp" align="right">Modifica</a><br>
							<ul type="circle">
							
								<li> età: <%=età%> </li>
								<li> vive a: <%=città%></li>
								<li> mail: <%=mail%></li>
								<li> diploma: <%=diploma%></li>
								<li> laurea: <%=laurea%></li>
								<li> altro: <%=altro%></li>
							</ul>
							</td>
						</tr>					
						
						<!-- TERZO RIQUADRO -->						
						<tr width="100%" frame=box border="4" bordercolor=#007FFF>
							<td width="50%" height="100%" bordercolor=#007FFF align="left">
								<h2>&nbsp;Valutazioni</h2><br>
								<ul>
									<li><h4> Professionalita': </h4> 
									
									<%
											long id=(Long) request.getSession().getAttribute("user_ID");
 											int v1=0;
 											int v2=0;
 											int v3=0;
 											
 											if(request.getSession().getAttribute("UserProf")!=null){
												v1=(Integer) request.getSession().getAttribute("UserProf");
											}
 											if(request.getSession().getAttribute("UserDisp")!=null){
 												v2=(Integer) request.getSession().getAttribute("UserDisp");	
 											}
											if(request.getSession().getAttribute("UserPrez")!=null){
												v3=(Integer) request.getSession().getAttribute("UserPrez");	
											}
 																					
 											if (v1==0) out.println("<img src=\"/SWIM-web/Immagini/zero.jpg\" width=\"100\" height=\"20\">");
 											else if (v1==1) out.println("<img src=\"/SWIM-web/Immagini/uno.jpg\" width=\"100\" height=\"20\">");
 											else if (v1==2) out.println("<img src=\"/SWIM-web/Immagini/due.jpg\" width=\"100\" height=\"20\">");
 											else if (v1==3) out.println("<img src=\"/SWIM-web/Immagini/tre.jpg\" width=\"100\" height=\"20\">");
 											else if (v1==4) out.println("<img src=\"/SWIM-web/Immagini/quattro.jpg\" width=\"100\" height=\"20\">");
 											else if (v1==5) out.println("<img src=\"/SWIM-web/Immagini/cinque.jpg\" width=\"100\" height=\"20\">");
 									%>
									
									<li><h4> Disponibilita': </h4> 
									<%													
 											if (v2==0) out.println("<img src=\"/SWIM-web/Immagini/zero.jpg\" width=\"100\" height=\"20\">");
 											else if (v2==1) out.println("<img src=\"/SWIM-web/Immagini/uno.jpg\" width=\"100\" height=\"20\">");
 											else if (v2==2) out.println("<img src=\"/SWIM-web/Immagini/due.jpg\" width=\"100\" height=\"20\">");
 											else if (v2==3) out.println("<img src=\"/SWIM-web/Immagini/tre.jpg\" width=\"100\" height=\"20\">");
 											else if (v2==4) out.println("<img src=\"/SWIM-web/Immagini/quattro.jpg\" width=\"100\" height=\"20\">");
 											else if (v2==5) out.println("<img src=\"/SWIM-web/Immagini/cinque.jpg\" width=\"100\" height=\"20\">");
 									%>	
									
									
									<li><h4> Prezzo Prestazione: </h4> 
									<%																		
 											if (v3==0) out.println("<img src=\"/SWIM-web/Immagini/zero.jpg\" width=\"100\" height=\"20\">");
 											else if (v3==1) out.println("<img src=\"/SWIM-web/Immagini/uno.jpg\" width=\"100\" height=\"20\">");
 											else if (v3==2) out.println("<img src=\"/SWIM-web/Immagini/due.jpg\" width=\"100\" height=\"20\">");
 											else if (v3==3) out.println("<img src=\"/SWIM-web/Immagini/tre.jpg\" width=\"100\" height=\"20\">");
 											else if (v3==4) out.println("<img src=\"/SWIM-web/Immagini/quattro.jpg\" width=\"100\" height=\"20\">");
 											else if (v3==5) out.println("<img src=\"/SWIM-web/Immagini/cinque.jpg\" width=\"100\" height=\"20\">");
 									%>
							</ul>
							</td>
							<td width="50%" height="100%" bordercolor=#007FFF align="left">
								<h2>&nbsp;Commenti</h2><br>
								<%	
									Collection<String> elencoCommenti= (Collection<String>) request.getSession().getAttribute("UserComments");
									if(elencoCommenti!=null){
										out.println("ci sono "+elencoCommenti.size()+" commenti <br> <br>");
										for (String s: elencoCommenti){									
											out.println("Commento: ");
											out.println(s);
											out.println("<br>");
										}
									}else{
										out.println("non ci sono commenti <br> <br>");
									}
								%>
													
								<br><br><br><br><br><br><br><br>
						
	</td>										
						</tr>						
					
					</table> 					
				</td>	
				
				
				<!-- colonna3 -->				
				<td align="middle" width="20%" frame=void border="1">
					<table height="100%" bgcolor=#007FFF>  
					
						<!-- PRIMO RIQUADRO -->
						<tr width="10%" frame=box border="4" bordercolor=#007FFF bgcolor=#007FFF>
							<td  frame=box border="4" bordercolor=#007FFF>						
							<table>
							<tr>
							<td>
								<form name="Cerca_persone" action="ShowSearchResultsServlet" method="get">
								<div>
										<INPUT id="nomeCercato" name="nomeCercato" style="height: 33" type="text" value="">Nome
										<INPUT id="cognomeCercato" name="cognomeCercato" style="height: 33" type="text" value="">Cognome
										<input type="submit" style="width:70;height: 33" value="submit">
										<br>
										<INPUT id="competenzaCercata" name="competenzaCercata" style="height: 33" type="text" value="">Competenza
										<input type="submit" style="width:70;height: 33" value="submit">
										<br>
										<input type="radio" name="check" value="fraTutti" checked> Cerca fra Tutti <br>
										<input type="radio" name="check" value="soloFraAmici"> Cerca solo fra Amici <br>
								</div>
								</form>	

							</td></tr>
							</table>
							</td>
						</tr>	
						
						<!-- SECONDO RIQUADRO -->
						<tr width="50%" height="100%"  frame=box border="4" bordercolor=#007FFF>
						<td bordercolor=#007FFF bgcolor=#FFFFFF>
							
							<h3>&nbsp;Aiuti attivi</h3>
							
								<%
								int i=1;
								ArrayList<Aiuto> elencoAiuti = (ArrayList<Aiuto>) request.getSession().getAttribute("UserActiveHelps");
								ArrayList<User> elencoClienti = (ArrayList<User>) request.getSession().getAttribute("UserHelpClients");
								if(elencoAiuti!=null){
									out.println("ci sono "+elencoAiuti.size()+" commenti <br> <br>");
									for (Aiuto a: elencoAiuti){
										String nomeCliente=elencoClienti.get(i-1).getNome();
										String cognomeCliente=elencoClienti.get(i-1).getCognome();
										long idCliente=elencoClienti.get(i-1).getUser_ID();
										long idAiuto=a.getHelp_ID();
										out.println("<p> Aiuto attivo: N."+i+"</p>");
										out.println("<p>"+nomeCliente+cognomeCliente+"</p>");
										out.println("<p><form action=\"HelpPageServlet\" method=\"get\"><input type=\"hidden\" value=\""+idAiuto+"\" name=\"help_ID\"><input type=\"submit\" value=\"Ask!\"> </form></p>");
										out.println("<br>");
										i=i+1;
									}
								}else{
									out.println("non ci sono aiuti attivi <br> <br><br><br><br><br><br><br><br>");
								}
								%>
						</td>
						
						<td bordercolor=#007FFF bgcolor=#FFFFFF>
							<h3>&nbsp;Richieste all'Amministratore</h3>
							
							<%
							%>
							
						</td>
						</tr>
					</table>
				</td>
				
			</tr>
		</table> <!-- FINE TABELLA ESTERNA --> 
		
	</body>
	</html>
