package swim.sessionbeans;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import swim.entitybeans.Imprese;

/**
 * Session Bean implementation class ImpresaBean
 */
@Stateless
public class ImpreseBean implements ImpreseBeanRemote {

	@PersistenceContext(unitName="swim_project") private EntityManager manager;
	
	/**
     * Default constructor. 
     */
    public ImpreseBean() {
        // TODO Auto-generated constructor stub
    }
	
    public void insertNewCompany(long id, String impr, String per){
    		  		
    		Imprese imprese=new Imprese();
    		imprese.set_passed_employer(id,impr,per);
    		
    		manager.persist(imprese);
    		return;
   	}
        
    public void removeCompany(long id, String impr, String per){
    	
    	Query q=manager.createQuery("FROM Imprese i WHERE i.user_ID=:to_delete_ID AND i.impresa=:to_delete_impresa AND i.periodo=:to_delete_periodo");
    	q.setParameter("to_delete_ID", id);
    	q.setParameter("to_delete_impresa", impr);
    	q.setParameter("to_delete_periodo", per);
    	Imprese i=(Imprese)q.getSingleResult();
		manager.remove(i);
	}
       
    
    
    public List<String> getCompanies(long user_ID){
    	
    	Query q=manager.createQuery("SELECT impresa FROM Imprese i WHERE i.user_ID=:new_user_ID");
    	q.setParameter("new_user_ID",user_ID);
    	
    	List<String> imprese=(List<String>)q.getResultList();
    	return imprese;    	
    }
   
}
