package navigationServlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swim.sessionbeans.AiutoBeanRemote;
import swim.sessionbeans.UserBeanRemote;
import swim.entitybeans.Aiuto;



/**
 * Servlet implementation class HelpRequestListServlet
 */
public class HelpRequestListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelpRequestListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Context ctx= (Context) request.getSession().getAttribute("context");
		
		try {
			AiutoBeanRemote remoteHelp= (AiutoBeanRemote) ctx.lookup("AiutoBean/remote");
			UserBeanRemote remoteUser= (UserBeanRemote) ctx.lookup("UserBean/remote");
			
			long idUser= (Long) request.getSession().getAttribute("idUser");
			
			ArrayList<Aiuto> elencoRichiesteAiuto=new ArrayList<Aiuto>();
			elencoRichiesteAiuto= remoteHelp.getRichiesteAiuto(idUser);
			ArrayList<String> elencoRichiedentiAiuto= new ArrayList<String>();
			
			if(elencoRichiesteAiuto.size()!=0){
				for(Aiuto a : elencoRichiesteAiuto){
					long idRichiedente=a.getRichiedente();
					String generalitÓRichiedente= remoteUser.getUser(idRichiedente).getNome()+" "+remoteUser.getUser(idRichiedente).getCognome();
					elencoRichiedentiAiuto.add(generalitÓRichiedente);
				}			

			}
			
			request.getSession().setAttribute("UserHelpRequestsList",elencoRichiesteAiuto);
			request.getSession().setAttribute("UserClientRequestList", elencoRichiedentiAiuto);
			response.sendRedirect("elencoRichiesteAiuto.jsp");
						
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
