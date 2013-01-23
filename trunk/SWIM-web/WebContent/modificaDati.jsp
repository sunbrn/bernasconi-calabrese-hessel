<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> SWIMv2 - Modifica dati personali </title>
</head>
<body>

	<table border=1 frame=box width="100%">
	
		<tr> 
			
			
			<td align="middle" width="20%" bgcolor=#000326> 
				<a width="20%" height="13%" href="/SWIM-web/index.html"><img src="/SWIM-web/Immagini/swimv2-button.png"> </a>
			</td>
			
			
			<td align="middle" width="60%">
			 
				<!-- TITOLO -->
				<H1>
					<FONT SIZE="25">
					<u><b>Modifica Dati Personali</b></u>
					</FONT>
					<p> inserire i dati che si desidera modificare </p>
					<p> si lascino bianchi i campi che si desidera restino immutati </p>
					<p> qualora si desideri modificare la password si inserisca la vecchia password e poi due volte la nuova password </p>
				</H1>
				
				
				<!--INPUT FORM REGISTRAZIONE-->
				<form name="Registrazione" action="DataModificationServlet" method="post">
				
					<table border="0" cellpadding="1" cellspacing="2" width="100%">
					
						<TBODY>
							
							<tr>
							<td align="left" width="0%"> <FONT SIZE="14">Nickname: </FONT> </td>
							<td align="left" width="100%"><INPUT id="nuovoUsername" name="nuovoUsername" style="height: 33" type="text" value=""></td>
							</tr>
							
							<tr>
							<td align="left" width="0%"> <FONT SIZE="14">Vecchia Password: </FONT> </td>
							<td align="left" width="100%"><INPUT id="vecchiaPassword" name="vecchiaPassword" style="height: 33" type="text" value=""></td>
							</tr>
							
							<tr>
							<td align="left" width="0%"> <FONT SIZE="14">nuova Password: </FONT> </td>
							<td align="left" width="100%"><INPUT id="nuovaPassword1" style="height: 33" name="nuovaPassword1" type="password" value=""></td>
							</tr>
							
							<tr>
							<td align="left" width="0%"> <FONT SIZE="14"> Verifica nuova Password: </FONT> </td>
							<td align="left" width="100%"><INPUT id="nuovaPassword2" style="height: 33" name="nuovaPassword2" type="password" value=""></td>
							</tr>
							
							<tr>
							<td align="left" width="0%"> <FONT SIZE="14"> Nome: </FONT> </td>
							<td align="left" width="100%"><INPUT id="nuovoNome" name="nuovoNome" style="height: 33" type="text" value=""></td>
							</tr>			
							
							<tr>
							<td align="left" width="0%"> <FONT SIZE="14"> Cognome: </FONT> </td>
							<td align="left" width="100%"><INPUT id="nuovoCognome" name="nuovoCognome" style="height: 33" type="text" value=""></td>
							</tr>
							
							<tr>
							<td align="left" width="0%"> <FONT SIZE="14"> Sesso: </FONT> </td>
							<td>
							<select name="nuovoSesso">
							<option value="Maschio"> M </option>
							<option value="Femmina"> F </option>
							<option value="NonDichiarato"> - </option>				
							</select>
							</td>
							</tr>
							
							<tr>
							<td align="left" width="0%"> <FONT SIZE="14"> Città: </FONT> </td>
							<td align="left" width="100%"><INPUT id="nuovaCittà" name="nuovaCittà" style="height: 33" type="text" value=""></td>
							</tr>			
							
							<tr>
							<td align="left" width="0%"> <FONT SIZE="14"> Mail: </FONT> </td>
							<td align="left" width="100%"><INPUT id="nuovaMail" name="nuovaMail" style="height: 33" type="text" value=""></td>
							</tr>
							
							<tr>
							<td align="left" width="0%"> <FONT SIZE="14"> Anno nascita: </FONT> </td>
							<td align="left" width="100%"><INPUT id="nuovaNascita" name="nuovaNascita" style="height: 33" type="text" value=""></td>
							</tr>			
							
							<tr>
							<td align="left" width="0%"> <FONT SIZE="14"> Diploma: </FONT> </td>
							<td align="left" width="100%"><INPUT id="nuovoDiploma" name="nuovoDiploma" style="height: 33" type="text" value=""></td>
							</tr>
							
							<tr>
							<td align="left" width="0%"> <FONT SIZE="14"> Laurea: </FONT> </td>
							<td align="left" width="100%"><INPUT id="nuovalaurea" name="nuovalaurea" style="height: 33" type="text" value=""></td>
							</tr>
							
							<tr>
							<td align="left" width="0%"> <FONT SIZE="14"> Altro: </FONT> </td>
							<td align="left" width="100%"><INPUT id="nuovoAltro" name="nuovoAltro" style="height: 33" type="text" value=""></td>
							</tr>
							
							<tr>
							<td align="left" width="0%"> <FONT SIZE="14"> Aggiungi Lingua: </FONT> </td>
							<td align="left" width="100%"><INPUT id="nuovalingua" name="nuovaLingua" style="height: 33" type="text" value=""></td>
							</tr>
							
							<tr>
							<td align="left" width="0%"> <FONT SIZE="14"> Aggiungi Impresa: </FONT> </td>
							<td align="left" width="100%"><INPUT id="nuovaImpresa" name="nuovaImpresa" style="height: 33" type="text" value=""></td>
							</tr>
							
							<tr>
							<td align="left" width="0%"> <FONT SIZE="14"> Aggiungi periodo in cui hai lavorato in tale impresa: </FONT> </td>
							<td align="left" width="100%"><INPUT id="nuovoPeriodoImpresa" name="nuovoPeriodoImpresa" style="height: 33" type="text" value=""></td>
							</tr>
							
							<tr>
							<td align="left" width="0%"></td>
							<td align="left" width="50%"><input type="submit" style="width:70;height: 33" value="submit"></td>
							</tr>		
							
						</TBODY>
								
					</table>
							
					<br><br>
	
				</form>	
	
			</td>  
	
	
			<td align="middle" width="20%" bgcolor=#000326> 
				<a width="20%" height="13%" href="/SWIM-web/index.html"><img src="/SWIM-web/Immagini/swimv2-button.png"> </a>
			</td>
	
	
		</tr>
	
	</table>

</body>
</html>