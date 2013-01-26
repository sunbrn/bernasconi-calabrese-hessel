<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>				
		
		<%
			long idUser=(Long) request.getSession().getAttribute("idUser");
			User u = (User) request.getSession().getAttribute("User");
		%>
		
		
<div id="cont">
<div id="layout">
	
		<div id="header">
			<img src="/SWIM-web/ImmaginiNuove/logo.png" alt="mio logo" 	class="logo" /> 
		</div>
		
		<div id="nav">	 
	        <ul>
	        <li>
	        <a href="LogoutServlet">Log-Out</a>
	        </li>
	        <li>
	        <a href="ShowFriendsServlet?chi=<%=+idUser%>">Amici </a>
	        </li>
	        <li>
	        <a href="HelpRequestListServlet">Richieste d'Aiuto </a>
	        </li>
	        <li>
	        <a href="ShowFriendsRequestSuggestionsServlet">Nuovi Amici</a>
	        </li>
	        <li>
	        <a href="RemoveProfileServlet">Elimina Profilo</a>
	        </li>
	        </ul>
		</div>
		
		
		<div id="left">
          <table>
          <tr>
          <td width="10px"></td>
  		<!-- IMMAGINE E NOME UTENTE -->
                    
            <td><img src="/SWIM-web/ImmaginiNuove/utente.png" width="90px" height="90px" align="left" border="5" style="border:medium groove rgb(0, 153, 255)">
			</td>
			<td width="10px"></td>          
          	<td>
			<%
			String nome = u.getNome();
			String cognome = u.getCognome();
			String età = Long.toString(u.getData_nascita());
			String città = u.getCittà();
			String mail = u.getMail();
			String diploma = u.getDiploma();
			String laurea = u.getLaurea();
			String altro = u.getAltro();
			%>
			
			<b><FONT size="7"><%=nome %> <%=cognome %>   </FONT>   
		  </b>
          <br>
          </td>
          </tr>
          
          
		<!-- COMPETENZE E INFO -->
          <tr>
          <td >
          	<div class="testo">
          	<table cellpadding="20px" >
          	<tr>
          	<td>
          	
              	<FONT SIZE="3"><br><br><b>Competenze:</b></FONT> <a href="DeclareAbilityServlet?param=ciao">Aggiungi</a>
														 <a href="rimuoviCompetenza.jsp">Elimina</a><br>		
				<div>
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
				</div>
			</td>
			</tr>
			</table>
			</div>
			
			<div class="testo">
				<br><br><br>
              	<FONT SIZE="3"><b>Informazioni:</b></FONT> <a href="modificaDati.jsp">Modifica</a><br>
							
								Età: <%=età%> <br>
								Vive a: <%=città%> <br>
								Mail: <%=mail%> <br>
								Diploma: <%=diploma%> <br>
								Laurea: <%=laurea%> <br>
								Descrizione personale: <%=altro%><br>
							
            </div>     
          </td>
          </tr>
          </table>

		  	
			<br><br><br><br>						
						
			<!-- TERZO RIQUADRO -->	
			<div class="testo">		
					
			<table width="600px">			
                <tr width="600px">
                    <td width="250px" height="400px">
                    <table width="100%" height="400px" style="border: 5px solid #004eff">
					<tr><td width="20px"></td><td valign="top"  align="left">
					<h2 align="center">Valutazioni</h2><br>
						
						<h4> Professionalita': </h4> 
						
						<%
								long id=(Long) request.getSession().getAttribute("idUser");
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
						<br><br>
						
						<h4> Disponibilita': </h4> 
						<%													
									if (v2==0) out.println("<img src=\"/SWIM-web/Immagini/zero.jpg\" width=\"100\" height=\"20\">");
									else if (v2==1) out.println("<img src=\"/SWIM-web/Immagini/uno.jpg\" width=\"100\" height=\"20\">");
									else if (v2==2) out.println("<img src=\"/SWIM-web/Immagini/due.jpg\" width=\"100\" height=\"20\">");
									else if (v2==3) out.println("<img src=\"/SWIM-web/Immagini/tre.jpg\" width=\"100\" height=\"20\">");
									else if (v2==4) out.println("<img src=\"/SWIM-web/Immagini/quattro.jpg\" width=\"100\" height=\"20\">");
									else if (v2==5) out.println("<img src=\"/SWIM-web/Immagini/cinque.jpg\" width=\"100\" height=\"20\">");
							%>	
						<br><br>
						
						<h4> Prezzo Prestazione: </h4> 
						<%																		
									if (v3==0) out.println("<img src=\"/SWIM-web/Immagini/zero.jpg\" width=\"100\" height=\"20\">");
									else if (v3==1) out.println("<img src=\"/SWIM-web/Immagini/uno.jpg\" width=\"100\" height=\"20\">");
									else if (v3==2) out.println("<img src=\"/SWIM-web/Immagini/due.jpg\" width=\"100\" height=\"20\">");
									else if (v3==3) out.println("<img src=\"/SWIM-web/Immagini/tre.jpg\" width=\"100\" height=\"20\">");
									else if (v3==4) out.println("<img src=\"/SWIM-web/Immagini/quattro.jpg\" width=\"100\" height=\"20\">");
									else if (v3==5) out.println("<img src=\"/SWIM-web/Immagini/cinque.jpg\" width=\"100\" height=\"20\">");
							%>
						<br><br>
				</td></tr>
				</table>
				</td>
				<td width="350px" height="400px">
				<table width="350px" height="400px" style="border: 5px solid #004eff">
				<tr><td width="20px"></td><td valign="top"  align="left">
					<h2 align="center">Commenti</h2><br>
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
							out.println("Non ci sono commenti");
						}
					%>
										
				</td></tr>	
				</table>
				</td>									
				</tr>						
				</table>
				</div> 						
			</div>	
			
			<div id="right" align="center">	
				<!-- CERCA PERSONE -->				
				<div class="search" align="center">				

								<form name="Cerca_persone" action="ShowSearchResultsServlet" method="get">
										<br><br>
										<p><INPUT id="nomeCercato" name="nomeCercato" style="height: 33" type="text" value=""></p>Nome
										<p><INPUT id="cognomeCercato" name="cognomeCercato" style="height: 33" type="text" value=""></p>Cognome
										<br>
										<p><input type="submit" style="width:70;height: 33" value="submit"></p>
										<br>
										<p><INPUT id="competenzaCercata" name="competenzaCercata" style="height: 33" type="text" value=""></p>Competenza
										<br>
										<p><input type="submit" style="width:70;height: 33" value="submit"></p>
										<br>
										<input type="radio" name="check" value="fraTutti" checked> Cerca fra Tutti <br>
										<input type="radio" name="check" value="soloFraAmici"> Cerca solo fra Amici <br>
								</form>				
             	</div>	
						
				<!-- SECONDO RIQUADRO -->
				<div class="title">
				<h3>Aiuti attivi</h3>
				</div>	
						<%
						int i=1;
						ArrayList<Aiuto> elencoAiuti = (ArrayList<Aiuto>) request.getSession().getAttribute("UserActiveHelps");
						ArrayList<User> elencoClienti = (ArrayList<User>) request.getSession().getAttribute("UserHelpClients");
						if(elencoAiuti!=null){
							out.println("ci sono "+elencoAiuti.size()+" aiuti attivi <br> <br>");
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
				
						
				<div class="title">
				<h3>Richieste<br>all'Amministratore</h3>
				</div>		
					<%
						int k=1;
						ArrayList<Richieste_agg_comp> mieRichieste=(ArrayList<Richieste_agg_comp>) request.getSession().getAttribute("UserRequestToAdmin");
						if(mieRichieste!=null){
							if(mieRichieste.size()!=0){
								for(Richieste_agg_comp r : mieRichieste){
									out.println(i+". ");
									out.println(r.getTesto_richiesta());
									if(r.getStato().equals("accettata")){
										out.println("<img src=\"/SWIM-web/ImmaginiNuove/pallino_verde.gif\">");
									}else if(r.getStato().equals("attesa")){
										out.println("<img src=\"/SWIM-web/ImmaginiNuove/pallino_giallo.gif\">");
									}else if(r.getStato().equals("rifiutata")){
										out.println("<img src=\"/SWIM-web/ImmaginiNuove/pallino_rosso.gif\">");
									}
								}
							}else{
								out.println("non hai inviato richieste all'Admin");
							}
						}else{
							out.println("non hai inviato richieste all'Admin");
						}
					%>
							
			</div>
			
			<div id=chiusura>
			</div>
			
		</div>
		</div>
	</body>
	</html>
