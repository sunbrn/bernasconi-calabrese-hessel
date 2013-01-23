package swim.sessionbeans;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import swim.entitybeans.Lingue;

/**
 * Session Bean implementation class LingueBean
 */
@Stateless
public class LingueBean implements LingueBeanRemote {
	
	@PersistenceContext(unitName="swim_project") private EntityManager manager;
	
    /**
     * Default constructor. 
     */
    public LingueBean() {
        // TODO Auto-generated constructor stub
    }
    
    public void insertNewLanguage(long user_ID,String lingua){
    	
    		Lingue lingue=new Lingue();
    		lingue.set_known_language(user_ID,lingua);
    		
    		manager.persist(lingue);
    		return;
    }

	public void removeLanguage(long id, String lingua){
		Query q=manager.createQuery("FROM Lingue l WHERE l.user_ID:=to_delete_ID AND l.lingua=:to_delete_lingua");
		q.setParameter("to_delete_ID",id);
		q.setParameter("to_delete_lingua",lingua);
		Lingue l=(Lingue)q.getSingleResult();
		manager.remove(l);
	}
   
	public ArrayList<String> getLingueParlate(long user_ID){
    	try{
	    	Query q=manager.createQuery("SELECT lingua FROM Lingue l WHERE l.user_ID=:new_user_ID");
	    	q.setParameter("new_user_ID",user_ID);
	    	
	    	ArrayList<String> lingue=(ArrayList<String>)q.getResultList();
	    	return lingue;
    	}catch(NullPointerException e){
    		ArrayList<String> lingue=new ArrayList<String>();
        	return lingue;
    	}
    }

}


    
    
  