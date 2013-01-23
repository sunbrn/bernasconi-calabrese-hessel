package accessServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swim.entitybeans.Aiuto;
import swim.entitybeans.Comp_dichiarate;
import swim.entitybeans.User;
import swim.entitybeans.Richieste_agg_comp;

import swim.sessionbeans.Comp_dichiarateBeanRemote;
import swim.sessionbeans.Richieste_agg_compBeanRemote;
import swim.sessionbeans.UserBeanRemote;
import swim.sessionbeans.ValutazioniBeanRemote;
import swim.sessionbeans.AiutoBeanRemote;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String ADMIN="admin";
	private String ADMIN_PASS="admin";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		PrintWriter out = response.getWriter();
		
		try {
			
			Context ctx = getInitialContext();
			request.getSession().setAttribute("context", ctx);
			
			UserBeanRemote remoteUser;
			ValutazioniBeanRemote remoteFeedback;
			AiutoBeanRemote remoteHelp;
			Comp_dichiarateBeanRemote compDichiarate;
			Richieste_agg_compBeanRemote remoteRequest;
			
			remoteUser= (UserBeanRemote) ctx.lookup("UserBean/remote");
			remoteFeedback= (ValutazioniBeanRemote) ctx.lookup("ValutazioniBean/remote");
			remoteHelp= (AiutoBeanRemote) ctx.lookup("AiutoBean/remote");
			remoteRequest= (Richieste_agg_compBeanRemote) ctx.lookup("Richieste_agg_compBean/remote");
			
			String nickname=request.getParameter("username");
			String password=request.getParameter("password");
			
			if(nickname.equalsIgnoreCase(ADMIN)&&password.equals(ADMIN_PASS)){
				response.sendRedirect("/SWIM-web/adminHomePage.html");
			}else{
				
				long id=remoteUser.verificaCredenziali(nickname, password);
				
				if(id==-1){
					out.println("<p>Combinazione nickname-Password inesistente</p>");
					out.println("<p>ritorni alla home e inserisca nuovamente le sue credenziali di accesso</p>");
					out.print("<p><a href=\"index.html\"><b> Home </b></a><br><br></p>");
				}else{
					request.getSession().setAttribute("idUser", remoteUser.getUser(id).getUser_ID());
					request.getSession().setAttribute("User", remoteUser.getUser(id));
					
					ArrayList<String> elencoNomiCompetenze=remoteUser.getNomiCompetenzeUtente(id);
					int v1=remoteFeedback.getProfessionalità(id);
					int v2=remoteFeedback.getDisponibilità(id);
					int v3=remoteFeedback.getPrezzoPrestazione(id);
					Collection<String> elencoCommenti=remoteFeedback.getCommenti(id);
					ArrayList<Aiuto> elencoAiuti=remoteHelp.getAiuti(id);
					ArrayList<Richieste_agg_comp> mieRichieste= remoteRequest.getMieRichieste(id);
					
					ArrayList<User> elencoClienti=new ArrayList<User>();
					for(Aiuto a : elencoAiuti){
						if(a.getRichiedente()==id){
							elencoClienti.add(remoteUser.getUser(a.getOfferente()));
						}else{
							elencoClienti.add(remoteUser.getUser(a.getRichiedente()));
						}
					}	
					
					request.getSession().setAttribute("UserAbilities", elencoNomiCompetenze);
					request.getSession().setAttribute("UserProf", v1);
					request.getSession().setAttribute("UserDisp", v2);
					request.getSession().setAttribute("UserPrez", v3);
					request.getSession().setAttribute("UserComments", elencoCommenti);
					request.getSession().setAttribute("UserActiveHelps", elencoAiuti);
					request.getSession().setAttribute("UserHelpClients", elencoClienti);
					request.getSession().setAttribute("UserRequestToAdmin", mieRichieste);
					
					response.sendRedirect("/SWIM-web/homePageUtente.jsp");
				}
			}
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	private Context getInitialContext() throws NamingException {
		Hashtable<String,String> env = new Hashtable<String,String>();
		env.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
		env.put(Context.PROVIDER_URL,"localhost:1099");
		return new InitialContext(env);
	}

}
