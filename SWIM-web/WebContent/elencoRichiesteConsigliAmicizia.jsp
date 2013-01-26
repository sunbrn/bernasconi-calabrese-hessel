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
            <a href="homePageUtente.jsp">Home</a>
            </li>
            </ul>
		</div>
		
		<div class="testo">
		<table style="border:1px solid">
		<tr>			
		<td>
		
		<div id="richieste">
		<table width="300px" style="border:1px solid">
		<tr >
		<td>
			<h3> Richieste di amicizia:</h3>

	
				<%
					ArrayList<User> richiesteAmicizia= (ArrayList<User>) request.getSession().getAttribute("richiesteAmicizia");
					
					if(richiesteAmicizia.size()!=0){
						for(User u : richiesteAmicizia){
							String nomeRichiesta = u.getNome();
							String cognomeRichiesta = u.getCognome();
							String nascitaRichiesta = Integer.toString(u.getData_nascita());
							String s=Long.toString(u.getUser_ID());
							out.println("<tr><td align=\"right\">"
									 +"<img src=\"/SWIM-web/ImmaginiNuove/add-user.png\" alt=\"user\" class=\"user\" width=\"90px\" height=\"90px\"/>"
									+"</td>"+"<td align=\"left\">");
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
							out.println("<input type=\"submit\" value=\"Conferma scelta\">");
							out.println("</form>");
							out.println("</p>");
							out.println("<br><br><br>");
						}
					}else{
						out.println("non ci sono richieste di amicizia pendenti");
					}
				%>
		</td>
		</tr>		
		</table>
		</div>
		</td>
		<td>
		<div id="consigli">		
		<table width="300px" style="border:1px solid">
		<tr>
		<td>
			<h3>SWIMv2 Consiglia:</h3>
	
			<%
				ArrayList<User> consigliAmicizia= (ArrayList<User>) request.getSession().getAttribute("consigliAmicizia");
				if(consigliAmicizia.size()!=0){
					for(User u : consigliAmicizia){
						String nomeSuggerito = u.getNome();
						String cognomeSuggerito = u.getCognome();
						String nascitaSuggerito = Integer.toString(u.getData_nascita());
						String s=Long.toString(u.getUser_ID());
						out.println("<tr><td align=\"right\">"
								 +"<img src=\"/SWIM-web/ImmaginiNuove/add-user.png\" alt=\"user\" class=\"user\" width=\"90px\" height=\"90px\"/>"
								+"</td>"+"<td align=\"left\">");
						out.println("<p>");
						out.println(nomeSuggerito+"  ");
						out.println(cognomeSuggerito+"  "+nascitaSuggerito);
						out.println("</p>");
						out.println("<p><form action=\"ShowUserProfileServlet\" method=\"get\"><input type=\"hidden\" value=\""+s+"\" name=\"idProfilo\"><input type=\"submit\" value=\"Visualizza Profilo\"> </form></p>");
						out.println("<p>");
						out.println("<form name=\"myform\" action=\"AnswerFriendshipRequestServlet\" method=\"get\">");
						out.println("<input type=\"hidden\" value=\""+s+"\" name=\"amicoFuturo_ID\">");
						out.println("<input type=\"radio\" name=\"accettazione\" value=\"accettata\" checked> Accetta consiglio <br>");
						out.println("<input type=\"radio\" name=\"accettazione\" value=\"rifiutata\"> Rifiuta consiglio <br>");
						out.println("<input type=\"submit\" value=\"Conferma scelta\">");
						out.println("</form>");
						out.println("</p>");
						out.println("<br><br><br>");
					}
				}else{
					out.println("non ci sono nuovi suggerimenti SWIM");
				}
	
			%>
		</td>
		</tr>
		</table>
		</div>
		
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