<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="javax.naming.Context, swim.sessionbeans.UserBeanRemote, swim.entitybeans.User, java.util.List, java.util.ArrayList;"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>ElencoAmici</title>
	</head>
	
	<body>				
		
		<!-- INIZIO TABELLA ESTERNA --> 
		<table width="100%" height="100%" border="1" frame=void> 
			<tr width="100%" >			
			
				<!-- colonna1 -->				
				<td align="middle" width="20%" bgcolor=#007FFF>
					<form action="homePageUtente.jsp" method="get">
					<input type="submit" value="Home">
					</form>
					<br>
				</td>
					
				<!-- colonna2 -->
				<td align="middle" width="60%" frame=void border="1">
					<table width="100%" height="100%">
					<tr><td align="middle">
						<h3>&nbsp;Amici:</h3>
						<br>
						<%
							System.out.println("sono nella jsp");
							ArrayList<User> lista_amici=(ArrayList<User>) request.getSession().getAttribute("listaAmici");
							if(lista_amici!=null){
								for (User u: lista_amici){
									out.println("<p>"+u.getNome());
									out.println(u.getCognome()+"</p>");
									String s=Long.toString(u.getUser_ID());
									out.println("<form action=\"ShowUserProfileServlet\" method=\"get\"><input type=\"hidden\" value=\""+s+"\" name=\"idProfilo\"><input type=\"submit\" value=\"Visita profilo\"></form>");
									out.println("<br><br><br>");
								}
							}else{
								out.println("<p>non hai amici</p> <p> Usa la nostra funzionalità di ricerca per cercare i tuoi contatti di lavoro su SWIM! </p>");
							}
							
							
						%>
					</td></tr>
					</table>
				</td>					
				
				<!-- colonna3 -->				
				<td align="middle" width="20%" bgcolor=#007FFF>
						
				</td>	
				
			</tr>
		</table> <!-- FINE TABELLA ESTERNA --> 
		
	</body>
	</html>