<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>RichiediAiuto</title>
	</head>

	<body>				

		
					<a href="homePageUtente.jsp"> Home </a>
					<br>

					<form name="richiediAiuto" action="CreateHelpRequestServlet" method="get">
						<FONT SIZE="14"> Competenza richiesta: </FONT> <br>
						<INPUT id="competenzaRichiesta" name="competenzaRichiesta" style="height: 33" type="text" value=""><br><br><br>
						<FONT SIZE="14"> Messaggio Richiesta: </FONT><br>
						<textarea cols="40" rows="5" id="messaggioRichiesta" name="messaggioRichiesta"></textarea><br>
						<input type="submit" style="width:70;height: 33" value="Invia">	<br>
					</form>	
			
	</body>
	</html>