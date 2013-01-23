package swim.entitybeans;

import java.io.Serializable;

public class AmiciziePK implements Serializable{

	/**
	 * richiesto da java.io.serializable
	 */
	private static final long serialVersionUID = 5300788207484308194L;

	

	/**
	 * dati
	 */
	private long user_ID1;
	private long user_ID2;
	/**
	 * @return the user_ID1
	 */
	public long getUser_ID1() {
		return user_ID1;
	}
	/**
	 * @param user_ID1 the user_ID1 to set
	 */
	public void setUser_ID1(long user_ID1) {
		this.user_ID1 = user_ID1;
	}
	/**
	 * @return the user_ID2
	 */
	public long getUser_ID2() {
		return user_ID2;
	}
	/**
	 * @param user_ID2 the user_ID2 to set
	 */
	public void setUser_ID2(long user_ID2) {
		this.user_ID2 = user_ID2;
	}
	
	
}
