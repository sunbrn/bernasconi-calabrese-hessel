<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.naming.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="swim.entitybeans.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> SWIMv2 - Richieste e Consigli di Amicizia</title>
</head>
<body>
		
					<a href="homePageUtente.jsp"> Home </a>
					<br>
					
				<td align="middle" width="40%" frame=void border="1">
								<h3>&nbsp;Richieste di amicizia:</h3>
								<%
									ArrayList<User> richiesteAmicizia= (ArrayList<User>) request.getSession().getAttribute("richiesteAmicizia");
									
									if(richiesteAmicizia.size()!=0){
										for(User u : richiesteAmicizia){
											String nomeRichiesta = u.getNome();
											String cognomeRichiesta = u.getCognome();
											String nascitaRichiesta = Integer.toString(u.getData_nascita());
											String s=Long.toString(u.getUser_ID());
											
											out.println("<p>");
											out.println(nomeRichiesta+"  ");
											out.println(cognomeRichiesta+"  "+nascitaRichiesta);
											out.println("</p>");
											out.println("<p><form action=\"ShowUserProfileServlet\" method=\"get\"><input type=\"hidden\" value=\""+s+"\" name=\"idProfilo\"><input type=\"submit\" value=\"Visualizza Profilo\"> </form></p>");
											out.println("<p>");
											out.println("<form name=\"myform\" action=\"AnswerFriendshipRequestServlet\" method=\"get\">");
											out.println("<input type=\"hidden\" value=\""+s+"\" name=\"amicoFuturo_ID\">");
											out.println("<input type=\"radio\" name=\"accettazione\" value=\"accettata\" checked> Accetta<br>");
											out.println("<input type=\"radio\" name=\"accettazione\" value=\"rifiutata\"> Rifiuta<br>");
											out.println("<input type=\"submit\" value=\"Accetta!\">");
											out.println("</form>");
											out.println("</p>");
											out.println("<br><br><br>");
										}
									}else{
										out.println("non ci sono richieste di amicizia pendenti");
									}
								%>
				</td>		
				
									
				
				<td align="middle" width="40%" frame=void border="1">
							<h3>&nbsp;SWIM Consiglia:</h3>
					
							<%
								ArrayList<User> consigliAmicizia= (ArrayList<User>) request.getSession().getAttribute("consigliAmicizia");
								if(consigliAmicizia.size()!=0){
									for(User u : consigliAmicizia){
										String nomeSuggerito = u.getNome();
										String cognomeSuggerito = u.getCognome();
										String nascitaSuggerito = Integer.toString(u.getData_nascita());
										String s=Long.toString(u.getUser_ID());
									
										out.println("<p>");
										out.println(nomeSuggerito+"  ");
										out.println(cognomeSuggerito+"  "+nascitaSuggerito);
										out.println("</p>");
										out.println("<p><form action=\"ShowUserProfileServlet\" method=\"get\"><input type=\"hidden\" value=\""+s+"\" name=\"idProfilo\"><input type=\"submit\" value=\"Visualizza Profilo\"> </form></p>");
										out.println("<p>");
										out.println("<form name=\"myform\" action=\"AnswerFriendshipRequestServlet\" method=\"get\">");
										out.println("<input type=\"hidden\" value=\""+s+"\" name=\"amicoFuturo_ID\">");
										out.println("<input type=\"radio\" name=\"accettazione\" value=\"accettata\" checked> Accetta <br>");
										out.println("<input type=\"radio\" name=\"accettazione\" value=\"rifiutata\"> Rifiuta <br>");
										out.println("<input type=\"submit\" value=\"Richiedi!\">");
										out.println("</form>");
										out.println("</p>");
										out.println("<br><br><br>");
									}
								}else{
									out.println("non ci sono nuovi suggerimenti SWIM");
								}
					
							%>
				</td>
				
				
				
</body>
</html>