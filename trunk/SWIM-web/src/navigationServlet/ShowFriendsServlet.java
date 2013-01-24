package navigationServlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swim.entitybeans.User;
import swim.sessionbeans.AmicizieBeanRemote;

/**
 * Servlet implementation class FriendshipsServlet
 */
public class ShowFriendsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowFriendsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Context ctx=(Context)request.getSession().getAttribute("context");

		AmicizieBeanRemote remoteAmicizie;
		
		try{
		//	remoteUser = (UserBeanRemote) ctx.lookup("UserBean/remote");
			
			
			remoteAmicizie = (AmicizieBeanRemote) ctx.lookup("AmicizieBean/remote");
			
			long chi=Long.parseLong(request.getParameter("chi"));
			
			ArrayList<User> lista_amici=remoteAmicizie.getAmici(chi);
			
			request.getSession().setAttribute("listaAmici", lista_amici);
			request.getSession().setAttribute("chi", chi);
			
			response.sendRedirect("/SWIM-web/amici.jsp");
			
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
