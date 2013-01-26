<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="javax.naming.Context, swim.sessionbeans.UserBeanRemote, swim.entitybeans.User, java.util.List, java.util.ArrayList;"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ElencoAmici</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>	

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
            <%
            	long chi= (Long) request.getSession().getAttribute("chi");
            	long idUser= (Long) request.getSession().getAttribute("idUser");
            	if(chi!=idUser){
            		out.println("<li>");
            		out.println("<a href=\"profiloPubblico.jsp\"> Torna al Profilo </a>");
            		out.println("</li>");
            	}
            %>
            </ul>
		</div>			

					<div id="center">
					<table width="100%" height="100%">
					<tr><td >
						<h3>Amici:</h3>
						<br>
						<%
							ArrayList<User> lista_amici=(ArrayList<User>) request.getSession().getAttribute("listaAmici");
							if(lista_amici!=null){
								for (User u: lista_amici){
									out.println("<tr><td align=\"right\">"
											 +"<img src=\"/SWIM-web/ImmaginiNuove/utente.png\" alt=\"user\" class=\"user\" width=\"90px\" height=\"90px\"/>"
											+"</td>"+"<td align=\"center\">");
									out.println("<p>"+u.getNome());
									out.println(u.getCognome()+"</p>");
									String s=Long.toString(u.getUser_ID());
									out.println("<form action=\"ShowUserProfileServlet\" method=\"get\"><input type=\"hidden\" value=\""+s+"\" name=\"idProfilo\"><input type=\"submit\" value=\"Visita profilo\"></form>");
									out.println("<form action=\"RemoveFriendshipServlet\" method=\"post\"><input type=\"hidden\" value=\""+s+"\" name=\"idProfilo\"><input type=\"submit\" value=\"Elimina amicizia\"></form>");
									out.println("<br><br><br>");
								}
							}else{
								out.println("<p>Non hai ancora amici</p> <p> Usa la nostra funzionalità di ricerca per cercare i tuoi contatti di lavoro su SWIM! </p>");
							}
							
							
						%>
					</td></tr>
					</table>
					</div>
					
					<div id=chiusura>
					</div>
					
	</div>	
	</div>		
</body>
</html>