package navigationServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.naming.Context;
import javax.naming.NamingException;

import java.util.ArrayList;
import java.util.Collection;

import swim.sessionbeans.Comp_dichiarateBeanRemote;
import swim.sessionbeans.UserBeanRemote;
import swim.sessionbeans.ValutazioniBeanRemote;
import swim.sessionbeans.AmicizieBeanRemote;
import swim.entitybeans.User;
/**
 * Servlet implementation class UserProfileServlet
 */
public class ShowUserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowUserProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Context ctx=(Context)request.getSession().getAttribute("context");
		
		UserBeanRemote remoteUser;
		ValutazioniBeanRemote remoteFeedback;
		AmicizieBeanRemote remoteFriend;

		
		try {
			remoteUser = (UserBeanRemote) ctx.lookup("UserBean/remote");		
			remoteFeedback=(ValutazioniBeanRemote) ctx.lookup("ValutazioniBean/remote");
			remoteFriend=(AmicizieBeanRemote) ctx.lookup("AmicizieBean/remote");
			
			long idProfilo=Long.parseLong(request.getParameter("idProfilo"));

			User u=remoteUser.getUser(idProfilo);
			ArrayList<String> elencoNomiCompetenze=remoteUser.getNomiCompetenzeUtente(idProfilo);	
			int v1=remoteFeedback.getProfessionalit‡(idProfilo);
			int v2=remoteFeedback.getDisponibilit‡(idProfilo);
			int v3=remoteFeedback.getPrezzoPrestazione(idProfilo);
			Collection<String> elencoCommenti=remoteFeedback.getCommenti(idProfilo);

			
			request.getSession().setAttribute("idProfilo", idProfilo);
			request.getSession().setAttribute("visitedUser", u);
			request.getSession().setAttribute("visitedUserAbilities", elencoNomiCompetenze);
			request.getSession().setAttribute("visitedUserProf", v1);
			request.getSession().setAttribute("visitedUserDisp", v2);
			request.getSession().setAttribute("visitedUserPrez", v3);
			request.getSession().setAttribute("visitedUserComments", elencoCommenti);
			
			if(request.getSession().getAttribute("idUser")!=null){
				long idUser= (Long) request.getSession().getAttribute("idUser");
				boolean gi‡Amico=remoteFriend.verificaAmicizia(idProfilo, idUser); 
				request.getSession().setAttribute("visitedUserStatoAmicizia", gi‡Amico);
			}
			
			response.sendRedirect("/SWIM-web/profiloPubblico.jsp");
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
