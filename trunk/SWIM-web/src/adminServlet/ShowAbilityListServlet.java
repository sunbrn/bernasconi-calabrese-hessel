package adminServlet;

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
 * Servlet implementation class ShowAbilityListServlet
 */
public class ShowAbilityListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowAbilityListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Context ctx=(Context) request.getSession().getAttribute("context");
		
		try {
			Archivio_compBeanRemote remoteAbilityList=(Archivio_compBeanRemote) ctx.lookup("Archivio_compBean/remote");
		
			ArrayList<Archivio_comp> abilityList=remoteAbilityList.getCodiciECompetenze();
			
			request.getSession().setAttribute("listaCodiciECompetenze", abilityList);
			
			response.sendRedirect("/SWIM-web/adminListaCompetenze.jsp");
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
