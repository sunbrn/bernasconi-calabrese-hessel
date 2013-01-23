package swim.entitybeans;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import java.util.Date;


@Entity
@Table(name="Valutazioni")
public class Valutazioni implements java.io.Serializable {

	/**
	 * richiesto da java.io.serializable
	 */
	private static final long serialVersionUID = 4317961995560174620L;


	/**
	 * dati
	 */	
	@Id
	@Column(name="help_ID")
	private long help_ID;
	@Column(name="user_ID")
	private long user_ID;
	@Column(name="data")
	private Date data;
	@Column(name="commento")
	private String commento;
	@Column(name="professionalità")
	private int professionalità;
	@Column(name="disponibilità")
	private int disponibilità;
	@Column(name="prezzo_prestazioni")
	private int prezzo_prestazioni;
	
	
	public long getHelp_ID() {
		return help_ID;
	}
	
	public void setHelp_ID(long help_ID){
		this.help_ID=help_ID;
	}
	
	public long getUser_ID() {
		return user_ID;
	}

	public void setUser_ID(long new_user_ID){
		this.user_ID=new_user_ID;
	}
	
	Date getData() {
		return data;
	}
	public void setData() {
		Date dataDiOggi=new Date();
		this.data = dataDiOggi;
	}
	public String getCommento() {
		return commento;
	}
	public void setCommento(String commento) {
		this.commento = commento;
	}
	public int getProfessionalità() {
		return professionalità;
	}
	public void setProfessionalità(int professionalità) {
		this.professionalità = professionalità;
	}
	public int getDisponibilità() {
		return disponibilità;
	}
	public void setDisponibilità(int disponibilità) {
		this.disponibilità = disponibilità;
	}
	public int getPrezzo_prestazioni() {
		return prezzo_prestazioni;
	}
	public void setPrezzo_prestazioni(int prezzo_prestazioni) {
		this.prezzo_prestazioni = prezzo_prestazioni;
	}
	
	
}
