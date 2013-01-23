package swim.sessionbeans;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import swim.entitybeans.Valutazioni;

/**
 * Session Bean implementation class ValutazioniBean
 */
@Stateless
public class ValutazioniBean implements ValutazioniBeanRemote {

	@PersistenceContext(unitName="swim_project") private EntityManager manager;
    /**
     * Default constructor. 
     */
    public ValutazioniBean() {
        // TODO Auto-generated constructor stub
    }
    
    public void insertNewFeedback(long helpID,long userID, String comm, int prof, int disp, int prezzo){
    	Valutazioni valutazioni=new Valutazioni();
    	
    	valutazioni.setHelp_ID(helpID);
    	valutazioni.setUser_ID(userID);
    	valutazioni.setData();
    	valutazioni.setCommento(comm);
    	valutazioni.setProfessionalità(prof);
    	valutazioni.setDisponibilità(disp);
    	valutazioni.setPrezzo_prestazioni(prezzo);
		
		manager.persist(valutazioni);
		return;
	}
    
  /*  public Integer[] getMedieVoti(long user_ID){
    	Query q=manager.createNativeQuery("SELECT avg(v.professionalità), avg(v.disponibilità), avg(v.prezzo_prestazioni) FROM Valutazioni WHERE v.user_ID=:new_userID");
    	q.setParameter("new_userID", user_ID);
    	List <Integer> v=q.getResultList();
    	Integer[] myArray=(Integer[]) v.toArray();
    	  	
    	return myArray;
    }*/
    
    public int getProfessionalità(long user_ID){
    	try{
	    	Query q=manager.createNativeQuery("SELECT avg(v.professionalità) FROM Valutazioni v WHERE v.user_ID=:new_userID");
	    	q.setParameter("new_userID", user_ID);
    		BigDecimal p=(BigDecimal) q.getSingleResult();
    		return getValutazioneIntera(p);
    	} catch(NullPointerException e) {
       		return 0;
       	}
 
    }

    public int getDisponibilità(long user_ID){
    	try{
	    	Query q=manager.createNativeQuery("SELECT avg(v.disponibilità) FROM Valutazioni v WHERE v.user_ID=:new_userID");
	    	q.setParameter("new_userID", user_ID);
    		BigDecimal d=(BigDecimal) q.getSingleResult();
    		return getValutazioneIntera(d);
    	} catch(NullPointerException e) {
       		return 0;
       	}
       	
    }
    
    public int getPrezzoPrestazione(long user_ID){
    	try{
	       	Query q=manager.createNativeQuery("SELECT avg(v.prezzo_prestazioni) FROM Valutazioni v WHERE v.user_ID=:new_userID");
	       	q.setParameter("new_userID", user_ID);
    		BigDecimal r=(BigDecimal) q.getSingleResult();
       		return getValutazioneIntera(r);
       	} catch(NullPointerException e) {
       		return 0;
       	}
    }

       	
    private int getValutazioneIntera(BigDecimal d){
    	float p=d.floatValue();
    	if (p>=0 && p<0.5){ 
    		p=0;
    	}else if (p>=0.5 && p<1.5){ 
    		p=1;
    	}else if (p>=1.5 && p<2.5){ 
    		p=2;
    	}else if (p>=2.5 && p<3.5){ 
    		p=3;
    	}else if (p>=3.5 && p<4.5){ 
    		p=4;
    	}else{ 
    		p=5;
    	}
		return (int)p;
    }
    
    public ArrayList<String> getCommenti(long user_ID){
    	try{
	    	Query q=manager.createQuery("SELECT v.commento FROM Valutazioni v WHERE v.user_ID=:new_userID ORDER BY v.help_ID");    						
	    	q.setParameter("new_userID", user_ID);
			ArrayList<String> c=(ArrayList<String>)q.getResultList();
	    	return c;
    	}catch(NullPointerException e){
    		ArrayList<String> c=new ArrayList<String>();
    		return c;
    	}
    }
}