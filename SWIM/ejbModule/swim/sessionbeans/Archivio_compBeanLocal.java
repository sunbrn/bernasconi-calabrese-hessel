package swim.sessionbeans;

import javax.ejb.Local;

@Local
public interface Archivio_compBeanLocal {
	public  String getCodiceCompetenza(String competenza);
	public  String getNomeCompetenza (String codice_comp);

}
