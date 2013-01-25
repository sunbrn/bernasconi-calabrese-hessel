package swim.sessionbeans;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import swim.entitybeans.Richieste_agg_comp;
/**
 * Session Bean implementation class Richieste_agg_compBean
 */
@Stateless
public class Richieste_agg_compBean implements Richieste_agg_compBeanRemote,Richieste_agg_compBeanLocal {
	
	@PersistenceContext(unitName="swim_project") private EntityManager manager;
	
	private String ACCETTATA="accettata";
	private String RIFIUTATA="rifiutata";
	private String ATTESA="attesa";
	
	/**
     * Default constructor. 
     */
    public Richieste_agg_compBean() {
        // TODO Auto-generated constructor stub
    }
    
    public void insertNewRequest(long user_ID,String testo_richiesta){
    	Richieste_agg_comp richiesta=new Richieste_agg_comp();
    	
    	richiesta.setData();
    	richiesta.setUser_ID(user_ID);
    	richiesta.setStato(ATTESA);
    	richiesta.setTesto_richiesta(testo_richiesta);
    	manager.persist(richiesta);
    }
    
    public void acceptRequest(long richiesta_ID){
    	Query q=manager.createQuery("FROM Richieste_agg_comp r WHERE r.richiesta_ID=:new_richiesta_ID");
    	q.setParameter("new_richiesta_ID",richiesta_ID);
    	Richieste_agg_comp r=(Richieste_agg_comp) q.getSingleResult();
    	r.setStato(ACCETTATA);
    	manager.merge(r);
    }
    
    public void rejectRequest(long richiesta_ID){
    	Query q=manager.createQuery("FROM Richieste_agg_comp r WHERE r.richiesta_ID=:new_richiesta_ID");
    	q.setParameter("new_richiesta_ID",richiesta_ID);
    	Richieste_agg_comp r=(Richieste_agg_comp) q.getSingleResult();
    	r.setStato(RIFIUTATA);
    	manager.merge(r);
    }
    
    public void removeRequest(long user_ID){
    	try{
    		System.out.println("sono in removeRequest");
    		System.out.println("parametro passato:"+user_ID);
    		Query q=manager.createQuery("FROM Richieste_agg_comp r WHERE (r.user_ID=:id AND (r.stato=:rifiutata OR r.stato=:accettata))");
	    	q.setParameter("id",user_ID);
	    	q.setParameter("rifiutata", RIFIUTATA);
	    	q.setParameter("accettata", ACCETTATA);
	    	ArrayList<Richieste_agg_comp> elencoRich=(ArrayList<Richieste_agg_comp>) q.getResultList();
	    	for(Richieste_agg_comp r : elencoRich){
	    		manager.remove(r);
	    	}
    	}catch(NoResultException e){
    	}
    }
    
    public ArrayList<Richieste_agg_comp> getTutteRichiesteAggiuntaCompetenze(){
    	try{
	    	Query q=manager.createQuery("FROM Richieste_agg_comp r WHERE r.stato=:attesa");
	    	q.setParameter("attesa", ATTESA);
	    	ArrayList<Richieste_agg_comp> r=(ArrayList<Richieste_agg_comp>)q.getResultList();
	    	return r;
    	}catch(NullPointerException e){
    		ArrayList<Richieste_agg_comp> r= new ArrayList<Richieste_agg_comp>();
	    	return r;
    	}
    }

	public ArrayList<Richieste_agg_comp> getMieRichieste(long userID) {
		try{
			Query q=manager.createQuery("FROM Richieste_agg_comp r WHERE r.user_ID=:new_user_ID");
			q.setParameter("new_user_ID",userID);
			ArrayList<Richieste_agg_comp> r = (ArrayList<Richieste_agg_comp>)q.getResultList();
			return r;
		}catch (NullPointerException e){
			ArrayList<Richieste_agg_comp> r= new ArrayList<Richieste_agg_comp>();
			return r;
		}
	}

	@Override
	public void eliminaTutteRichieste(long id) {
		ArrayList<Richieste_agg_comp> mieRichieste=getMieRichieste(id);
		for(Richieste_agg_comp richiesta: mieRichieste){
			manager.remove(richiesta);
		}
		
	}
	
	
}	