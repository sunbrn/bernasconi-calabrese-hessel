package swim.sessionbeans;

import javax.ejb.Remote;

@Remote
public interface ImpreseBeanRemote {
	
	public void insertNewCompany(long id, String impr, String per);
	public void removeCompany(long id, String impr, String per);

}
