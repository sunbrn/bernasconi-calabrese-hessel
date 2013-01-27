package navigationServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import swim.sessionbeans.AmicizieBeanRemote;
import swim.sessionbeans.UserBeanRemote;
import swim.entitybeans.User;

import java.util.Hashtable;
import java.util.List; 
import java.util.ArrayList;

/**
 * Servlet implementation class SearchResultsServlet
 */
public class ShowSearchResultsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String SOLOAMICI="soloFraAmici";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowSearchResultsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Context ctx=(Context)request.getSession().getAttribute("context");
			UserBeanRemote remoteUser;
			AmicizieBeanRemote remoteFriend;
			
			if(ctx==null){
				ctx = getInitialContext();
				request.getSession().setAttribute("context", ctx);
			}
			
			remoteUser = (UserBeanRemote) ctx.lookup("UserBean/remote");
			remoteFriend = (AmicizieBeanRemote) ctx.lookup("AmicizieBean/remote");
			
			String nome=request.getParameter("nomeCercato");
			String cognome=request.getParameter("cognomeCercato");
			String competenza=request.getParameter("competenzaCercata");
			String checkBox=request.getParameter("check");
			ArrayList<User> lista=new ArrayList<User>();
			
			if(competenza.equals("")){
				lista=remoteUser.cercaPerNome(nome, cognome);
			}
			else{
				lista=remoteUser.cercaPerCompetenza(competenza);
			}
			
			if(checkBox.equals(SOLOAMICI)&&lista.size()!=0){
				ArrayList<User> listaAmici=new ArrayList<User>(); 
				for(User utente:lista){
					long user_id1=(Long)request.getSession().getAttribute("idUser");
					long user_id2=utente.getUser_ID();
					if(remoteFriend.verificaAmicizia(user_id1, user_id2)){
						listaAmici.add(utente);
					}
				}
				lista=listaAmici;
			}
			
			request.getSession().setAttribute("risultatiRicerca", lista);
			response.sendRedirect("/SWIM-web/risultatiRicerca.jsp");
			
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

	private Context getInitialContext() throws NamingException {
		Hashtable<String,String> env = new Hashtable<String,String>();
		env.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
		env.put(Context.PROVIDER_URL,"localhost:1099");
		return new InitialContext(env);
	}
	
	
	
}
