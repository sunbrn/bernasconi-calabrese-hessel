package accessServlet;

import java.io.IOException;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swim.sessionbeans.Richieste_agg_compBeanRemote;

/**
 * Servlet implementation class LogoutServlet
 */
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Context ctx=(Context) request.getSession().getAttribute("context");
		
		request.getSession().invalidate();			
		response.sendRedirect("index.html");
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Context ctx=(Context) request.getSession().getAttribute("context");
		
		try {
			Richieste_agg_compBeanRemote remoteAbilityAdd=(Richieste_agg_compBeanRemote) ctx.lookup("Richieste_agg_compBean/remote");
			long userID=(Long) request.getSession().getAttribute("idUser");
			
			remoteAbilityAdd.removeRequest(userID);
			
			request.getSession().removeAttribute("context");
			request.getSession().invalidate();
			
			response.sendRedirect("index.html");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
