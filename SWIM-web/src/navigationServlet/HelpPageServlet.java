package navigationServlet;

import java.io.IOException;
import java.util.Date;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swim.sessionbeans.AiutoBeanRemote;
import swim.sessionbeans.Archivio_compBeanRemote;
import swim.sessionbeans.UserBeanRemote;

/**
 * Servlet implementation class HelpPageServlet
 */
public class HelpPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelpPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Context ctx=(Context)request.getSession().getAttribute("context");
		String help_ID_stringa=request.getParameter("help_ID");
		
		long help_ID=Long.parseLong(help_ID_stringa);
		request.getSession().setAttribute("help_ID", help_ID);
		
		
		try {	
			AiutoBeanRemote	remoteHelp = (AiutoBeanRemote) ctx.lookup("AiutoBean/remote");				
			UserBeanRemote remoteUser= (UserBeanRemote) ctx.lookup("UserBean/remote");
			Archivio_compBeanRemote remoteArchivio_comp= (Archivio_compBeanRemote) ctx.lookup("Archivio_compBean/remote");
			
			String nome_richiedente = remoteUser.getUser(remoteHelp.getAiuto(help_ID).getRichiedente()).getNome();
			String cognome_richiedente = remoteUser.getUser(remoteHelp.getAiuto(help_ID).getRichiedente()).getCognome();	
			String nome_offerente = remoteUser.getUser(remoteHelp.getAiuto(help_ID).getOfferente()).getNome();
			String cognome_offerente = remoteUser.getUser(remoteHelp.getAiuto(help_ID).getOfferente()).getCognome();
			String competenza = remoteArchivio_comp.getNomeCompetenza(remoteHelp.getAiuto(help_ID).getCodice_comp());
			Date data = remoteHelp.getAiuto(help_ID).getData_inizio();
			String mexRich = remoteHelp.getAiuto(help_ID).getMexRich();
			boolean accettato =remoteHelp.getAiuto(help_ID).isAccettato();
			
			request.getSession().setAttribute("richiedente_ID",remoteHelp.getAiuto(help_ID).getRichiedente());
			request.getSession().setAttribute("nomeRichiedente", nome_richiedente);
			request.getSession().setAttribute("cognomeRichiedente",cognome_richiedente);
			request.getSession().setAttribute("offerente_ID",remoteHelp.getAiuto(help_ID).getOfferente());
			request.getSession().setAttribute("nomeOfferente", nome_offerente);
			request.getSession().setAttribute("cognomeOfferente",cognome_offerente);
			request.getSession().setAttribute("competenzaRichiestaAiuto", competenza );	
			request.getSession().setAttribute("dataRichiestaAiuto",  data);
			request.getSession().setAttribute("messaggioRichiedenteAiuto", mexRich);
			request.getSession().setAttribute("accettato", accettato);
			
			if(remoteHelp.getAiuto(help_ID).isAccettato()==true){
				String mexRisp = remoteHelp.getAiuto(help_ID).getMexRisp();
				request.getSession().setAttribute("messaggioOfferenteAiuto", mexRisp);
			}
			
			response.sendRedirect("aiuto.jsp");
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
