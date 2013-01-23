package swim.entitybeans;

import java.io.Serializable;

public class ImpresePK implements Serializable{
	
	/**
	 * richiesto da java.io.serializable
	 */
	private static final long serialVersionUID = 3095297491860721631L;
	

	/**
	 * dati
	 */
	private long user_ID;
	private String impresa;
	private String periodo;

}