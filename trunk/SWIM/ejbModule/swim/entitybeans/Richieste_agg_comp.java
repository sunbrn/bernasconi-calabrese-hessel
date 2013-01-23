package swim.entitybeans;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="Richieste_agg_comp")
public class Richieste_agg_comp implements java.io.Serializable {


	/**
	 * richiesto da java.io.serializable
	 */
	private static final long serialVersionUID = 1503656911262448854L;

	
	/**
	 * dati
	 */		
	@Id
	@GeneratedValue
	@Column(name="richiesta_ID")
	private long richiesta_ID;
	@Column(name="data")
	private Date data;
	@Column(name="user_ID")
	private long user_ID;
	@Column(name="testo_richiesta")
	private String testo_richiesta;
	@Column(name="stato")
	private String stato;
	
	
	public long getRichiesta_ID() {
		return richiesta_ID;
	}


	public Date getData() {
		return data;
	}


	public void setData() {
		Date dataDiOggi=new Date();
		this.data=dataDiOggi;
	}
	

	public String getTesto_richiesta() {
		return testo_richiesta;
	}


	public void setTesto_richiesta(String testo_richiesta) {
		this.testo_richiesta = testo_richiesta;
	}


	/**
	 * @return the user_ID
	 */
	public long getUser_ID() {
		return user_ID;
	}


	/**
	 * @param user_ID the user_ID to set
	 */
	public void setUser_ID(long user_ID) {
		this.user_ID = user_ID;
	}


	/**
	 * @return the stato
	 */
	public String getStato() {
		return stato;
	}


	/**
	 * @param stato the stato to set
	 */
	public void setStato(String stato) {
		this.stato = stato;
	}
	
}
