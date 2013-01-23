package navigationServlet;

import java.io.IOException;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swim.sessionbeans.AmicizieBeanRemote;

/**
 * Servlet implementation class FriendshipServlet
 */
public class CreateFriendshipRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static final int RICHIESTA=0;
	static final int CONSIGLIATA=1;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateFriendshipRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Context ctx=(Context)request.getSession().getAttribute("context");
			
		try {
			AmicizieBeanRemote remoteFriendship =(AmicizieBeanRemote) ctx.lookup("AmicizieBean/remote");
			
			long id1=(Long)request.getSession().getAttribute("idUser");
			long id2= (Long) request.getSession().getAttribute("idProfilo");
			
			remoteFriendship.richiediAmicizia(id1,id2);
			
			request.getSession().setAttribute("visitedUserStatoAmicizia", true);
			
			response.sendRedirect("/SWIM-web/profiloPubblico.jsp");
			
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
