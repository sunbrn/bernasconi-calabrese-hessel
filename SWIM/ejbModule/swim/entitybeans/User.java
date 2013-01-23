package swim.entitybeans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;



/**
 * Rappresenta un Utente del sistema SWIM: i suoi dati d'accesso e di profilo
 */

@Entity
@Table(name="User")

public class User implements java.io.Serializable{
	

	/**
	 * richiesto da java.io.serializable
	 */
	private static final long serialVersionUID = 3404084634115723020L;

	
	/**
	 * dati dell'utente
	 */
	@Id
	@GeneratedValue
	@Column(name="user_ID")
	private long user_ID;
	
	@Column(name="nome", nullable=false)
	private String nome;
	@Column(name="cognome", nullable=false)
	private String cognome;
	@Column(name="mail", nullable=false)
	private String mail;
	@Column(name="nickname", nullable=false)
	private String nickname;	
	@Column(name="password", nullable=false)
	private String password;
	@Column(name="data_nascita", nullable=false)
	private int data_nascita;
	@Column(name="sesso")
	private String sesso;
	@Column(name="città", nullable=false)
	private String città;
	@Column(name="diploma")
	private String diploma;
	@Column(name="laurea")
	private String laurea;
	@Column(name="altro")
	private String altro;
	
	/**
	 * FOTO????????????????????
	 */
	public String getNome() {
		return nome;
	}
	/**
	 * @param nome the nome to set
	 */
	public void setNome(String nome) {
		this.nome = nome;
	}
	/**
	 * @return the cognome
	 */
	public String getCognome() {
		return cognome;
	}
	/**
	 * @param cognome the cognome to set
	 */
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	/**
	 * @return the mail
	 */
	public String getMail() {
		return mail;
	}
	/**
	 * @param mail the mail to set
	 */
	public void setMail(String mail) {
		this.mail = mail;
	}
	/**
	 * @return the nickname
	 */
	public String getNickname() {
		return nickname;
	}
	/**
	 * @param nickname the nickname to set
	 */
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the data_nascita
	 */
	public int getData_nascita() {
		return data_nascita;
	}
	/**
	 * @param data_nascita the data_nascita to set
	 */
	public void setData_nascita(int data_nascita) {
		this.data_nascita = data_nascita;
	}
	/**
	 * @return the città
	 */
	public String getCittà() {
		return città;
	}
	/**
	 * @param città the città to set
	 */
	public void setCittà(String città) {
		this.città = città;
	}
	/**
	 * @return the diploma
	 */
	public String getDiploma() {
		return diploma;
	}
	/**
	 * @param diploma the diploma to set
	 */
	public void setDiploma(String diploma) {
		this.diploma = diploma;
	}
	/**
	 * @return the laurea
	 */
	public String getLaurea() {
		return laurea;
	}
	/**
	 * @param laurea the laurea to set
	 */
	public void setLaurea(String laurea) {
		this.laurea = laurea;
	}
	/**
	 * @return the altro
	 */
	public String getAltro() {
		return altro;
	}
	/**
	 * @param altro the altro to set
	 */
	public void setAltro(String altro) {
		this.altro = altro;
	}
	public String getSesso() {
		return sesso;
	}
	public void setSesso(String sesso) {
		this.sesso = sesso;
	}
	public long getUser_ID() {
		return user_ID;
	}
	
}
