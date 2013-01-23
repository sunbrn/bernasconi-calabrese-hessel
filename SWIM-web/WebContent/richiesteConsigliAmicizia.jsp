<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>GestisciRichiesteAmicizia</title>
	</head>
	
	<body>				
		
		<!-- INIZIO TABELLA ESTERNA --> 
		<table width="100%" height="100%" border="1" frame=void> 
			<tr width="100%" >			
			
				<!-- colonna1 -->				
				<td align="middle" width="20%" bgcolor=#007FFF>
					<a width="83%" height="13%" href="///C:/Users/Hessel/Desktop/Home_Tabelle 8.html">
					<img src="C:\Users\Anna\Dropbox\POLITECNICO\IS1\SWIMv2 HCB\IMPLEMENTAZIONE\SCHERMATE HTML\ElencoUtenti\swimv2blu.jpg" width="150" height="40"></a>
				</td>
					
				<!-- colonna2 -->
				<td align="middle" width="60%" frame=void border="1">
					<table width="100%" height="100%">
					<tr>
						<td  width="50%" height="100%" bordercolor=#007FFF>
							<h3>&nbsp;Richieste di amicizia ricevute:</h3>
						
								<a href="UserProfileServlet"><img src="C:\Users\Anna\Dropbox\POLITECNICO\IS1\SWIMv2 HCB\IMPLEMENTAZIONE\SCHERMATE HTML\ElencoUtenti\utente.jpg" width="60" height="60" align="absmiddle" border="5" style="border:medium groove rgb(0, 153, 255)"></a>&nbspRichiesta da Utente 1
								<form name="myform" action="FriendshipServlet" method="get"><div align="center">
									<input type="radio" name="group1" value="Accetta"> Accetta
									<input type="radio" name="group1" value="Rifiuta" checked> Rifiuta<br><br>
								<div></form>
								
							<a href="HOME"><input type="button" value="Conferma scelte"></a>
						</td>
						<td width="50%" height="100%" bordercolor=#007FFF>
							<h3>&nbsp;Richieste di amicizia ricevute:</h3>
						
								<a href="ProfiloUtente1"><img src="C:\Users\Anna\Dropbox\POLITECNICO\IS1\SWIMv2 HCB\IMPLEMENTAZIONE\SCHERMATE HTML\ElencoUtenti\utente.jpg" width="60" height="60" align="absmiddle" border="5" style="border:medium groove rgb(0, 153, 255)"></a>&nbspRichiesta da Utente 1
								<form name="myform" action="FriendshipServlet" method="get"><div align="center">
									<input type="radio" name="group1" value="Accetta"> Accetta
									<input type="radio" name="group1" value="Rifiuta" checked> Rifiuta<br><br>
								<div></form>
								
								<a href="ProfiloUtente2"><img src="C:\Users\Anna\Dropbox\POLITECNICO\IS1\SWIMv2 HCB\IMPLEMENTAZIONE\SCHERMATE HTML\ElencoUtenti\utente.jpg" width="60" height="60" align="absmiddle" border="5" style="border:medium groove rgb(0, 153, 255)"></a>&nbspRichiesta da Utente 2
								<form name="myform" action="FriendshipServlet" method="get"><div align="center">
									<input type="radio" name="group2" value="Accetta"> Accetta
									<input type="radio" name="group2" value="Rifiuta" checked> Rifiuta<br><br>
								<div></form>
								
								<a href="ProfiloUtente3"><img src="C:\Users\Anna\Dropbox\POLITECNICO\IS1\SWIMv2 HCB\IMPLEMENTAZIONE\SCHERMATE HTML\ElencoUtenti\utente.jpg" width="60" height="60" align="absmiddle" border="5" style="border:medium groove rgb(0, 153, 255)"></a>&nbspRichiesta da Utente 3
								<form name="myform" action="FriendshipServlet" method="get"><div align="center">
									<input type="radio" name="group3" value="Accetta"> Accetta
									<input type="radio" name="group3" value="Rifiuta" checked> Rifiuta<br><br>
								<div></form>
								
								
							<a href="HOME"><input type="button" value="Conferma scelte"></a>
						</td>
						</tr>
					</table>
				</td>					
				
				<!-- colonna3 -->				
				<td align="middle" width="20%" bgcolor=#007FFF>
						
				</td>	
				
			</tr>
		</table> <!-- FINE TABELLA ESTERNA --> 
		
	</body>
	</html>