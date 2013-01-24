package navigationServlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swim.entitybeans.User;
import swim.sessionbeans.AmicizieBeanRemote;

/**
 * Servlet implementation class RemoveFriendshipServlet
 */
public class RemoveFriendshipServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveFriendshipServlet() {
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
			AmicizieBeanRemote remoteFriend=(AmicizieBeanRemote) ctx.lookup("AmicizieBean/remote");
			
			long id1=(Long)request.getSession().getAttribute("idUser");
			long id2=Long.parseLong(request.getParameter("idProfilo"));
			
			remoteFriend.eliminaAmicizia(id1, id2);
			
			ArrayList<User> lista_amici=remoteFriend.getAmici(id1);
			request.getSession().setAttribute("chi", id1);
			request.getSession().setAttribute("listaAmici", lista_amici);
			response.sendRedirect("/SWIM-web/amici.jsp");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

}
