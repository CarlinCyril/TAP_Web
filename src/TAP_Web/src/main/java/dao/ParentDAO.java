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
import java.util.ArrayList;
import javax.sql.DataSource;
import model.InfoParent;
import model.User;

/**
 *
 * @author cyrilcarlin
 */
public class ParentDAO extends AbstractDataBaseDAO {

    public ParentDAO(DataSource ds) {
        super(ds);
    }
    
    public ArrayList<InfoParent> getParentsUser(User user) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean valid = false;
        ArrayList<InfoParent> listParents = new ArrayList<InfoParent>();
        try {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(
                        "SELECT * FROM InfoParent WHERE Login = ?");
                statement.setString(1, user.getUsername());
                resultSet = statement.executeQuery();
                while(resultSet.next()) {
                    InfoParent parent;
                    parent = new InfoParent(resultSet.getNString(1), 
                            user, resultSet.getNString(3),
                            resultSet.getNString(4),
                            resultSet.getNString(5),
                            resultSet.getNString(6));
                    listParents.add(parent);
                }
        } catch(SQLException se){
                throw new DAOException("Erreur BD " + se.getMessage(), se);
        } finally {
                try { resultSet.close(); } catch(Exception e){ /* ignored */}
                try { statement.close(); } catch(Exception e){ /* ignored */}
                try { connection.close(); } catch(Exception e){ /* ignored */}
        }
        return listParents;
    }
    
    public void addParent(InfoParent parent) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean valid = false;
        
        try {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(
                        "INSERT INTO InfoParent (ID_Parent, Login, Name, Firstname, Telephone, Address)"
                                + "VALUES (?,?,?,?,?,?)");
                statement.setString(1, parent.getIdParents());
                statement.setString(2, parent.getUser().getUsername());
                statement.setString(3, parent.getName());
                statement.setString(4, parent.getFirstname());
                statement.setString(5, parent.getPhoneNumber());
                statement.setString(6, parent.getAddress());
                resultSet = statement.executeQuery();
        } catch(SQLException se){
                throw new DAOException("Erreur BD " + se.getMessage(), se);
        } finally {
                try { resultSet.close(); } catch(Exception e){ /* ignored */}
                try { statement.close(); } catch(Exception e){ /* ignored */}
                try { connection.close(); } catch(Exception e){ /* ignored */}
        }
    }
    
    public void editParent(InfoParent parent) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean valid = false;
        
        try {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(
                        "UPDATE InfoParent SET Name=?, "
                                + "Firstname=?,"
                                + " Telephone=?,"
                                + " Address=?"
                                + "WHERE ID_Parent=? AND Login=?");
                statement.setString(1, parent.getName());
                statement.setString(2, parent.getFirstname());
                statement.setString(3, parent.getPhoneNumber());
                statement.setString(4, parent.getAddress());
                statement.setString(5, parent.getIdParents());
                statement.setString(6, parent.getUser().getUsername());
                resultSet = statement.executeQuery();
        } catch(SQLException se){
                throw new DAOException("Erreur BD " + se.getMessage(), se);
        } finally {
                try { resultSet.close(); } catch(Exception e){ /* ignored */}
                try { statement.close(); } catch(Exception e){ /* ignored */}
                try { connection.close(); } catch(Exception e){ /* ignored */}
        }
    }
}
