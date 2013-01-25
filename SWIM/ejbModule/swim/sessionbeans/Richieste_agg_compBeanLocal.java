package swim.sessionbeans;

import javax.ejb.Local;

@Local
public interface Richieste_agg_compBeanLocal {
	public void eliminaTutteRichieste(long id);
}
