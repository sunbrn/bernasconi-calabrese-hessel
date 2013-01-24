package navigationServlet;

import java.io.IOException;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swim.sessionbeans.AiutoBeanRemote;
import swim.sessionbeans.Archivio_compBeanRemote;
import swim.sessionbeans.Comp_dichiarateBeanRemote;

/**
 * Servlet implementation class HelpRequestServlet
 */
public class CreateHelpRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateHelpRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Context ctx=(Context)request.getSession().getAttribute("context");
		
		try {
			AiutoBeanRemote remoteHelp=(AiutoBeanRemote) ctx.lookup("AiutoBean/remote");
			Comp_dichiarateBeanRemote remoteAbility= (Comp_dichiarateBeanRemote) ctx.lookup("Comp_dichiarateBean/remote"); 
			Archivio_compBeanRemote remoteArchive=(Archivio_compBeanRemote) ctx.lookup("Archivio_compBean/remote");
			
			long idUser=(Long) request.getSession().getAttribute("idUser");
			long idProfilo=(Long) request.getSession().getAttribute("idProfilo");
			List<String> abilities=remoteAbility.getCompetenzeDichiarate(idProfilo);
			boolean competenzaRichiestaPresente=false;
			String competenzaRichiesta= (String)request.getParameter("competenzaRichiesta");
			
			for(String s: abilities){
				String abilityName=remoteArchive.getNomeCompetenza(s);
				if(competenzaRichiesta.equalsIgnoreCase(abilityName)){
					competenzaRichiestaPresente=true;
				}
			}	
			
			if(competenzaRichiestaPresente){
				String messRich=request.getParameter("messaggioRichiesta");
				remoteHelp.richiediAiuto(competenzaRichiesta, idUser, idProfilo, messRich);
				response.sendRedirect("profiloPubblico.jsp");
			}else{
				request.getSession().setAttribute("errore", 4);
				response.sendRedirect("/SWIM-web/errore.jsp");
			}
			
			
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
