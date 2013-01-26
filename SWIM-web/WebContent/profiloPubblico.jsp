<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.persistence.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collection"%>
<%@page import="swim.sessionbeans.*"%>
<%@page import="swim.entitybeans.*"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> SWIMv2 - Profilo Pubblico </title>
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

			<%
			long idProfilo=(Long) request.getSession().getAttribute("idProfilo");
			
			if(request.getSession().getAttribute("idUser")!=null){
				boolean giàAmico=(Boolean) request.getSession().getAttribute("visitedUserStatoAmicizia");
				long idUser=(Long) request.getSession().getAttribute("idUser");
				if(idUser!=idProfilo){
					out.println("<li><a href=\"homePageUtente.jsp\">Home</a></li>");
					out.println("<li><a href=\"richiediAiuto.jsp\">Richiedi Aiuto</a></li>");
					out.println("<li><a href=\"ShowFriendsServlet?chi="+idProfilo+"\"> Amici </a></li>");
					if(!giàAmico){
						out.println("<li><a href=\"CreateFriendshipRequestServlet\">Richiedi Amicizia</a></li>");
					}
				}else if(idUser==idProfilo){
					out.println("<li><a href=\"homePageUtente.jsp\">Home</a></li>");
				}
			}else if(request.getSession().getAttribute("admin")!=null){
				out.println("<a href=\"ShowAbilityRequestServlet\"> Torna alla lista</a>");
			}else{
				out.println("<li><a href=\"index.html\">Home</a></li>");
			}
			%>
					
			</ul>
		</div>
				
			<div id="left">
					<table width="100%" height="100%" cellpadding="10px">
					<tr>
									<td width="15px"></td>
					<!-- IMMAGINE E NOME UTENTE -->
									
									<td width="15px" align="left">
									<img src="/SWIM-web/ImmaginiNuove/utente.png" width="90px" height="90px" align="left" border="5" style="border:medium groove rgb(0, 153, 255)">
									</td>
									<td width="10px" align="left"></td>    
									<td>
									<%
									User u= (User)request.getSession().getAttribute("visitedUser"); 
									String nomeProfilo=u.getNome();
									String cognomeProfilo=u.getCognome();
									String etàProfilo=Integer.toString(u.getData_nascita());
									String cittàProfilo=u.getCittà();
									String mailProfilo=u.getMail();
									String diplomaProfilo=u.getDiploma();
									String laureaProfilo=u.getLaurea();
									String altroProfilo=u.getAltro();
									%>Profilo di:   <H1><b><%=nomeProfilo %> <%=cognomeProfilo %>
									</b></H1>
									<br>
									</td>
					</tr>
					</table>
					
						<!-- COMPETENZE E INFO -->
						
						<div class="testo">
						<table width="600px" cellpadding="20px">
								<tr>
								<td>
								<FONT SIZE="3"><br><br><b>
									Competenze:
								</b></FONT>
								<br>
								<div>
								<%
								ArrayList<String> elencoNomiCompetenze= (ArrayList<String>)request.getSession().getAttribute("visitedUserAbilities");
								if(elencoNomiCompetenze.size()!=0){
									out.println("<ul type=\"circle\">");
									for(String s : elencoNomiCompetenze)
									{
										out.println("<li>"+s+"</li>");
									}						
									out.println("</ul>");
								}else{
									out.println("non ha dichiarato competenze");
								}
									
								
								%>
								</div>
								</td>
								</tr>
							
							<tr>
							<td><br><br><br>
									
									<FONT SIZE="3"><b>
									Informazioni:</b></FONT><br> 
									Età: <%=etàProfilo %> <br>
									Vive a: <%=cittàProfilo%> <br>
									Mail: <%=mailProfilo %> <br>
									<%if(!diplomaProfilo.equals("")){ out.println("Diploma: "+diplomaProfilo+"<br>");}%>
									<%if(!laureaProfilo.equals("")){ out.println("Laurea: "+laureaProfilo+"<br>");}%>
									<%if(!altroProfilo.equals("")){ out.println("Descrizione personale: "+altroProfilo+"<br>");}%>
							
							</td>
							</tr>					
						</table>
						</div>
						
						<br>
						
						
						<!-- TERZO RIQUADRO -->	
						<div class="testo">
						<table width="600px">			
                			<tr  width="600px">
                			<td width="250px" height="250px">
									<table width="100%" height="250px" style="border: 5px solid #004eff">
									<tr>
									<td width="20px"></td>
									<td valign="top"  align="left">
									<h2 align="center">Valutazioni</h2><br>
						
									<h4> Professionalita': </h4> 
										<%						
											
	 										int v1= (Integer)request.getSession().getAttribute("visitedUserProf");
	 																									
	 										if (v1==0) out.println("<img src=\"/SWIM-web/Immagini/zero.jpg\" width=\"100\" height=\"20\">");
	 										else if (v1==1) out.println("<img src=\"/SWIM-web/Immagini/uno.jpg\" width=\"100\" height=\"20\">");
	 										else if (v1==2) out.println("<img src=\"/SWIM-web/Immagini/due.jpg\" width=\"100\" height=\"20\">");
	 										else if (v1==3) out.println("<img src=\"/SWIM-web/Immagini/tre.jpg\" width=\"100\" height=\"20\">");
	 										else if (v1==4) out.println("<img src=\"/SWIM-web/Immagini/quattro.jpg\" width=\"100\" height=\"20\">");
	 										else out.println("<img src=\"/SWIM-web/Immagini/cinque.jpg\" width=\"100\" height=\"20\">");
	 									%>
									<br><br>
						
									<h4> Disponibilita': </h4> 
										 <%	
										 	int v2= (Integer)request.getSession().getAttribute("visitedUserDisp");
 																
 											if (v2==0) out.println("<img src=\"/SWIM-web/Immagini/zero.jpg\" width=\"100\" height=\"20\">");
 											else if (v2==1) out.println("<img src=\"/SWIM-web/Immagini/uno.jpg\" width=\"100\" height=\"20\">");
 											else if (v2==2) out.println("<img src=\"/SWIM-web/Immagini/due.jpg\" width=\"100\" height=\"20\">");
 											else if (v2==3) out.println("<img src=\"/SWIM-web/Immagini/tre.jpg\" width=\"100\" height=\"20\">");
 											else if (v2==4) out.println("<img src=\"/SWIM-web/Immagini/quattro.jpg\" width=\"100\" height=\"20\">");
 											else out.println("<img src=\"/SWIM-web/Immagini/cinque.jpg\" width=\"100\" height=\"20\">");
										%>
									<br><br>
						
									<h4> Prezzo Prestazione: </h4> 
										<%		
											int v3= (Integer)request.getSession().getAttribute("visitedUserPrez");
																
											if (v3==0) out.println("<img src=\"/SWIM-web/Immagini/zero.jpg\" width=\"100\" height=\"20\">");
											else if (v3==1) out.println("<img src=\"/SWIM-web/Immagini/uno.jpg\" width=\"100\" height=\"20\">");
											else if (v3==2) out.println("<img src=\"/SWIM-web/Immagini/due.jpg\" width=\"100\" height=\"20\">");
											else if (v3==3) out.println("<img src=\"/SWIM-web/Immagini/tre.jpg\" width=\"100\" height=\"20\">");
											else if (v3==4) out.println("<img src=\"/SWIM-web/Immagini/quattro.jpg\" width=\"100\" height=\"20\">");
											else out.println("<img src=\"/SWIM-web/Immagini/cinque.jpg\" width=\"100\" height=\"20\">");
										%>
									<br><br>
									</td></tr>
									</table>
							</td>
							
							<td width="350px" height="250px">
									<table width="350px" height="250px" style="border: 5px solid #004eff">
									<tr><td width="20px" valign="top"  align="left">
									<h2 align="center">Commenti</h2><br>
									<%
										Collection<String> elencoCommenti= (Collection<String>)request.getSession().getAttribute("visitedUserComments");
											out.println("ci sono "+elencoCommenti.size()+" commenti <br> <br>");
											if(elencoCommenti.size()!=0){
												for (String s:elencoCommenti){									
													out.println("Commento: ");
													out.println(s);
													out.println("<br><br>");
												}
											}
									%>							
									</td></tr>	
									</table>
							</td>									
							</tr>						
						</table>
						</div> 						
			</div>	
			<div id="right">
				<%if(request.getSession().getAttribute("idUser")!=null){
					
					out.println("<div id=\"right\" align=\"center\">"+	
										
							"<div class=\"search\" align=\"center\">"+				
			
											"<form name=\"Cerca_persone\" action=\"ShowSearchResultsServlet\" method=\"get\">"+
													"<br><br>"+
													"<p><INPUT id=\"nomeCercato\" name=\"nomeCercato\" style=\"height: 33\" type=\"text\" value=\"\"></p>Nome"+
													"<p><INPUT id=\"cognomeCercato\" name=\"cognomeCercato\" style=\"height: 33\" type=\"text\" value=\"\"></p>Cognome"+
													"<br>"+
													"<p><input type=\"submit\" style=\"width:70;height: 33\" value=\"submit\"></p>"+
													"<br>"+
													"<p><INPUT id=\"competenzaCercata\" name=\"competenzaCercata\" style=\"height: 33\" type=\"text\" value=\"\r\"></p>Competenza"+
													"<br>"+
													"<p><input type=\"submit\" style=\"width:70;height: 33\" value=\"submit\"></p>"+
													"<br>"+
													"<input type=\"radio\" name=\"check\" value=\"fraTutti\" checked> Cerca fra Tutti <br>"+
													"<input type=\"radio\" name=\"check\" value=\"soloFraAmici\"> Cerca solo fra Amici <br>"+
											"</form>"+				
			             	"</div></div>");
             	
             	}
				%>
			</div>
			
			
	</div>
	</div>
					
		
</body>
</html>