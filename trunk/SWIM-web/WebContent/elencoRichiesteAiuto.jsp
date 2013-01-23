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
				<a href action="homePageUtente.jsp"> Home </a>
				<br>
				
				<table width="100%" height="100%">
					<tr><td align="middle">
						<h3> Richieste di aiuto:</h3>
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
				
</body>

</html>