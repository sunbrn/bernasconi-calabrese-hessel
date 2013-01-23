package swim.sessionbeans;

import javax.ejb.Local;

import swim.entitybeans.User;

@Local
public interface UserBeanLocal {
    public User getUser(long id);
}
