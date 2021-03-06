<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="swim.entitybeans.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Elenco Utenti </title>
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
				<%
				if(request.getSession().getAttribute("idUser")!=null){
					out.println("<a href=\"homePageUtente.jsp\"> Home </a>");
				}else{
					out.println("<a href=\"index.html\"> Home </a>");
				}
				%>
			</li>
			</ul>
		</div>	
		
		<div id="center">
		<table width="100%" height="100%" valign="top">
		<tr><td>
		<h3>Utenti che corrispondono alla ricerca:</h3> <br>
		</td></tr>
			<font size="5">
				<%
				ArrayList<User> lista=(ArrayList<User>) request.getSession().getAttribute("risultatiRicerca");
				if(lista!=null){
					for (User u: lista){
						out.println("<tr><td>"
								 +"<img src=\"/SWIM-web/ImmaginiNuove/utente.png\" alt=\"user\" class=\"user\" width=\"90px\" height=\"90px\"/>"
								+"</td>"+"<td align=\"center\">");
						out.println("<p>"+u.getNome());
						out.println(u.getCognome()+"</p>");
						out.println("<p>"+u.getData_nascita()+"</p>");
						String s=Long.toString(u.getUser_ID());
						out.println("<p><form action=\"ShowUserProfileServlet\" method=\"get\"><input type=\"hidden\" value=\""+s+"\" name=\"idProfilo\"><input type=\"submit\" value=\"Visualizza profilo\" align=\"left\"> </form></p></td></tr>");
						
					}
				}else{
					out.println("nessun utente corrisponde alla ricerca");
				}
				%>
				</font>

		</table>
		</div>
	
	<div id=chiusura>
	</div>
	
	</div>
	</div>	
	</body>
</html>