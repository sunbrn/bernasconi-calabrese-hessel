package swim.entitybeans;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;



@Entity
@Table(name="Comp_dichiarate")
@IdClass(Comp_dichiaratePK.class)
public class Comp_dichiarate implements java.io.Serializable{

	/**
	 * richiesto da java.io.serializable
	 */
	private static final long serialVersionUID = 1133426957097743810L;
	

	/**
	 * dati
	 */
	@Column(name="user_ID")
	@Id private long user_ID;
	@Column(name="codice_comp")
	@Id private String codice_comp;
	public long getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(long user_ID) {
		this.user_ID = user_ID;
	}
	public String getCodice_comp() {
		return codice_comp;
	}
	public void setCodice_comp(String codice_comp) {
		this.codice_comp = codice_comp;
	}
	
}
