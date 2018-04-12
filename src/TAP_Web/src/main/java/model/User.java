package model;

import java.sql.Date;

/**
 *
 * @author cyrilcarlin
 */
public class User {
    private String username;
    private Date lastConnexion = new Date(0);

    public User(String username, Date lastConnexion) {
        this.username = username;
        this.lastConnexion = lastConnexion;
    }

    public Date getLastConnexion() {
        return lastConnexion;
    }

    public void setLastConnexion(Date lastConnexion) {
        this.lastConnexion = lastConnexion;
    }

    public User(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String toJSON() {
		return "{ \"username\": \"" + this.username + "\"}";
    }
    
}
