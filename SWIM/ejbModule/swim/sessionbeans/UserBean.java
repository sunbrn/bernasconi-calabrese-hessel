package swim.sessionbeans;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.ejb.Stateless;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.jboss.ejb3.annotation.RemoteBinding;

import swim.entitybeans.User;

/**
 * Session Bean implementation class userBean
 */
@Stateless
public class UserBean implements UserBeanRemote, UserBeanLocal {
	
	@PersistenceContext(unitName="swim_project") private EntityManager manager;
    /**
     * Default constructor. 
     */
    public UserBean() {
        // TODO Auto-generated constructor stub
    }
    
    public long insertNewUser(String nome, String cognome,String sesso, String mail, String nickname, String password, int data_nascita, String città, String diploma, String laurea, String altro){
    	if(verificaCredenzialiNonPresenti(nickname, password)){
    		User user=new User();
    		user=createUser(user,nome, cognome, sesso, mail, nickname, password, data_nascita, città, diploma, laurea, altro);
    		
    		manager.persist(user);
    		
    		return user.getUser_ID();
    	}else{
    		return -1;
    	}
    }
    
    public void updateUser(long user_ID,String nome, String cognome,String sesso, String mail, String nickname, String password, int data_nascita, String città, String diploma, String laurea, String altro){
    	User u=getUser(user_ID);
    	u=createUser(u, nome, cognome, sesso, mail, nickname, password, data_nascita, città, diploma, laurea, altro);
    	
    	manager.merge(u);
    }
    
    public void deleteUser (long id){
    	User u=getUser(id);
    	manager.remove(u);
    }
    
    private User createUser(User user,String nome, String cognome,String sesso, String mail, String nickname, String password, int data_nascita, String città, String diploma, String laurea, String altro){
    	
    	user.setNome(nome);
		user.setCognome(cognome);
		user.setSesso(sesso);
		user.setMail(mail);
		user.setNickname(nickname);
		user.setPassword(password);
		user.setData_nascita(data_nascita);
		user.setCittà(città);
		user.setDiploma(diploma);
		user.setLaurea(laurea);
		user.setAltro(altro);
		
		return user;
    }
    
    private boolean verificaCredenzialiNonPresenti(String nickname,String password){
    	try{
	    	Query q=manager.createQuery("FROM User u WHERE u.nickname=:new_nickname AND u.password=:new_password");
	    	q.setParameter("new_nickname", nickname);
	    	q.setParameter("new_password", password);
	    	ArrayList<User> users=(ArrayList<User>) q.getResultList();
	    	if(users.size()==0){
	    		return true;
	    	}else{
	    		return false;	
	    	}
    	}catch(NullPointerException e){
    		return true;
    	}
    }
    
    public long verificaCredenziali(String nickname,String password){
    	try{
    		Query q=manager.createQuery("FROM User u WHERE u.nickname=:new_nickname AND u.password=:new_password");
	    	q.setParameter("new_nickname", nickname);
	    	q.setParameter("new_password", password);
	    	User u=(User)q.getSingleResult();
	    	return u.getUser_ID();
	    	}catch(NoResultException e){
	    		return -1;	
	    	}
    }
    /**
     * 
     * @param userID
     * @return restituisce al chiamante i dati da pbblicare sul profilo sotto forma di stringa separati da &
     */
    public User getUser(long id){
    	try{
    	Query q=manager.createQuery("FROM User u WHERE u.user_ID=:new_userID");
    	q.setParameter("new_userID", id);
    	User u=(User)q.getSingleResult();
    	return u;
    	}catch(NullPointerException e){
    		User u=new User();
    		return u;
    	}
    	

    }
    
    public ArrayList<User> cercaPerNome(String new_nome, String new_cognome){
    	try{
	    	Query q=manager.createQuery("FROM User u WHERE u.nome=:new_nome AND u.cognome=:new_cognome");
	    	q.setParameter("new_nome", new_nome);
	    	q.setParameter("new_cognome", new_cognome);
			ArrayList<User> u=(ArrayList<User>)q.getResultList();
			return u;
    	}catch(NullPointerException e){
    		ArrayList<User> u=new ArrayList<User>();
    		return u;
    	}
    }
    
    public ArrayList<User> cercaPerCompetenza(String new_competenza){
    	InitialContext ctx;
		try {
			ctx = new InitialContext();
			Archivio_compBeanLocal arc;
			arc = (Archivio_compBeanLocal) ctx.lookup("Archivio_compBean/local");
			String codiceCompetenza=arc.getCodiceCompetenza(new_competenza);
			
			Comp_dichiarateBeanLocal comp=(Comp_dichiarateBeanLocal) ctx.lookup("Comp_dichiarateBean/local");
			ArrayList<Long> codiciUtenti=(ArrayList<Long>)comp.getUtentiConCompetenza(codiceCompetenza);
			
			ArrayList<User> utenti=new ArrayList<User>();
			for(long codice:codiciUtenti){
				utenti.add(getUser(codice));
			}
			return utenti;
		} catch (NamingException e) {
			ArrayList<User> utenti=new ArrayList<User>();
			return utenti;
		}
    }
    
    public ArrayList<String> getNomiCompetenzeUtente(long id){
    	try {
			InitialContext ctx=new InitialContext();
			
	    	Comp_dichiarateBeanLocal compDich=(Comp_dichiarateBeanLocal) ctx.lookup("Comp_dichiarateBean/local");
	    	Archivio_compBeanLocal archivio=(Archivio_compBeanLocal) ctx.lookup("Archivio_compBean/local");
	    	
	    	ArrayList<String> elencoCodiciCompetenze=compDich.getCompetenzeDichiarate(id);
	    	ArrayList<String> elencoNomiCompetenze=new ArrayList<String>();
	    	
	    	int i=0;
	    	 
	    	for (String s: elencoCodiciCompetenze){
	    		elencoNomiCompetenze.add(i, archivio.getNomeCompetenza(s));
	    		i++;
	    	}
	    	return elencoNomiCompetenze;
    	} catch (NamingException e) {
    		ArrayList<String> elencoNomiCompetenze=new ArrayList<String>();
    		return elencoNomiCompetenze;
		}
    }
}
