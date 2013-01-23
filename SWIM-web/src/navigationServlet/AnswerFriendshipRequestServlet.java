package navigationServlet;

import java.io.IOException;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swim.sessionbeans.AmicizieBeanRemote;

/**
 * Servlet implementation class FriendshipAnswerServlet
 */
public class AnswerFriendshipRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String ACCETTATA="accettata";
	private String RIFUTATA="rifiutata";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerFriendshipRequestServlet() {
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
			
			long id1= (long)request.getSession().getAttribute("idUser");
			String id2=request.getParameter("amicoFuturo_ID");
			
			System.out.println("answer friend servlet");
			if(request.getParameter("accettazione").equalsIgnoreCase(ACCETTATA)){
				remoteFriendship.accettaAmicizia(id1, Long.parseLong(id2));
				System.out.println("son nell'if");
			}else if(request.getParameter("accettazione").equals(RIFUTATA)){
				remoteFriendship.rifiutaAmicizia(id1, Long.parseLong(id2));
				System.out.println("son nell'else");
			}
			
			response.sendRedirect("homePageUtente.jsp");
			//ServletContext sc = getServletContext();  
			//RequestDispatcher rd = sc.getRequestDispatcher("ShowFriendsRequestSuggestionsServlet");
			//rd.forward(request,response);  
			
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
