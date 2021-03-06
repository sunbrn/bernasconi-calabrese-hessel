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
import swim.entitybeans.User;
import swim.sessionbeans.Richieste_agg_compBeanRemote;
import swim.sessionbeans.UserBeanRemote;

/**
 * Servlet implementation class ShowAbilityRequestServlet
 */
public class ShowAbilityRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowAbilityRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Context ctx=(Context)request.getSession().getAttribute("context");
		
		try {
			Richieste_agg_compBeanRemote remoteAbilityRequest=(Richieste_agg_compBeanRemote) ctx.lookup("Richieste_agg_compBean/remote");
			UserBeanRemote remoteUser=(UserBeanRemote) ctx.lookup("UserBean/remote");
			
			ArrayList<Richieste_agg_comp> richiesteAggCompList=remoteAbilityRequest.getTutteRichiesteAggiuntaCompetenze();
			ArrayList<User> utenti=new ArrayList<User>();
			
			for(Richieste_agg_comp ric:richiesteAggCompList){
				utenti.add(remoteUser.getUser(ric.getUser_ID()));
			}
			
			request.getSession().setAttribute("NomiCognomiUtenti", utenti);
			request.getSession().setAttribute("richiesteAggCompList", richiesteAggCompList); 
			
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
	}

}
