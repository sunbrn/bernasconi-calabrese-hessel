package navigationServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swim.sessionbeans.Archivio_compBeanLocal;
import swim.sessionbeans.Archivio_compBeanRemote;
import swim.sessionbeans.Comp_dichiarateBeanRemote;
import swim.sessionbeans.UserBeanRemote;

/**
 * Servlet implementation class AbilitySetUpServlet
 */
public class AbilitySetUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AbilitySetUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Context ctx=(Context) request.getSession().getAttribute("context");
		PrintWriter out = response.getWriter();
		
		try {
			Comp_dichiarateBeanRemote remoteAbilityAdder=(Comp_dichiarateBeanRemote) ctx.lookup("Comp_dichiarateBean/remote");
			Archivio_compBeanRemote remoteAbilityFolder=(Archivio_compBeanRemote) ctx.lookup("Archivio_compBean/remote");
			UserBeanRemote user=(UserBeanRemote) ctx.lookup("UserBean/remote");
			
			String newAbility= (String)request.getParameter("nuovaCompetenza");
			String abilityID=remoteAbilityFolder.getCodiceCompetenza(newAbility);
			ArrayList<String> abilitiesDeclared=remoteAbilityAdder.getCompetenzeDichiarate((Long)request.getSession().getAttribute("idUser"));
			
			boolean declared=false;
			for(String ability: abilitiesDeclared){
				if(ability.equalsIgnoreCase(newAbility)){
					declared=true;
				}
			}
			
			long id=(Long)request.getSession().getAttribute("idUser");
			if(!declared){
				remoteAbilityAdder.insertNewComp(id, abilityID);
			}else{
				out.println("competenza già dichiarata!");
			}
			
			ArrayList<String> elencoCompetenze=user.getNomiCompetenzeUtente(id);
			request.getSession().setAttribute("UserAbilities", elencoCompetenze);
			response.sendRedirect("/SWIM-web/homePageUtente.jsp");
			
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
