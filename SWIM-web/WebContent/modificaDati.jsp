<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> SWIMv2 - Modifica dati personali </title>
</head>
<body>

	<a href="homePageUtente.jsp"> Home </a>
	<br>
	
			 
				<!-- TITOLO -->
				<H3>
					<FONT SIZE="25">
					<u><b>Modifica Dati Personali</b></u>
				</H3>	
					<p> inserire i dati che si desidera modificare </p>
					<p> si lascino bianchi i campi che si desidera restino immutati </p>
					<p> qualora si desideri modificare la password si inserisca la vecchia password e poi due volte la nuova password </p>
				
				
				
				<!--INPUT FORM REGISTRAZIONE-->
				<form name="Registrazione" action="DataModificationServlet" method="post">
				
					<table border="0" cellpadding="1" cellspacing="2" width="80%">
					
						<TBODY>
							
							<tr>
							<td align="left" width="0%"> Nickname:  </td>
							<td align="left" width="80%"><INPUT id="nuovoUsername" name="nuovoUsername" style="height: 33" type="text" value=""></td>
							</tr>
							
							<tr>
							<td align="left" width="0%"> Vecchia Password:  </td>
							<td align="left" width="80%"><INPUT id="vecchiaPassword" name="vecchiaPassword" style="height: 33" type="text" value=""></td>
							</tr>
							
							<tr>
							<td align="left" width="0%"> nuova Password:  </td>
							<td align="left" width="80%"><INPUT id="nuovaPassword1" style="height: 33" name="nuovaPassword1" type="password" value=""></td>
							</tr>
							
							<tr>
							<td align="left" width="0%">  Verifica nuova Password:  </td>
							<td align="left" width="80%"><INPUT id="nuovaPassword2" style="height: 33" name="nuovaPassword2" type="password" value=""></td>
							</tr>
							
							<tr>
							<td align="left" width="0%">  Nome:  </td>
							<td align="left" width="80%"><INPUT id="nuovoNome" name="nuovoNome" style="height: 33" type="text" value=""></td>
							</tr>			
							
							<tr>
							<td align="left" width="0%">  Cognome:  </td>
							<td align="left" width="80%"><INPUT id="nuovoCognome" name="nuovoCognome" style="height: 33" type="text" value=""></td>
							</tr>
							
							<tr>
							<td align="left" width="0%">  Sesso:  </td>
							<td>
							<select name="nuovoSesso">
							<option value="Maschio"> M </option>
							<option value="Femmina"> F </option>
							<option value="NonDichiarato"> - </option>				
							</select>
							</td>
							</tr>
							
							<tr>
							<td align="left" width="0%">  Citt�:  </td>
							<td align="left" width="80%"><INPUT id="nuovaCitt�" name="nuovaCitt�" style="height: 33" type="text" value=""></td>
							</tr>			
							
							<tr>
							<td align="left" width="0%">  Mail:  </td>
							<td align="left" width="80%"><INPUT id="nuovaMail" name="nuovaMail" style="height: 33" type="text" value=""></td>
							</tr>
							
							<tr>
							<td align="left" width="0%">  Anno nascita:  </td>
							<td align="left" width="80%"><INPUT id="nuovaNascita" name="nuovaNascita" style="height: 33" type="text" value=""></td>
							</tr>			
							
							<tr>
							<td align="left" width="0%">  Diploma:  </td>
							<td align="left" width="80%"><INPUT id="nuovoDiploma" name="nuovoDiploma" style="height: 33" type="text" value=""></td>
							</tr>
							
							<tr>
							<td align="left" width="0%">  Laurea:  </td>
							<td align="left" width="80%"><INPUT id="nuovaLaurea" name="nuovaLaurea" style="height: 33" type="text" value=""></td>
							</tr>
							
							<tr>
							<td align="left" width="0%">  Altro:  </td>
							<td align="left" width="80%"><INPUT id="nuovoAltro" name="nuovoAltro" style="height: 33" type="text" value=""></td>
							</tr>
														
							<tr>
							<td align="left" width="0%"></td>
							<td align="left" width="50%"><input type="submit" style="width:70;height: 33" value="submit"></td>
							</tr>		
							
						</TBODY>
								
					</table>
							
					<br><br>
	
				</form>	
	
			
</body>
</html>