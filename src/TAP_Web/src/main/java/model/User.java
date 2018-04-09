package model;

/**
 *
 * @author cyrilcarlin
 */
public class User {
    private String username;

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
