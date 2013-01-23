package swim.sessionbeans;

import java.util.List;

import java.util.ArrayList;

import javax.ejb.Remote;

import swim.entitybeans.User;

@Remote
public interface UserBeanRemote {
	/**
	 * @param nome
	 * @param cognome
	 * @param sesso
	 * @param mail
	 * @param nickname
	 * @param password
	 * @param data_nascita
	 * @param città
	 * @param diploma
	 * @param laurea
	 * @param altro
	 * @return user id se non c'è già un utente con stessa password e nickname -1 altrimenti
	 */
	public long insertNewUser(String nome, String cognome, String sesso, String mail, String nickname, String password, int data_nascita, String città, String diploma, String laurea, String altro);
   
	public void updateUser(long user_ID,String nome, String cognome,String sesso, String mail, String nickname, String password, int data_nascita, String città, String diploma, String laurea, String altro);
	
	public void deleteUser (long id);
	
	/**
     * @param nickname
     * @param password
     * @return verifica che ci sia un utente con nick e password e restituisce il suo id  -1 altrimenti
     */
	public long verificaCredenziali(String nickname,String password);
	/**
	 * 
	 * @param id
	 * @return utente con tale id
	 */
	public User getUser(long id);
	public ArrayList<User> cercaPerNome(String new_nome, String new_cognome);
	public ArrayList<User> cercaPerCompetenza(String new_competenza);
    public ArrayList<String> getNomiCompetenzeUtente(long id);
}
