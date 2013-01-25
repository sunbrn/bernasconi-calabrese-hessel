package swim.sessionbeans;

import java.util.ArrayList;

import javax.ejb.Remote;

import swim.entitybeans.Archivio_comp;
import swim.entitybeans.Comp_dichiarate;

@Remote
public interface Comp_dichiarateBeanRemote {
	public ArrayList<String> getCompetenzeDichiarate(long user_ID);
    public int insertNewComp(long user_ID,String codice_comp);
    public void rimuoviCompetenza(long user_ID,String codice_comp);
}
