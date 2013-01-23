package navigationServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swim.sessionbeans.AiutoBeanRemote;
import swim.sessionbeans.Comp_dichiarateBeanRemote;

/**
 * Servlet implementation class HelpTerminationServlet
 */
public class HelpTerminationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelpTerminationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Context ctx=(Context)request.getSession().getAttribute("context");
		
		try{
			AiutoBeanRemote remoteHelp=(AiutoBeanRemote) ctx.lookup("AiutoBean/remote");
			long help_ID= (Long)request.getSession().getAttribute("help_ID");
			long offerente_ID= (Long)request.getSession().getAttribute("offerente_ID");
			long richiedente_ID= (Long)request.getSession().getAttribute("richiedente_ID");
			remoteHelp.concludiAiuto(help_ID);
			response.sendRedirect("inserisciFeedback.html");
			
		}catch (NamingException e) {
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
