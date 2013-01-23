package swim.sessionbeans;

import javax.ejb.Remote;

@Remote
public interface LingueBeanRemote {
	public void insertNewLanguage(long user_ID,String lingua);
}
