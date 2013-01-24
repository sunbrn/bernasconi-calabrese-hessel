package navigationServlet;

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
 * Servlet implementation class AbilityRequestServlet
 */
public class CreateAbilityRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateAbilityRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Context ctx= (Context)request.getSession().getAttribute("context");
		
		try {
			Richieste_agg_compBeanRemote remoteAbilityRequest=(Richieste_agg_compBeanRemote) ctx.lookup("Richieste_agg_compBean/remote");
			
			long userID=(long) request.getSession().getAttribute("idUser");
			
			remoteAbilityRequest.insertNewRequest(userID,request.getParameter("competenzaRichiesta"));
						
			ArrayList<Richieste_agg_comp> lista= remoteAbilityRequest.getMieRichieste(userID);
			request.getSession().setAttribute("UserAbilityRequest", lista);
			
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
	}

}
