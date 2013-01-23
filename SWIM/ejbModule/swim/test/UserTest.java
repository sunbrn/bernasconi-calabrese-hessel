package swim.test;

import org.junit.Test;

import swim.sessionbeans.UserBeanRemote;

import junit.framework.Assert;

public class UserTest {
	private static UserBeanRemote u;
	
	@Test
	public void controllaScritturaUserDB(){
		u.insertNewUser("mario","rossi","M","mr@mail.it","mr","1234abcd",1990,"milano","no","no","no");
	
	}
	

}