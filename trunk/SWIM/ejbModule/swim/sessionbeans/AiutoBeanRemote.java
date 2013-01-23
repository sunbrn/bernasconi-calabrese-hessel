package swim.sessionbeans;

import java.util.ArrayList;

import javax.ejb.Remote;
import swim.entitybeans.Aiuto;

@Remote
public interface AiutoBeanRemote {

	public long richiediAiuto(String comp,long rich,long off,String messRich);
	public Aiuto getAiuto(long id);
	public void rispostaAiuto(long help_ID,boolean risp,String mexRisp);
	public void concludiAiuto(long help_ID);
	public ArrayList<Aiuto> getAiuti(long userID);
	public ArrayList<Aiuto> getRichiesteAiuto(long userID);

}
