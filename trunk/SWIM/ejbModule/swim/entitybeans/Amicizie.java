package swim.entitybeans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;


@Entity
@Table(name="Amicizie")
@IdClass(AmiciziePK.class)
public class Amicizie implements java.io.Serializable{

	/**
	 * richiesto da java.io.serializable
	 */
	private static final long serialVersionUID = 1120086493572472952L;
	
	
	/**
	 * dati
	 */
	@Column(name="user_ID1")
	@Id private long user_ID1;
	@Column(name="user_ID2")
	@Id private long user_ID2;
	@Column(name="stato")
	private int stato;
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
	/**
	 * @return the stato
	 */
	public int getStato() {
		return stato;
	}
	/**
	 * @param stato the stato to set
	 */
	public void setStato(int stato) {
		this.stato = stato;
	}
	
		
}
