<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RichiediAiuto</title>
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
            <a href="homePageUtente.jsp">Home</a>
            </li>
            </ul>
		</div>		
					<h1>
					<u><b>Richiedi Aiuto</b></u>
					</h1>
					<div class="adv"><p><h6>Riempi i campi sottostanti con la competenza richiesta e inserisci un messaggio con i particolari della tua richiesta. ATTENZIONE:nel campo competenza devi inserire solo la competenza posseduta dall'utente a cui hai chiesto aiuto!
					</h6></p>
					</div>
					
					<form name="richiediAiuto" action="CreateHelpRequestServlet" method="get">
						Competenza richiesta: <br>
						<INPUT id="competenzaRichiesta" name="competenzaRichiesta" style="height: 33" type="text" value=""><br><br><br>
						Messaggio Richiesta:<br>
						<textarea cols="40" rows="5" id="messaggioRichiesta" name="messaggioRichiesta"></textarea><br>
						<input type="submit" style="width:70;height: 33" value="Invia">	<br>
					</form>	
	</div>
	</div>			
</body>
</html>