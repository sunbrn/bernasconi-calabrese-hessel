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
@Table(name="Aiuto")
public class Aiuto implements java.io.Serializable {

	/**
	 * richiesto da java.io.serializable
	 */
	private static final long serialVersionUID = 5766272779089660929L;

	
	@Id
	@GeneratedValue
	@Column(name="help_ID")
	private long help_ID;
	@Column(name="codice_comp")
	private String codice_comp;
	@Column(name="richiedente")
	private long richiedente;
	@Column(name="offerente")
	private long offerente;
	@Column(name="data_inizio")
	private Date data_inizio;
	@Column(name="mexRich")
	private String mexRich;
	@Column(name="mexRisp")
	private String mexRisp;
	@Column(name="accettato")
	private boolean accettato;
	@Column(name="concluso")
	private boolean concluso;
	/**
	 * @return the help_ID
	 */
	public long getHelp_ID() {
		return help_ID;
	}
	/**
	 * @return the codice_comp
	 */
	public String getCodice_comp() {
		return codice_comp;
	}
	/**
	 * @param codice_comp the codice_comp to set
	 */
	public void setCodice_comp(String codice_comp) {
		this.codice_comp = codice_comp;
	}
	/**
	 * @return the richiedente
	 */
	public long getRichiedente() {
		return richiedente;
	}
	/**
	 * @param richiedente the richiedente to set
	 */
	public void setRichiedente(long richiedente) {
		this.richiedente = richiedente;
	}
	/**
	 * @return the offerente
	 */
	public long getOfferente() {
		return offerente;
	}
	/**
	 * @param offerente the offerente to set
	 */
	public void setOfferente(long offerente) {
		this.offerente = offerente;
	}
	/**
	 * @return the data_inizio
	 */
	public Date getData_inizio() {
		return data_inizio;
	}
	/**
	 * @param data_inizio the data_inizio to set
	 */
	public void setData_inizio() {
		Date dataDiOggi=new Date();
		this.data_inizio=dataDiOggi;
	}
	/**
	 * @return the mexRich
	 */
	public String getMexRich() {
		return mexRich;
	}
	/**
	 * @param mexRich the mexRich to set
	 */
	public void setMexRich(String mexRich) {
		this.mexRich = mexRich;
	}
	/**
	 * @return the mexRisp
	 */
	public String getMexRisp() {
		return mexRisp;
	}
	/**
	 * @param mexRisp the mexRisp to set
	 */
	public void setMexRisp(String mexRisp) {
		this.mexRisp = mexRisp;
	}
	/**
	 * @return the accettato
	 */
	public boolean isAccettato() {
		return accettato;
	}
	/**
	 * @param accettato the accettato to set
	 */
	public void setAccettato(boolean accettato) {
		this.accettato = accettato;
	}
	/**
	 * @return the concluso
	 */
	public boolean isConcluso() {
		return concluso;
	}
	/**
	 * @param concluso the concluso to set
	 */
	public void setConcluso(boolean concluso) {
		this.concluso = concluso;
	}

}
