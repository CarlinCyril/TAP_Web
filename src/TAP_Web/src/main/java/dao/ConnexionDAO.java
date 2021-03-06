/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;
import model.User;

/**
 *
 * @author cyrilcarlin
 */
public class ConnexionDAO extends AbstractDataBaseDAO {

    public ConnexionDAO(DataSource ds) {
        super(ds);
    }

    public User login(String username, String password) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean valid = false;
        
        try {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(
                        "SELECT login FROM Users WHERE login=? AND password=?");
                statement.setString(1, username);
                statement.setString(2, password);
                resultSet = statement.executeQuery();
                valid = resultSet.next();
        } catch(SQLException se){
                throw new DAOException("Erreur BD " + se.getMessage(), se);
        } finally {
                try { resultSet.close(); } catch(Exception e){ /* ignored */}
                try { statement.close(); } catch(Exception e){ /* ignored */}
                try { connection.close(); } catch(Exception e){ /* ignored */}
                return valid ? new User(username) : null;
        }
    }
    
}
