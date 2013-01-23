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

import swim.entitybeans.Amicizie;
import swim.entitybeans.User;

/**
 * Session Bean implementation class AmicizieBean
 */
@Stateless
public class AmicizieBean implements AmicizieBeanRemote {
	
	@PersistenceContext(unitName="swim_project") private EntityManager manager;
	static final int RICHIESTA=0;
	static final int ACCETTATA=1;
	static final int CONSIGLIATA=2;
	static final int CONSIGLIATAeRICHIESTA=3;
	
    /**
     * Default constructor. 
     */
    public AmicizieBean() {
    }

    public void richiediAmicizia(long id1,long id2){
		try{
    	Query q=manager.createQuery("FROM Amicizie a WHERE (a.user_ID1=:new_user_ID1 AND a.user_ID2=:new_user_ID2) OR (a.user_ID2=:new_user_ID1 AND a.user_ID1=:new_user_ID2)");
    	q.setParameter("new_user_ID1", id1);
    	q.setParameter("new_user_ID2", id2);
    	Amicizie a=(Amicizie)q.getSingleResult();
    	
    	if(a.getStato()==RICHIESTA){
    		consigliaAmicizia(id1,id2);
    		consigliaAmicizia(id2, id1);
    		a.setStato(ACCETTATA);
    		manager.merge(a);		
    	}
    	if(a.getStato()==CONSIGLIATA){
    		if(a.getUser_ID1()==id1){
    			a.setStato(CONSIGLIATAeRICHIESTA);
    			manager.merge(a);
    		}else{
    			long u1=id1;
    			long u2=a.getUser_ID1();
    			manager.remove(a);
        		Amicizie newAmicizia= new Amicizie();
        		newAmicizia.setUser_ID1(id1);  
        		newAmicizia.setUser_ID2(id2);
        		newAmicizia.setStato(RICHIESTA);
        		manager.persist(newAmicizia);
    		}
    	}
    	if(a.getStato()==CONSIGLIATAeRICHIESTA){
    		a.setStato(ACCETTATA);
    		manager.merge(a);
    	}
    	
    	
		}catch(NoResultException e){
    		Amicizie newAmicizia= new Amicizie();
    		newAmicizia.setUser_ID1(id1);  
    		newAmicizia.setUser_ID2(id2);
    		newAmicizia.setStato(RICHIESTA);
    		manager.persist(newAmicizia);
		}
}


    /**
     * se l'amicizia da accettare Ë una amicizia consigliata dal sistema si cre una nuova tupla nella tabella amicizie
     * altrimenti se l'amicizia non Ë stata consigliata allora vengono aggiunti tutti i consigli di amicizia ai due utenti
     * @param id1
     * @param id2
     */
    public void accettaAmicizia(long id1, long id2){
    	Query q=manager.createQuery("FROM Amicizie a WHERE (a.user_ID1=:new_user_ID1 AND a.user_ID2=:new_user_ID2) OR (a.user_ID2=:new_user_ID1 AND a.user_ID1=:new_user_ID2)");
    	q.setParameter("new_user_ID1", id1);
    	q.setParameter("new_user_ID2", id2);
    	Amicizie a=(Amicizie)q.getSingleResult();
    	
    	if(a.getStato()==CONSIGLIATAeRICHIESTA){
    		a.setStato(ACCETTATA);
    		manager.merge(a);
    	}else if(a.getStato()==RICHIESTA){
    		consigliaAmicizia(id1,id2);
    		consigliaAmicizia(id2, id1);
    		a.setStato(ACCETTATA);
    		manager.merge(a);
    	}else if(a.getStato()==CONSIGLIATA){
			a.setStato(CONSIGLIATAeRICHIESTA);
			manager.merge(a);
		}
    }

	private void consigliaAmicizia(long id1,long id2) {
		Query q=manager.createQuery("FROM Amicizie a WHERE (a.user_ID1=:new_user_ID1 OR a.user_ID2=:new_user_ID1) AND a.stato=:accettata");
    	q.setParameter("new_user_ID1", id1);
    	q.setParameter("accettata", ACCETTATA);
		Collection<Amicizie> a=(Collection<Amicizie>)q.getResultList();
				
		for(Amicizie am: a){
			if(am.getUser_ID1()==id1){
				try{
				Query qu=manager.createQuery("FROM Amicizie a WHERE (a.user_ID1=:new_user_ID1 AND a.user_ID2=:new_user_ID2) OR (a.user_ID2=:new_user_ID1 AND a.user_ID1=:new_user_ID2)");
		    	qu.setParameter("new_user_ID1", am.getUser_ID2());
		    	qu.setParameter("new_user_ID2", id2);
		    	ArrayList<Amicizie> gi‡Amico=(ArrayList<Amicizie>)q.getResultList();
		    	if(gi‡Amico.size()!=0){
		    		creaNuovaAmiciziaConsigliata(id2,am.getUser_ID2());
		    	}
		    	}catch(NoResultException e){
		    		creaNuovaAmiciziaConsigliata(id2,am.getUser_ID2());		
				}
			}else{
				try{
				Query qu=manager.createQuery("FROM Amicizie a WHERE (a.user_ID1=:new_user_ID1 AND a.user_ID2=:new_user_ID2) OR (a.user_ID2=:new_user_ID1 AND a.user_ID1=:new_user_ID2)");
			    qu.setParameter("new_user_ID1", am.getUser_ID1());
			    qu.setParameter("new_user_ID2", id2);
			    ArrayList<Amicizie> gi‡Amico=(ArrayList<Amicizie>)q.getResultList();
			    if(gi‡Amico.size()!=0){
			    	creaNuovaAmiciziaConsigliata(id2,am.getUser_ID1());
		    	}
				}catch(NoResultException e){
					creaNuovaAmiciziaConsigliata(id2,am.getUser_ID1());
				}
			}
		}
	}

	private void creaNuovaAmiciziaConsigliata(long id1, long id2) {
		Amicizie amicizia=new Amicizie();
		amicizia.setUser_ID1(id1);
		amicizia.setUser_ID2(id2);
		amicizia.setStato(CONSIGLIATA);
		manager.persist(amicizia);
	}

	public ArrayList<User> getAmici(long id){
		try{
			Query q=manager.createQuery("FROM Amicizie a WHERE (a.user_ID1=:new_user_ID OR a.user_ID2=:new_user_ID) AND a.stato=:accettata");
			q.setParameter("new_user_ID", id);
			q.setParameter("accettata", ACCETTATA);
			
			ArrayList<Amicizie> amici=(ArrayList<Amicizie>) q.getResultList();
			ArrayList<User> utenti=new ArrayList<User>();
			for(Amicizie amico: amici){
				if(amico.getUser_ID1()==id){
					utenti=creaListaUtenti(utenti, amico.getUser_ID2());
				}else{
					utenti=creaListaUtenti(utenti, amico.getUser_ID1());
				}
			} 
			return utenti;	
		}catch(NullPointerException e){
			ArrayList<User> utenti=new ArrayList<User>();
			return utenti;
		}
	}
	
	public ArrayList<User> getRichiesteAmicizie(long id){
		try{
			
			Query q=manager.createQuery("FROM Amicizie a WHERE ((a.user_ID2=:new_user_ID) AND (a.stato=:richiesta OR a.stato=:consigliataerichiesta))");
			q.setParameter("new_user_ID", id);
			q.setParameter("richiesta", RICHIESTA);
			q.setParameter("consigliataerichiesta", CONSIGLIATAeRICHIESTA);
			
			ArrayList<Amicizie> richiesteAmicizia=(ArrayList<Amicizie>) q.getResultList();
			ArrayList<User> utenti=new ArrayList<User>();
			
			for(Amicizie amico: richiesteAmicizia){
				utenti=creaListaUtenti(utenti, amico.getUser_ID1());
			} 
			return utenti;
			
		}catch(NullPointerException e){
			ArrayList<User> utenti=new ArrayList<User>();
			return utenti;
		}
	}
	
	public ArrayList<User> getAmicizieConsigliate(long id){
		try{
			Query q=manager.createQuery("FROM Amicizie a WHERE a.user_ID1=:new_user_ID AND a.stato=:consigliata");
			q.setParameter("new_user_ID", id);
			q.setParameter("consigliata",CONSIGLIATA);
			
			ArrayList<Amicizie> amicizieConsigliate=(ArrayList<Amicizie>) q.getResultList();
			ArrayList<User> utenti=new ArrayList<User>();
			
			for(Amicizie amico: amicizieConsigliate){
					utenti=creaListaUtenti(utenti, amico.getUser_ID2());
			} 
			return utenti;
		}catch(NullPointerException e){
			ArrayList<User> utenti=new ArrayList<User>();
			return utenti;
		}
	}
	
	public void rifiutaAmicizia(long id1, long id2){
		Query q=manager.createQuery("FROM Amicizie a WHERE a.user_ID1=:new_user_ID1 AND a.user_ID2=:new_user_ID2 OR a.user_ID1=:new_user_ID2 AND a.user_ID2=:new_user_ID1");
		q.setParameter("new_user_ID1",id1);
		q.setParameter("new_user_ID2",id2);
		Amicizie a=(Amicizie) q.getSingleResult();
		manager.remove(a);
	}
	
	private ArrayList<User> creaListaUtenti(ArrayList<User> utenti,long idDelRichiedente){
		try {
			InitialContext ctx= new InitialContext();
			UserBeanLocal userBean;
			userBean= (UserBeanLocal) ctx.lookup("UserBean/local");
			utenti.add(userBean.getUser(idDelRichiedente));
			return utenti;
		} catch (NamingException e) {
			return utenti;
		}
	}

	public boolean verificaAmicizia(long user_id1, long user_id2) {
		try{
			Query q=manager.createQuery("FROM Amicizie a WHERE (a.user_ID1=:new_user_ID1 AND a.user_ID2=:new_user_ID2 OR a.user_ID1=:new_user_ID2 AND a.user_ID2=:new_user_ID1) AND a.stato=:accettata");
			q.setParameter("new_user_ID1",user_id1);
			q.setParameter("new_user_ID2",user_id2);
			q.setParameter("accettata", ACCETTATA);
			Amicizie a=(Amicizie) q.getSingleResult();
			return true;
		}catch(NoResultException e){
			return false;
		}
	}
	
	public boolean verificaRichiesta(long user_id1, long user_id2) {
		try{
			Query q=manager.createQuery("FROM Amicizie a WHERE (a.user_ID1=:new_user_ID1 AND a.user_ID2=:new_user_ID2 OR a.user_ID1=:new_user_ID2 AND a.user_ID2=:new_user_ID1)");
			q.setParameter("new_user_ID1",user_id1);
			q.setParameter("new_user_ID2",user_id2);
			Amicizie a=(Amicizie) q.getSingleResult();
			
			if(a.getStato()==ACCETTATA){
				return true;
			}else if(a.getStato()==RICHIESTA){
				if(a.getUser_ID1()==user_id1){
					return true;
				}else{
					return false;
				}
			}else if(a.getStato()==CONSIGLIATAeRICHIESTA){
				if(a.getUser_ID1()==user_id1){	
					return true;
				}else{
					return false;
					}
			}
		}catch(NoResultException e){
			return false;
		}
		
		
		
		
		return false;
		
	}
}
