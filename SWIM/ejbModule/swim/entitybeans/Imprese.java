package swim.entitybeans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.IdClass;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Imprese")
@IdClass(ImpresePK.class)
public class Imprese implements java.io.Serializable{

	/**
	 * richiesto da java.io.serializable
	 */
	private static final long serialVersionUID = 808329796475506162L;

	
	/**
	 * dati
	 */
	@Column(name="user_ID")
	@Id private long user_ID;
	@Column(name="impresa")
	@Id private String impresa;
	@Column(name="periodo")
	private String periodo;
	
	/**
	 * metodi get/set
	 */
	public void set_passed_employer(long id, String impr, String per){
		this.setUser_ID(id);
		this.setImpresa(impr);
		this.setPeriodo(per);
	}


	public long getUser_ID() {
		return user_ID;
	}


	public void setUser_ID(long user_ID) {
		this.user_ID = user_ID;
	}


	public String getImpresa() {
		return impresa;
	}


	public void setImpresa(String impresa) {
		this.impresa = impresa;
	}


	public String getPeriodo() {
		return periodo;
	}


	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}

	
}




