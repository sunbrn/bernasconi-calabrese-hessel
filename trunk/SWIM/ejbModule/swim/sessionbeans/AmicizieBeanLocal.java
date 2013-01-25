package swim.sessionbeans;

import javax.ejb.Local;

@Local
public interface AmicizieBeanLocal {
	public void eliminaTutteAmicizie(long id);
}
