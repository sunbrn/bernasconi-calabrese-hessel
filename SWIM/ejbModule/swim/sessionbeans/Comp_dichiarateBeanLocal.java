package swim.sessionbeans;

import java.util.ArrayList;
import javax.ejb.Local;

@Local
public interface Comp_dichiarateBeanLocal {
	public ArrayList<Long> getUtentiConCompetenza(String codice_comp);
	public ArrayList<String> getCompetenzeDichiarate(long user_ID);
	public void eliminaTutteCompetenze(long id);
}


