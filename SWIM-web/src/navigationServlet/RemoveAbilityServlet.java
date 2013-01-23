package navigationServlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swim.entitybeans.Archivio_comp;
import swim.entitybeans.Richieste_agg_comp;
import swim.entitybeans.User;
import swim.sessionbeans.Archivio_compBeanRemote;
import swim.sessionbeans.Comp_dichiarateBeanRemote;
import swim.sessionbeans.Richieste_agg_compBeanRemote;
import swim.sessionbeans.UserBeanRemote;

/**
 * Servlet implementation class RemoveAbilityServlet
 */
public class RemoveAbilityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveAbilityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Context ctx=(Context) request.getSession().getAttribute("context");
		
		try {
			
			UserBeanRemote remoteUser=(UserBeanRemote) ctx.lookup("UserBean/remote");
			Archivio_compBeanRemote remoteArchivio=(Archivio_compBeanRemote) ctx.lookup("Archivio_compBean/remote");
			String nomeCompCanc=request.getParameter("nomeCompCanc");
			String codiceCompCanc=remoteArchivio.getCodiceCompetenza(nomeCompCanc);
			
			Comp_dichiarateBeanRemote remoteCompetenza=(Comp_dichiarateBeanRemote) ctx.lookup("Comp_dichiarateBean/remote");
			long user_ID=(Long)request.getSession().getAttribute("idUser");
			
			remoteCompetenza.rimuoviCompetenza(user_ID,codiceCompCanc);
			
			ArrayList<String> abilityList=remoteUser.getNomiCompetenzeUtente(user_ID);
			request.getSession().setAttribute("UserAbilities", abilityList);			
			response.sendRedirect("/SWIM-web/rimuoviCompetenza.jsp");
	
			
			
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
