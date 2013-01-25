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
					
				<!-- colonna2 -->
					<table width="100%" height="100%" >  
						
						<!-- PRIMO RIQUADRO -->
						<tr>
							<td width="50%">
									<H1><u><b>
									<img src="SWIM-web" width="90" height="90" align="left" border="5" style="border:medium groove rgb(0, 153, 255)">
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
									</b></u></H1>
								<br>
								<br>
							</td>
						</tr>
						</table>
						<!-- SECONDO RIQUADRO -->
						<div class="testo">
						<table>
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
								<FONT SIZE="3"><b>
									Informazioni:
								</b></FONT> 
								<ul type="circle">
								<li> età: <%=etàProfilo %> </li>
								<li>vive a: <%=cittàProfilo%></li>
								<li>mail: <%=mailProfilo %></li>
								<li>diploma: <%=diplomaProfilo%></li>
								<li>laurea: <%=laureaProfilo%></li>
								<li>altro: <%=altroProfilo%></li>
								</ul>
							</td>
						</tr>					
						</table>
						
						
						
						<!-- TERZO RIQUADRO -->	
						<table width="600px" cellpadding="20px">			
                		<tr  width="100%" frame=box border="4"  bordercolor=#004eff>
                		<td width="250px"  valign="top"  bordercolor=#004eff align="left">
								<h2 align="center">Valutazioni</h2><br>
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
							
							<td width="350px" valign="top" bordercolor=#004eff align="left" cellpadding="20px">
								<h2>
									Commenti:
								</h2>
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
									
									
								
								<br><br><br><br><br><br><br><br>
							</td>										
						</tr>						
					
					</table> 	
					</div>				
		</div>
		</div>
					
		
</body>
</html>