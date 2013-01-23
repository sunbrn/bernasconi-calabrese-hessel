package swim.sessionbeans;

import java.util.ArrayList;
import java.util.List;


import javax.ejb.Remote;


import swim.entitybeans.Amicizie;
import swim.entitybeans.User;


@Remote
public interface AmicizieBeanRemote {
	public void richiediAmicizia(long id1,long id2);
	public void accettaAmicizia(long id1,long id2);
	public void rifiutaAmicizia(long id1, long id2);
	
	public boolean verificaAmicizia(long user_id1, long user_id2);
	public boolean verificaRichiesta(long user_id1, long user_id2);
	public ArrayList<User> getAmici(long id);
	public ArrayList<User> getRichiesteAmicizie(long id);
	public ArrayList<User> getAmicizieConsigliate(long id);

}
