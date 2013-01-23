package swim.sessionbeans;

import java.util.ArrayList;

import javax.ejb.Remote;

import swim.entitybeans.Archivio_comp;

@Remote
public interface Archivio_compBeanRemote {
	public boolean insertCompetenza(String newCodice,String newCompetenza);
	public  String getCodiceCompetenza(String competenza);
	public ArrayList<String> getTutteCompetenze();
	public String getNomeCompetenza (String codice_comp);
	public ArrayList<Archivio_comp> getCodiciECompetenze();
}
