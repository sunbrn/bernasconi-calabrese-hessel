package swim.sessionbeans;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityNotFoundException;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import swim.entitybeans.Archivio_comp;
import swim.entitybeans.Comp_dichiarate;

/**
 * Session Bean implementation class Comp_dichiarateBean
 */
@Stateless
public class Comp_dichiarateBean implements Comp_dichiarateBeanRemote,Comp_dichiarateBeanLocal {
	@PersistenceContext(unitName="swim_project") private EntityManager manager;
    /**
     * Default constructor. 
     */
    public Comp_dichiarateBean() {
        // TODO Auto-generated constructor stub
    }
    
    public int insertNewComp(long user_ID,String codice_comp) {
    	if(verificaDatiNonPresenti(user_ID,codice_comp)){
    		Comp_dichiarate competenze=new Comp_dichiarate();    	
    	
    		competenze.setUser_ID(user_ID);
    		competenze.setCodice_comp(codice_comp);
    	
    		manager.persist(competenze);
    		
    		return 1;
    	}
    	return -1;
    }
        
    private boolean verificaDatiNonPresenti(long user_ID,String codice_comp){
    	
    	Query q=manager.createQuery("FROM Comp_dichiarate c WHERE c.user_ID=:new_user_ID AND c.codice_comp=:new_competenza");
    	q.setParameter("new_user_ID", user_ID);
    	q.setParameter("new_competenza", codice_comp);
    	ArrayList<Comp_dichiarate> competenze=new ArrayList<Comp_dichiarate>();
    	competenze=(ArrayList<Comp_dichiarate>) q.getResultList();
    	
    	if(competenze.size()==0){
    		return true;
    	}
    	return false;
    }
    
    public ArrayList<String> getCompetenzeDichiarate(long user_ID){
    	try{
	    	System.out.println("sono nel competenze dichiarate bean e ricevo in input:"+user_ID);
	    	Query q=manager.createQuery("SELECT codice_comp FROM Comp_dichiarate c WHERE c.user_ID=:new_user_ID");
	    	q.setParameter("new_user_ID",user_ID);  
	    	ArrayList<String> competenze=(ArrayList<String>) q.getResultList();
	   		return competenze; 
    	}catch(NullPointerException e){
    		ArrayList<String> competenze= new ArrayList<String>();
    		return competenze;
    	} 
    	

    }
    
    public ArrayList<Archivio_comp> getCompetenzeECodiciDichiarate(long user_ID){
    	try{	    	
	    	Query q=manager.createQuery("FROM Comp_dichiarate c WHERE c.user_ID=:new_user_ID");
	    	q.setParameter("new_user_ID",user_ID);  
	    	ArrayList<Archivio_comp> competenzeECodici=(ArrayList<Archivio_comp>) q.getResultList();
	   		return competenzeECodici; 
    	}catch(NullPointerException e){
    		ArrayList<Archivio_comp> competenzeECodici= new ArrayList<Archivio_comp>();
    		return competenzeECodici;
    	} 
    	

    }
    
    
    public ArrayList<Long> getUtentiConCompetenza(String codice_comp){
    	try{
	    	Query q=manager.createQuery("SELECT user_ID FROM Comp_dichiarate c WHERE c.codice_comp=:new_codice_comp");
	    	q.setParameter("new_codice_comp",codice_comp);
	    	ArrayList<Long> utenti=(ArrayList<Long>) q.getResultList();
	    	return utenti;
    	}catch(NullPointerException e){
    		ArrayList<Long> utenti= new ArrayList<Long>();
	    	return utenti;
    	}
    }
    
    public void rimuoviCompetenza(long user_ID,String codice_comp){
    	
    	try{
    	Query q=manager.createQuery("FROM Comp_dichiarate c WHERE (c.user_ID=:new_user_ID and c.codice_comp=:new_codice_comp)");
    	q.setParameter("new_user_ID",user_ID); 
    	q.setParameter("new_codice_comp",codice_comp); 
    	ArrayList<Comp_dichiarate> nuoveCompetenze=(ArrayList<Comp_dichiarate>) q.getResultList();
    	for(Comp_dichiarate r : nuoveCompetenze){
    	    		manager.remove(r);
    	    	}
    	}catch(NoResultException e){
    	}
    }
    
}    