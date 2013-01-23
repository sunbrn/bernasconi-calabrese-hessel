package swim.entitybeans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="Archivio_comp")
public class Archivio_comp implements java.io.Serializable{
	
	/**
	 * richiesto da java.io.serializable 
	 */
	private static final long serialVersionUID = -1523801919848193416L;
	
	/**
	 * dati 
	 */	
	@Id
	@Column(name="codice_comp")
	private String codice_comp;
	@Column(name="nome")
	private String nomeCompetenza;
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
	 * @return the nome
	 */
	public String getNome() {
		return nomeCompetenza;
	}
	/**
	 * @param nome the nome to set
	 */
	public void setNome(String nome) {
		this.nomeCompetenza = nome;
	}
	
}
