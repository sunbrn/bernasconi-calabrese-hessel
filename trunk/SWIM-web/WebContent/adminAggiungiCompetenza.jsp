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

		
		<!-- INIZIO TABELLA ESTERNA --> 
		<table width="100%" height="100%" border="1">    
			<tr width="100%"  >
			
				<!--PRIMA COLONNA ESTERNA-->
				<td align="middle" width="20%" bgcolor=#007FFF> 
					<form action="adminHomePage.html" method="get"><input type="submit" value="Torna alla home"></form>
					<br>
					<form action="LogoutServlet" method="get"><input type="submit" value="Log-Out"></form>
				</td>
				
				<!-- SECONDA COLONNA ESTERNA-->
				<td width="30%">
						<!--INPUT FORM REGISTRAZIONE-->
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
				</td>
				
				<!-- TERZA COLONNA ESTERNA-->
				<td align="middle" width="30%"> 
						<img src="/SWIM-web/Immagini/chiave.png" width="100%" height="60%">
				</td>	

				
				<!-- QUARTA COLONNA ESTERNA-->
				<td align="middle" width="20%" bgcolor=#007FFF> 
					
				</td>				
			</tr>

		</table> 
		<!-- FINE TABELLA ESTERNA --> 