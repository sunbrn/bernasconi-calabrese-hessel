package navigationServlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swim.entitybeans.Aiuto;
import swim.entitybeans.User;
import swim.sessionbeans.AiutoBeanRemote;
import swim.sessionbeans.UserBeanRemote;

/**
 * Servlet implementation class HelpAnswerServlet
 */
public class AnswerHelpRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String RIFUTATO="rifiutato";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerHelpRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Context ctx= (Context)request.getSession().getAttribute("context");
		try {
			AiutoBeanRemote remoteHelp = (AiutoBeanRemote) ctx.lookup("AiutoBean/remote");
			UserBeanRemote remoteUser= (UserBeanRemote) ctx.lookup("UserBean/remote");
			
			long userID=(Long)request.getSession().getAttribute("idUser");
			boolean accettato;
			String mexRisp=request.getParameter("messaggio_risposta");
			long helpID=(Long) request.getSession().getAttribute("help_ID");
			
			if(request.getParameter("rispostaAiuto").equalsIgnoreCase(RIFUTATO)){
				accettato=false;
				remoteHelp.rispostaAiuto(helpID, accettato, mexRisp);
				
				request.getSession().setAttribute("accettato", accettato);
				request.getSession().setAttribute("messaggioOfferenteAiuto", mexRisp);
				
			}else{
				accettato=true;
				remoteHelp.rispostaAiuto(helpID, accettato, mexRisp);
			}	
			ArrayList<User> elencoClienti;
			ArrayList<Aiuto> elencoAiuti=remoteHelp.getAiuti(userID);
			
			elencoClienti=new ArrayList<User>();
			for(Aiuto a : elencoAiuti){
				if(a.getRichiedente()==userID){
					elencoClienti.add(remoteUser.getUser(a.getOfferente()));
				}else{
					elencoClienti.add(remoteUser.getUser(a.getRichiedente()));
				}
			}
			request.getSession().setAttribute("UserActiveHelps", elencoAiuti);
			request.getSession().setAttribute("UserHelpClients", elencoClienti);
			
			response.sendRedirect("/SWIM-web/homePageUtente.jsp");
		
		} catch (NamingException e) {
			request.getSession().setAttribute("errore", 1);
			response.sendRedirect("/SWIM-web/errore.jsp");
		}  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
