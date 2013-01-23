package swim.sessionbeans;

import java.util.ArrayList;

import javax.ejb.Remote;

import swim.entitybeans.Richieste_agg_comp;

@Remote
public interface Richieste_agg_compBeanRemote {
	public void insertNewRequest(long user_ID,String testo_richiesta);
    public void rejectRequest(long richiesta_ID);
    public void acceptRequest(long richiesta_ID);
	public ArrayList<Richieste_agg_comp> getTutteRichiesteAggiuntaCompetenze();
	public void removeRequest(long userID);
	public ArrayList<Richieste_agg_comp> getMieRichieste(long userID);
}
