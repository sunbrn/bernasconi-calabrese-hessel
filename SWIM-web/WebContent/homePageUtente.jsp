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
	        <a href="ShowFriendsServlet">Amici </a>
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
		
		<form action="LogoutServlet" method="post">
			<input type="submit" value="Log-Out">
		</form>
		
		<div id="left">
          <table cellpadding="10">
          <tr>
          <td>
  		<!-- IMMAGINE E NOME UTENTE -->
          <H1><u><b>
             <img src="SWIM-web/ImmaginiNuove/utente.png" width="90" height="90" align="left" border="5" style="border:medium groove rgb(0, 153, 255)">
          
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
			    
          </b></u></H1><br>
          </td>
          </tr>
		<!-- COMPETENZE E INFO -->
          <tr>
          <td >
          	<table cellpadding="20" >
          	<tr>
          	<td >
              	<FONT SIZE="3"><b>Competenze:</b></FONT> <a href="DeclareAbilityServlet?param=ciao">Aggiungi</a>
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
              	<FONT SIZE="3"><b>Informazioni:</b></FONT> 
              	<a href="modificaDati.jsp">Modifica</a><br>
              	<ul type="circle">
                  <li > età: </li>
                  <li> vive a: </li>
                  <li> mail: </li>
                  <li> diploma: </li>
                  <li> laurea: </li>
                  <li> altro: </li>
              	</ul>
                  
          </td>
          </tr>
          </table>
				
			<br><br><br><br>						
						
			<!-- TERZO RIQUADRO -->						
			<table width="600px" cellpadding="20">			
			
                <tr  width="100%" frame=box border="4"  bordercolor=#004eff>
				
                    <td width="40%"  valign="top"  bordercolor=#004eff align="left">
					<h2>Valutazioni</h2><br>
					<ul>
						<li><h4> Professionalita': </h4> 
						
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
				<td width="60%" valign="top" bordercolor=#004eff align="left">
					<h2>Commenti</h2><br>
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
				
						
				<div class="title">
				<h3>Richieste<br>all'Amministratore</h3>
				</div>		
					<%
						int k=1;
						ArrayList<Richieste_agg_comp> mieRichieste=(ArrayList<Richieste_agg_comp>) request.getSession().getAttribute("UserRequestToAdmin");
						if(mieRichieste!=null){
							for(Richieste_agg_comp r : mieRichieste){
								out.println(i+". ");
								out.println(r.getTesto_richiesta());
								if(r.getStato().equals("accettata")){
									out.println("<img src=\"/SWIM-web/ImmaginiNuove/pallino_verde.gif\">");
								}else if(r.getStato().equals("attesa")){
									out.println("<img src=\"/SWIM-web/ImmaginiNuove/pallino_giallo.gif\">");
								}else if(r.getStato().equals("rifiutata")){
									out.println("<img src=\"/SWIM-web/ImmaginiNuove/pallino_giallo.gif\">");
								}
							}
						}else{
							out.println("non hai inviato richieste all'Admin");
						}
					%>
							
			</div>
		</div>
		</div>
	</body>
	</html>
