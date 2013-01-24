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
 * Servlet implementation class FriendsRequestAndSuggestionsServlet
 */
public class ShowFriendsRequestSuggestionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowFriendsRequestSuggestionsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Context ctx=(Context)request.getSession().getAttribute("context");
		try {
			
			AmicizieBeanRemote remoteFrienship=(AmicizieBeanRemote) ctx.lookup("AmicizieBean/remote");
			
			long userID=(Long)request.getSession().getAttribute("idUser");
			
			ArrayList<User> richiesteAmicizia=remoteFrienship.getRichiesteAmicizie(userID);
			request.getSession().setAttribute("richiesteAmicizia", richiesteAmicizia);
			
			ArrayList<User> consigliAmicizia=remoteFrienship.getAmicizieConsigliate(userID);
			request.getSession().setAttribute("consigliAmicizia", consigliAmicizia);
			
			response.sendRedirect("elencoRichiesteConsigliAmicizia.jsp");
			
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
