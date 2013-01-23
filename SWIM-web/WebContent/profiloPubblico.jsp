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
</head>
<body>		
		
		<!-- INIZIO TABELLA ESTERNA --> 
		<table width="100%" height="100%" border="1" frame=void> 
			<tr width="100%" >			
			
				<!-- colonna1 -->
				<td align="middle" width="20%" bgcolor="#007FFF">
					<br><br><br><br><br><br><br><br><br>
					
					<%
					long idProfilo=(Long) request.getSession().getAttribute("idProfilo");
					
					if(request.getSession().getAttribute("idUser")!=null){
						boolean giàAmico=(Boolean) request.getSession().getAttribute("visitedUserStatoAmicizia");
						long idUser=(Long) request.getSession().getAttribute("idUser");
						if(idUser!=idProfilo){
							out.println("<form action=\"homePageUtente.jsp\" method=\"get\"><input type=\"submit\" value=\"Home\"></form><br>");
							out.println("<form action=\"richiediAiuto.jsp\" method=\"get\"><input type=\"submit\" value=\"Richiedi Aiuto\"></form><br>");
							if(!giàAmico){
								out.println("<form action=\"CreateFriendshipRequestServlet\" method=\"get\"><input type=\"submit\" value=\"Richiedi Amicizia\"></form><br>");
							}
						}else if(idUser==idProfilo){
							out.println("<form action=\"homePageUtente.jsp\" method=\"get\"><input type=\"submit\" value=\"Home\"></form><br>");
						}
					}else{
						out.println("<form action=\"index.html\" method=\"get\"><input type=\"submit\" value=\"Home\"></form><br>");
					}
					%>
					
				</td>
					
				<!-- colonna2 -->
				<td align="middle" width="60%" frame=void border="1">
					<table width="100%" height="100%" >  
						
						<!-- PRIMO RIQUADRO -->
						<tr>
							<td width="50%">
								<FONT SIZE="2">
									<H1><u><b>
									<img src="C:\Users\Anna\Dropbox\POLITECNICO\IS1\SWIMv2 HCB\IMPLEMENTAZIONE\SCHERMATE HTML\profiloUtenteNonAmico\utente.jpg" width="90" height="90" align="left" border="5" style="border:medium groove rgb(0, 153, 255)">
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
									%><%=nomeProfilo %> <%=cognomeProfilo %>
									</b></u></H1></FONT>
								<br>
								<br>
							</td>
						</tr>
						
						<!-- SECONDO RIQUADRO -->
						
						<tr>
							<td width="50%">
								<FONT SIZE="3"><b>
									Competenze:
								</b></FONT>
								<br>
								<%
								ArrayList<String> elencoNomiCompetenze= (ArrayList<String>)request.getSession().getAttribute("visitedUserAbilities");
								if(elencoNomiCompetenze.size()!=0){
									out.println("<ul type=\"circle\">");
									for(String s : elencoNomiCompetenze)
									{
										out.println("<li>"+s+"</li>");
										out.println("<br>");
									}						
									out.println("</ul>");
								}else{
									out.println("non ha dichiarato competenze");
								}
									
								
								%>
								<br>
								<br>
								<FONT SIZE="3"><b>
									Informazioni:
								</b></FONT> 
								<ul type="circle"><li> età: <%=etàProfilo %> </li><li>vive a: <%=cittàProfilo%></li><li>mail: <%=mailProfilo %></li><li>diploma: <%=diplomaProfilo%></li><li>laurea: <%=laureaProfilo%></li><li>altro: <%=altroProfilo%></li></ul>
							</td>
						</tr>					
						
						<!-- TERZO RIQUADRO -->						
						<tr width="100%" frame=box border="4" bordercolor=#007FFF>
							<td width="50%" height="100%" bordercolor=#007FFF align="left">
								<h2>&nbsp;Valutazioni</h2><br><br><br><br>
								<ul>
									<li>
										professionalita':
										<%						
											System.out.println("sono in profiloPubblico.jsp e sto per stampare voto professionalità");
	 										int v1= (Integer)request.getSession().getAttribute("visitedUserProf");
	 																									
	 										if (v1==0) out.println("<img src=\"/SWIM-web/Immagini/zero.jpg\" width=\"100\" height=\"20\">");
	 										else if (v1==1) out.println("<img src=\"/SWIM-web/Immagini/uno.jpg\" width=\"100\" height=\"20\">");
	 										else if (v1==2) out.println("<img src=\"/SWIM-web/Immagini/due.jpg\" width=\"100\" height=\"20\">");
	 										else if (v1==3) out.println("<img src=\"/SWIM-web/Immagini/tre.jpg\" width=\"100\" height=\"20\">");
	 										else if (v1==4) out.println("<img src=\"/SWIM-web/Immagini/quattro.jpg\" width=\"100\" height=\"20\">");
	 										else out.println("<img src=\"/SWIM-web/Immagini/cinque.jpg\" width=\"100\" height=\"20\">");
	 									%>
									</li>
									<li>
										disponibilita':
										 <%	
										 	int v2= (Integer)request.getSession().getAttribute("visitedUserDisp");
 																
 											if (v2==0) out.println("<img src=\"/SWIM-web/Immagini/zero.jpg\" width=\"100\" height=\"20\">");
 											else if (v2==1) out.println("<img src=\"/SWIM-web/Immagini/uno.jpg\" width=\"100\" height=\"20\">");
 											else if (v2==2) out.println("<img src=\"/SWIM-web/Immagini/due.jpg\" width=\"100\" height=\"20\">");
 											else if (v2==3) out.println("<img src=\"/SWIM-web/Immagini/tre.jpg\" width=\"100\" height=\"20\">");
 											else if (v2==4) out.println("<img src=\"/SWIM-web/Immagini/quattro.jpg\" width=\"100\" height=\"20\">");
 											else out.println("<img src=\"/SWIM-web/Immagini/cinque.jpg\" width=\"100\" height=\"20\">");
										%>
									</li>
									<li>
										prezzo prestazione:
										<%		
											int v3= (Integer)request.getSession().getAttribute("visitedUserPrez");
																
											if (v3==0) out.println("<img src=\"/SWIM-web/Immagini/zero.jpg\" width=\"100\" height=\"20\">");
											else if (v3==1) out.println("<img src=\"/SWIM-web/Immagini/uno.jpg\" width=\"100\" height=\"20\">");
											else if (v3==2) out.println("<img src=\"/SWIM-web/Immagini/due.jpg\" width=\"100\" height=\"20\">");
											else if (v3==3) out.println("<img src=\"/SWIM-web/Immagini/tre.jpg\" width=\"100\" height=\"20\">");
											else if (v3==4) out.println("<img src=\"/SWIM-web/Immagini/quattro.jpg\" width=\"100\" height=\"20\">");
											else out.println("<img src=\"/SWIM-web/Immagini/cinque.jpg\" width=\"100\" height=\"20\">");
										%>
									</li>
								</ul>
							</td>
							
							<td width="50%" height="100%" bordercolor=#007FFF align="left">
								<h2>
									&nbsp;Commenti:
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
									
									
								</h2>
								<br><br><br><br><br><br><br><br>
							</td>										
						</tr>						
					
					</table> 					
				</td>	
				
				
				<!-- colonna3 -->				
				<td align="middle" width="20%" frame=void border="1" bgcolor="#007FFF">
					<table width="100%" height="100%" bgcolor=#007FFF>  
						
					</table>
				</td>
				
			</tr>
		</table> <!-- FINE TABELLA ESTERNA --> 
		
</body>
</html>