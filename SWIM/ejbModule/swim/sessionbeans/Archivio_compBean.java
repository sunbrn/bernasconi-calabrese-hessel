package swim.sessionbeans;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import swim.entitybeans.Archivio_comp;

/**
 * Session Bean implementation class Archivio_compBean
 */
@Stateless
public class Archivio_compBean implements Archivio_compBeanRemote, Archivio_compBeanLocal {
	
	@PersistenceContext(unitName="swim_project") private EntityManager manager;
    /**
     * Default constructor. 
     */
    public Archivio_compBean() {
        // TODO Auto-generated constructor stub
    }
    
    public boolean insertCompetenza(String newCodice,String newCompetenza){
    	if(competenzaGi‡Inserita(newCodice, newCompetenza)){
    		return false;
    	} else{
    		Archivio_comp arc=new Archivio_comp();
    		arc.setCodice_comp(newCodice);
    		arc.setNome(newCompetenza);
    		manager.persist(arc);
    		return true;
    	}   	
    }
    
    private boolean competenzaGi‡Inserita(String newCodice,String newCompetenza){
    	try{
	    	Query q=manager.createQuery("FROM Archivio_comp arc WHERE arc.codice_comp=:newCodice OR arc.nomeCompetenza=:newCompetenza");
	    	q.setParameter("newCodice", newCodice);
	    	q.setParameter("newCompetenza", newCompetenza);
	    	ArrayList<Archivio_comp> arc=(ArrayList<Archivio_comp>) q.getResultList();
	    	if(arc.size()==0){
	    		return false;
	    	}else{
	    		return true;
	    	}
    	}catch(NullPointerException e){
    		return false;
    	}
    }

    public  String getCodiceCompetenza(String competenza){
    	try{
    	Query q=manager.createQuery("SELECT codice_comp FROM Archivio_comp arc WHERE arc.nomeCompetenza=:competenza");
    	q.setParameter("competenza", competenza);
    	String codiceCompetenza=(String) q.getSingleResult();
		return codiceCompetenza;
    	}catch(NoResultException e){
    		return null;
    	}
    }
    
    public String getNomeCompetenza (String codice_comp){
    	try{
    	Query q=manager.createQuery("SELECT nomeCompetenza FROM Archivio_comp arc WHERE arc.codice_comp=:codiceCercato");
    	q.setParameter("codiceCercato", codice_comp);
    	String nomeCompetenza=(String) q.getSingleResult();
		return nomeCompetenza;
    	}catch(NullPointerException e){
    		return null;
    	}
    }
    
    public ArrayList<String> getTutteCompetenze(){
    	try{
    	Query q=manager.createQuery("SELECT arc.nomeCompetenza FROM Archivio_comp arc");
    	ArrayList<String> tutteCompetenze=(ArrayList<String>)q.getResultList();
    	return tutteCompetenze;
    	}catch(NullPointerException e){
    		ArrayList<String> tutteCompetenze=new ArrayList<String>();
			return tutteCompetenze;
		}
    }
    
    public ArrayList<Archivio_comp> getCodiciECompetenze(){
    	try{
    		Query q=manager.createQuery("FROM Archivio_comp arc");
        	ArrayList<Archivio_comp> tuttiCodiciECompetenze=(ArrayList<Archivio_comp>)q.getResultList();
        	return tuttiCodiciECompetenze;
    	}catch(NullPointerException e){
    		ArrayList<Archivio_comp>  tuttiCodiciECompetenze=new ArrayList<Archivio_comp>();
			return  tuttiCodiciECompetenze;
    	}
    }
}
