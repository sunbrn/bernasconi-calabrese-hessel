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
            </ul>
		</div>	
				
				<div id="center">
				<table width="100%" height="100%">
					<tr><td align="center">
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
									out.println("<tr><td align=\"right\">"
											 +"<img src=\"/SWIM-web/ImmaginiNuove/questionmark.jpg\" alt=\"user\" class=\"user\" width=\"90px\" height=\"90px\"/>"
											+"</td>"+"<td align=\"middle\">");
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
				</div>
				
				<div id=chiusura>
				</div>
				
	</div>
	</div>				
</body>

</html>