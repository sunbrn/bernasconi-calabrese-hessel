<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Errore</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

	<div id="cont">
	<div id="layout">
	
		<div id="header">
			<img src="/SWIM-web/ImmaginiNuove/logo.png" alt="mio logo" 	class="logo" /> 
		</div>		
		
		<div id="nav">	
				<%
				if(request.getSession().getAttribute("idUser")!=null){
					out.println("<ul><li><a href=\"homePageUtente.jsp\"> Home </a></li></ul>");
				}else if(request.getSession().getAttribute("admin")!=null){
					out.println("<ul><li><a href=\"ShowAbilityListServlet\"> Lista Competenze </a></li></ul>");
				}else{
					out.println("<ul><li><a href=\"index.html\"> Home </a></li>");
					out.println("<li><a href=\"registrazione.html\"> Registrati </a></li></ul>");
				}
				%>
			
		</div>	
		
		
		<div id="center">
		<table  >
		<tr>
		<td align="right" width="40%">
		<img src="/SWIM-web/ImmaginiNuove/error.png" alt="errore">
		</td>
		<td width="20%"></td>
		<td width="40%">
		<div class="adv">
		<font size="6">
		<%
		int err= (Integer)request.getSession().getAttribute("errore");
		if(err==1){
			out.println("SESSIONE SCADUTA! Ripetere l'accesso");
		}else if(err==2){
			out.println("NICKNAME E PASSWORD GIA' PRESENTI:	cambiare uno dei due campi");
		}else if(err==3){
			out.println("HAI GIA' DICHIARATO QUESTA COMPETENZA!");
		}else if(err==4){
			out.println("LA COMPETENZA CHE HAI INSERITO NON E' FRA QUELLE DICHIARATE DALL'UTENTE");
		}else if(err==5){
			out.println("ERRORE: la password vecchia non corrisponde, controlla di aver riempito correttamente i campi!");
		}else if(err==6){
			out.println("ERRORE: accesso fallito! Inserisci di nuovo nickname e password oppure registrati!");
		}else if(err==7){
			out.println("<p>La competenza che volevi inserire è già presente nella Lista Competenze.</p> Controlla la lista e continua selezionando Lista Competenze");
		}
		%>
		</font>
		</div>
		</td>
		</tr>
		</table>
		</div>
		
		<div id=chiusura>
		</div>

	</div>
	</div>
</body>
</html>