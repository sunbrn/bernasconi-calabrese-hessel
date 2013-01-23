package swim.entitybeans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.IdClass;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="Lingue")
@IdClass(LinguePK.class)
public class Lingue implements java.io.Serializable {

	/**
	 * richiesto da java.io.serializable
	 */
	private static final long serialVersionUID = 2606647194152849919L;

	
	/**
	 * dati
	 */	
	@Column(name="user_ID")
	@Id private long user_ID;
	@Column(name="lingua")
	@Id private String lingua;
	
	
	
	/**
	 * metodi get/set
	 */	
	



	public long getUser_ID() {
		return user_ID;
	}



	public void setUser_ID(long user_ID) {
		this.user_ID = user_ID;
	}



	public String getLingua() {
		return lingua;
	}
	
	public void setLingua(String lingua) {
		this.lingua = lingua;
	}

	public void set_known_language(long id, String ling){
        this.setUser_ID(id);
        this.setLingua(ling);
	}
	
}
