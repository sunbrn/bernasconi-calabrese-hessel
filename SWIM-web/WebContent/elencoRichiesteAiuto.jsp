<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.naming.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="swim.entitybeans.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> SWIMv2 - Elenco richieste d'Aiuto </title>
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
						<h3>&nbsp;Utenti che corrispondono alla ricerca:</h3>
						<br>
						
	
							<%

							ArrayList<Aiuto> elencoRichiesteAiuto=(ArrayList<Aiuto>) request.getSession().getAttribute("UserHelpRequestsList");
							ArrayList<String> elencoRichiedentiAiuto=(ArrayList<String>) request.getSession().getAttribute("UserClientRequestList");
							int i=1;
							if(elencoRichiesteAiuto.size()!=0){
								for (Aiuto a: elencoRichiesteAiuto){
									String idAiuto=Long.toString(a.getHelp_ID());
									String richiedente=elencoRichiedentiAiuto.get(i-1);
									out.println("<p>"+i+". "+richiedente+" ");
									out.println("<p><form action=\"HelpPageServlet\" method=\"get\"><input type=\"hidden\" value=\""+idAiuto+"\" name=\"help_ID\"><input type=\"submit\" value=\"Ask!\"> </form></p>");
									out.println("<br><br>");
									i=i+1;
								}
							}else{
								out.println("non ci sono richieste di aiuto pendenti <br><br>");
							}
							out.println("<br><br><br><a href=\"homePageUtente.jsp\"> Torna alla Home </a>");

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