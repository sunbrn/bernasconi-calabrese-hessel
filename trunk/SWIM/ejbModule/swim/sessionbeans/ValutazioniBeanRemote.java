package swim.sessionbeans;

import java.util.Collection;
import java.util.Date;

import javax.ejb.Remote;

import swim.entitybeans.Valutazioni;

@Remote
public interface ValutazioniBeanRemote {
	/**
	 * @param help_ID
	 * @param user_ID
	 * @param data
	 * @param commento
	 * @param professionalit�
	 * @param disponibilit�
	 * @param prezzo_prestazioni
	 */
	
	 public void insertNewFeedback(long helpID,long userID, String comm, int prof, int disp, int prezzo);
	    
	 public int getProfessionalit�(long user_ID);
	 public int getDisponibilit�(long user_ID);
	 public int getPrezzoPrestazione(long user_ID);
	    
	 public Collection<String> getCommenti(long user_ID);
	
	
}