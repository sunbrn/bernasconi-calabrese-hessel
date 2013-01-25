package swim.sessionbeans;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.ejb.Stateless;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import swim.entitybeans.Aiuto;

/**
 * Session Bean implementation class AiutoBean
 */
@Stateless
public class AiutoBean implements AiutoBeanRemote,AiutoBeanLocal {
	
	@PersistenceContext(unitName="swim_project") private EntityManager manager;

    /**
     * Default constructor. 
     */
    public AiutoBean() {
        // TODO Auto-generated constructor stub
    }
    
    public long richiediAiuto(String comp,long rich,long off,String messRich){
      	String codice_comp=ottieniCodice(comp);
      	Aiuto aiuto=new Aiuto();
    	aiuto.setCodice_comp(codice_comp);
    	aiuto.setRichiedente(rich);
    	aiuto.setOfferente(off);
    	aiuto.setData_inizio();
    	aiuto.setMexRich(messRich);
    	aiuto.setMexRisp(null);
    	aiuto.setAccettato(false);
    	aiuto.setConcluso(false);
    	
    	manager.persist(aiuto);
    	return aiuto.getHelp_ID();
    }
    
    private String ottieniCodice(String comp) {
    	Archivio_compBeanLocal arc;
		try {
			InitialContext ctx=new InitialContext();
			arc = (Archivio_compBeanLocal) ctx.lookup("Archivio_compBean/local");
			String codice_comp=arc.getCodiceCompetenza(comp);
			return codice_comp;
		} catch (NamingException e) {
			return null;
		}
	}


    
    public Aiuto getAiuto(long id){
    	try{
    		Query q=manager.createQuery("FROM Aiuto a WHERE a.help_ID=:new_helpID");
    		q.setParameter("new_helpID", id);
    		Aiuto a=(Aiuto)q.getSingleResult();
    		return a;
    	}catch(NullPointerException e){
    		Aiuto a=new Aiuto();
    		return a;
    	}
    	
    }
    
    public void rispostaAiuto(long help_ID,boolean risp,String mexRisp){
    		Query q=manager.createQuery("FROM Aiuto a WHERE(a.help_ID=:new_help_ID)");
	    	q.setParameter("new_help_ID",help_ID);
	    	Aiuto a=(Aiuto)q.getSingleResult();
	    	if(a.isAccettato()==false){    	
	    		if(risp==false){
		    				manager.remove(a);
		    	}else {
		    				a.setAccettato(true);
		    				a.setMexRisp(mexRisp);
		    				manager.merge(a);
		    	}
	    	}
    }
    
    public void concludiAiuto(long help_ID){
    	try{
    		Query q=manager.createQuery("FROM Aiuto a WHERE(a.help_ID=:new_help_ID)");
	    	q.setParameter("new_help_ID",help_ID);
	    	Aiuto a=(Aiuto)q.getSingleResult();
	    	a.setConcluso(true);
    	}catch(NullPointerException e){
    	}
    }
        
    public ArrayList<Aiuto> getAiuti(long userID){
    	try{
			Query q=manager.createQuery("FROM Aiuto a WHERE (a.richiedente=:new_user_ID OR a.offerente=:new_user_ID) AND a.accettato=:true AND a.concluso=:false");
			q.setParameter("new_user_ID",userID);
			q.setParameter("true", true);
			q.setParameter("false", false);
			ArrayList<Aiuto> aiuti=(ArrayList<Aiuto>) q.getResultList();
			return aiuti;
    	}catch(NullPointerException e){
    		ArrayList<Aiuto> aiuti=new ArrayList<Aiuto>();
    		return aiuti;
    	}
    }
    
	public ArrayList<Aiuto> getRichiesteAiuto(long userID){
		try{
			Query q=manager.createQuery("FROM Aiuto a WHERE (a.offerente=:new_user_ID) AND a.accettato=:false");
			q.setParameter("new_user_ID",userID);
			q.setParameter("false", false);
			ArrayList<Aiuto> richiesteAiuto=(ArrayList<Aiuto>) q.getResultList();
			return richiesteAiuto;
		}catch(NullPointerException e){
			ArrayList<Aiuto> richiesteAiuto=new ArrayList<Aiuto>();
			return richiesteAiuto;
		}
	}

	@Override
	public void eliminaTuttiAiuti(long id) {
		ArrayList<Aiuto> aiuti=getAiuti(id);
		for(Aiuto a:aiuti){
			manager.remove(a);
		}
	}
}



