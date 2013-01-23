<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.persistence.*"%>
<%@page import="javax.persistence.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collection"%>
<%@page import="swim.sessionbeans.*"%>
<%@page import="swim.entitybeans.*"%>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title> SWIMv2 - Aggiungi Competenza Admin </title>
	</head>
	
	<body>		
				
					<p><a href="adminHomePage.html"> Home </a></p>
					<br>
					<p><a href="LogoutServlet" align="right"> Log-out</a></p>
				
					<form name="Aggiungi_comp" action="AddAbilityAdminServlet" method="get">
							
							<table border="0" cellpadding="1" cellspacing="2" width="100%">
							
								<TBODY>									
										<tr>
										<td align="left" width="0%">Competenza:</td>
										<td align="left" width="100%"><INPUT id="nuovaCompetenzaAdmin" name="nuovaCompetenzaAdmin" style="height: 33" type="text" value=""></td>
										</tr>			
										
										<tr>
										<td align="left" width="0%">Codice Competenza:</td>
										<td align="left" width="100%"><INPUT id="nuovoCodiceAdmin" name="nuovoCodiceAdmin" style="height: 33" type="text" value=""></td>
										</tr>

										<tr>
										<td align="left" width="0%"></td>
										<td align="left" width="50%"><input type="submit" style="width:70;height: 33" value="submit" onClick=""></td>
										</tr>		
								</TBODY>
										
							</table>
					</form>				
				
				 
					<img src="/SWIM-web/Immagini/chiave.png" width="20%" height="35%">
			</body>
	</html>