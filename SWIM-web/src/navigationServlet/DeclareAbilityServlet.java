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
import swim.sessionbeans.Archivio_compBeanRemote;

/**
 * Servlet implementation class DeclareAbilityServlet
 */
public class DeclareAbilityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeclareAbilityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Context ctx=(Context) request.getSession().getAttribute("context");
		try {
			Archivio_compBeanRemote remoteAbility=(Archivio_compBeanRemote) ctx.lookup("Archivio_compBean/remote");
			
			ArrayList<Archivio_comp> abilityList=remoteAbility.getCodiciECompetenze();
			request.getSession().setAttribute("listaCodiciECompetenze", abilityList);
			
			response.sendRedirect("/SWIM-web/aggiungiCompetenza.jsp");
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
