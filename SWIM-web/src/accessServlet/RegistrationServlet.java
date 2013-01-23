package accessServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swim.sessionbeans.UserBeanRemote;
import swim.sessionbeans.ValutazioniBeanRemote;


/**
 * Servlet implementation class registrationServlet
 */
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("sono nella servlet");
		PrintWriter out = response.getWriter();
		
		try {
			Context ctx = getInitialContext();
			request.getSession().setAttribute("context", ctx);
			
			UserBeanRemote remoteUser;			
			remoteUser= (UserBeanRemote) ctx.lookup("UserBean/remote");
			
			String nome= request.getParameter("nome");
			String cognome= request.getParameter("cognome");
			String sesso= request.getParameter("sesso");
			String mail= request.getParameter("mail");
			String password= request.getParameter("password1");
			String passsword2= request.getParameter("password2");
			String nickname= request.getParameter("username");
			String dataDiNascita= request.getParameter("nascita");
			String città= request.getParameter("città");
			String diploma= request.getParameter("diploma");
			String laurea= request.getParameter("laurea");
			String altro= request.getParameter("altro");

			boolean dataNumero=true;
			try{
				int m=Integer.parseInt(dataDiNascita);
				if(m<1900||m>2000){
					dataNumero=false;
				}
			}catch(NumberFormatException n){
				dataNumero=false;
			}

			
			if(nome.equals("")||mail.equals("")||città.equals("")||cognome.equals("")||nickname.equals("")||(!password.equals(passsword2))||password.length()<6||dataDiNascita.length()<4||dataDiNascita.length()>4||(!dataNumero)){
				response.sendRedirect("/SWIM-web/registrazione.html");
			}else{		
				long id=remoteUser.insertNewUser(nome,cognome,sesso,mail,nickname,password,Integer.parseInt(dataDiNascita),città,diploma,laurea,altro);
				
				System.out.println(id);
				System.out.println("dopo l'inserimento");
				
				if(id==-1){
					out.print("<h1>Cambiare Nickname o Password</h1>");
					out.print("<br><br><a href=\"index.html\"><b>Torna alla Home</b></a><br><br>");
				}else{
					request.getSession().setAttribute("idUser", remoteUser.getUser(id).getUser_ID());
					System.out.println(remoteUser.getUser(id).getUser_ID());
					request.getSession().setAttribute("User", remoteUser.getUser(id));
					
					ArrayList<String> elencoNomiCompetenze=new ArrayList<String>();
					request.getSession().setAttribute("UserAbilities", elencoNomiCompetenze);
					
					response.sendRedirect("/SWIM-web/homePageUtente.jsp");
				}
			}
		}
		
		catch (NamingException e) {
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
