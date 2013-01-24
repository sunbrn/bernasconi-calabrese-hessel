package adminServlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swim.entitybeans.Richieste_agg_comp;
import swim.sessionbeans.Richieste_agg_compBeanRemote;

/**
 * Servlet implementation class RemoveAbilityRequestServlet
 */
public class RemoveAbilityRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveAbilityRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Context ctx=(Context)request.getSession().getAttribute("context");
		Richieste_agg_compBeanRemote remoteRequest;
		try {
			remoteRequest = (Richieste_agg_compBeanRemote) ctx.lookup("Richieste_agg_compBean/remote");
			
			String richiesta=request.getParameter("idRichiesta");
			long richiestaID=Long.parseLong(richiesta);
			remoteRequest.acceptRequest(richiestaID);	
					

			ArrayList<Richieste_agg_comp> listaRichieste=remoteRequest.getTutteRichiesteAggiuntaCompetenze();			
			request.getSession().setAttribute("richiesteAggCompList", listaRichieste);			
			response.sendRedirect("/SWIM-web/adminListaRichiesteCompetenza.jsp");
			  
			
		} catch (NamingException e) {
			request.getSession().setAttribute("errore", 1);
			response.sendRedirect("/SWIM-web/errore.jsp");
		}
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Context ctx=(Context) request.getSession().getAttribute("context");
		
		try {
			Richieste_agg_compBeanRemote remoteAbilityRequest=(Richieste_agg_compBeanRemote) ctx.lookup("Richieste_agg_compBean/remote");
			
			String richiesta=request.getParameter("idRichiesta");
			long richiestaID=Long.parseLong(richiesta);
			remoteAbilityRequest.rejectRequest(richiestaID);
			
			ArrayList<Richieste_agg_comp> listaRichieste=remoteAbilityRequest.getTutteRichiesteAggiuntaCompetenze();			
			request.getSession().setAttribute("richiesteAggCompList", listaRichieste);			
			response.sendRedirect("/SWIM-web/adminListaRichiesteCompetenza.jsp");
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
