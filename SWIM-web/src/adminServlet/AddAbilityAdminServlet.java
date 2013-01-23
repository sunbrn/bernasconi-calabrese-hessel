package adminServlet;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swim.entitybeans.Archivio_comp;
import swim.sessionbeans.Archivio_compBeanRemote;
import swim.sessionbeans.Richieste_agg_compBeanRemote;

/**
 * Servlet implementation class AbilityAddServlet
 */
public class AddAbilityAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	static String RIFIUTATA="rifiutata";
	static String ACCETTATA="accettata";
	static String NONINSERITA="nonInserita";
	static String INSERITA="inserita";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAbilityAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		Context ctx=(Context)request.getSession().getAttribute("context");
		
		try {
			Archivio_compBeanRemote remoteAbilityFolder=(Archivio_compBeanRemote) ctx.lookup("Archivio_compBean/remote");
			Richieste_agg_compBeanRemote remoteRequest=(Richieste_agg_compBeanRemote) ctx.lookup("Richieste_agg_compBean/remote");
			
			boolean inserted=remoteAbilityFolder.insertCompetenza(request.getParameter("nuovoCodiceAdmin"),request.getParameter("nuovaCompetenzaAdmin"));
			String richiesta=request.getParameter("idRichiesta");
			
			if(!inserted){
				request.getSession().setAttribute("statoRichiestaAggCompetenza", RIFIUTATA);
				request.getSession().setAttribute("esitoAggiuntaCompetenzaAdmin", NONINSERITA);
				out.println("<h1>Competenza gia' presente</h1>");
				out.println("<form action=\"adminListaRichiesteCompetenza.jsp\" method=\"get\"><input type=\"submit\" value=\"Torna alla lista di richieste\"></form>");
			}else{
				if(richiesta!=null){
					long richiestaID=Long.parseLong(richiesta);
					remoteRequest.acceptRequest(richiestaID);
				}
				request.getSession().setAttribute("esitoAggiuntaCompetenzaAdmin", INSERITA);
				request.getSession().setAttribute("statoRichiestaAggCompetenza", ACCETTATA);
				
				ArrayList<Archivio_comp> lista=remoteAbilityFolder.getCodiciECompetenze();
				request.getSession().setAttribute("listaCodiciECompetenze",lista);
				response.sendRedirect("/SWIM-web/adminListaCompetenze.jsp");
			}
						
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
