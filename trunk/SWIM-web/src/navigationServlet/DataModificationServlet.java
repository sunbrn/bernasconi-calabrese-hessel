package navigationServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swim.sessionbeans.UserBeanRemote;

/**
 * Servlet implementation class DataModificationServlet
 */
public class DataModificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataModificationServlet() {
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
		Context ctx= (Context) request.getSession().getAttribute("context");
		PrintWriter out = response.getWriter();
		
		try {
			
			UserBeanRemote remoteUser= (UserBeanRemote) ctx.lookup("UserBean/remote");
			
			String nome= request.getParameter("nuovoNome");
			String cognome= request.getParameter("nuovoCognome");
			String sesso= request.getParameter("nuovoSesso");
			String mail= request.getParameter("nuovaMail");
			String passwordVecchia=request.getParameter("vecchiaPassword");
			String password= request.getParameter("nuovaPassword1");
			String nickname= request.getParameter("nuovoUsername");
			String dataDiNascita= request.getParameter("nuovaNascita");
			String città= request.getParameter("nuovaCittà");
			String diploma= request.getParameter("nuovoDiploma");
			String laurea= request.getParameter("nuovaLaurea");
			String altro= request.getParameter("nuovoAltro");
			
			long userID=(Long)request.getSession().getAttribute("idUser");
			
			if(password.equals("")||passwordVecchia.equals(remoteUser.getUser(userID).getPassword())){
				if(password.equals("")){
					password=remoteUser.getUser(userID).getPassword();
				}
				if(nome.equals("")){
					nome=remoteUser.getUser(userID).getNome();
				}
				if(cognome.equals("")){
					cognome=remoteUser.getUser(userID).getCognome();
				}
				if(sesso.equals("")){
					sesso=remoteUser.getUser(userID).getSesso();
				}
				if(mail.equals("")){
					mail=remoteUser.getUser(userID).getMail();
				}
				if(nickname.equals("")){
					nickname=remoteUser.getUser(userID).getNickname();
				}
				if(dataDiNascita.equals("")){
					Integer nascita=remoteUser.getUser(userID).getData_nascita();
					dataDiNascita= nascita.toString();
				}
				if(città.equals("")){
					città=remoteUser.getUser(userID).getCittà();
				}
				if(diploma.equals("")){
					diploma=remoteUser.getUser(userID).getDiploma();
				}
				if(laurea.equals("")){
					laurea=remoteUser.getUser(userID).getLaurea();
				}
				if(altro.equals("")){
					altro=remoteUser.getUser(userID).getAltro();
				}
				
				remoteUser.updateUser(userID, nome, cognome, sesso, mail, nickname, password, Integer.parseInt(dataDiNascita), città, diploma, laurea, altro);
				
				response.sendRedirect("/SWIM-web/homePageUtente.jsp");
				
			}else{
				out.println("errore nella modifica della password! controllare che la password nuova sia uguale alla vecchia oppure che tutti i campi siano vuoti");
			}
			} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
