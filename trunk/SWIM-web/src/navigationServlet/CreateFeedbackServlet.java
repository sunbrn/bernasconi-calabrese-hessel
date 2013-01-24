package navigationServlet;

import java.io.IOException;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;

import swim.entitybeans.Aiuto;
import swim.sessionbeans.AiutoBeanRemote;
import swim.sessionbeans.ValutazioniBeanRemote;

/**
 * Servlet implementation class FeedbackServlet
 */
public class CreateFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateFeedbackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Context ctx=(Context)request.getSession().getAttribute("context");
		
		try{
			ValutazioniBeanRemote remoteFeedback=(ValutazioniBeanRemote) ctx.lookup("ValutazioniBean/remote");
			
			long help_ID=(Long)request.getSession().getAttribute("help_ID");
			long offerente_ID=(Long)request.getSession().getAttribute("offerente_ID");
			
			String commento=request.getParameter("commento");
			int professionalità=Integer.parseInt(request.getParameter("group1"));
			int disponibilità=Integer.parseInt(request.getParameter("group2"));
			int prezzo=Integer.parseInt(request.getParameter("group3"));
			
			remoteFeedback.insertNewFeedback(help_ID,offerente_ID,commento,professionalità,disponibilità,prezzo);
			
			AiutoBeanRemote remoteHelp= (AiutoBeanRemote) ctx.lookup("AiutoBean/remote");
			ArrayList<Aiuto> elencoAiuti=remoteHelp.getAiuti((Long)request.getSession().getAttribute("idUser"));
			request.getSession().setAttribute("UserActiveHelps", elencoAiuti);
			
			response.sendRedirect("homePageUtente.jsp");
			
		}catch (NamingException e) {
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
