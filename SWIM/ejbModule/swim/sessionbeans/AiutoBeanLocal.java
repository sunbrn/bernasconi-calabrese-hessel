package swim.sessionbeans;

import javax.ejb.Local;

@Local
public interface AiutoBeanLocal {
	public void eliminaTuttiAiuti(long id);
}
