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
import model.Child;

/**
 *
 * @author cyrilcarlin
 */
public class ChildDAO extends AbstractDataBaseDAO {

    public ChildDAO(DataSource ds) {
        super(ds);
    }
    
    public Integer getChildrenID() {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Integer result = 0;
        try {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(
                        "SELECT COUNT(*) FROM Child");
                resultSet = statement.executeQuery();
                while(resultSet.next()) {
                    result = resultSet.getInt(1);
                }
        } catch(SQLException se){
                System.out.println(se.getMessage());
        } finally {
                try { resultSet.close(); } catch(Exception e){ /* ignored */}
                try { statement.close(); } catch(Exception e){ /* ignored */}
                try { connection.close(); } catch(Exception e){ /* ignored */}
        }
        return result;
    }
    
    public ArrayList<Child> getChildrenUser(String username) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean valid = false;
        ArrayList<Child> listChildren = new ArrayList<Child>();
        try {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(
                        "SELECT * FROM Child WHERE Login = ?");
                statement.setString(1, username);
                resultSet = statement.executeQuery();
                while(resultSet.next()) {
                    Child child;
                    child = new Child(resultSet.getNString(1), 
                            username, resultSet.getNString(3),
                            resultSet.getNString(4),
                            resultSet.getDate("Birthdate"),
                            resultSet.getNString(6),
                            resultSet.getNString(7),
                            resultSet.getNString(8));
                    listChildren.add(child);
                }
        } catch(SQLException se){
                System.out.println(se.getMessage());
        } finally {
                try { resultSet.close(); } catch(Exception e){ /* ignored */}
                try { statement.close(); } catch(Exception e){ /* ignored */}
                try { connection.close(); } catch(Exception e){ /* ignored */}
                return listChildren;
        }
    }
    
    public void addChild(Child child) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean valid = false;
        
        try {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(
                        "INSERT INTO Child "
                                + "VALUES (?,?,?,?,?,?,?,?)");
                statement.setString(1, child.getIdChild());
                statement.setString(2, child.getLogin());
                statement.setString(3, child.getName());
                statement.setString(4, child.getFirstName());
                statement.setDate(5, child.getBirthdate());
                statement.setString(6, child.getGender());
                statement.setString(7, child.getDiet());
                statement.setString(8, child.getLevel());
                resultSet = statement.executeQuery();
        } catch(SQLException se){
                System.out.println(se.getMessage());
        } finally {
                try { resultSet.close(); } catch(Exception e){ /* ignored */}
                try { statement.close(); } catch(Exception e){ /* ignored */}
                try { connection.close(); } catch(Exception e){ /* ignored */}
        }
    }
    
    public void editChild(Child child) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean valid = false;
        
        try {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(
                        "UPDATE Child SET Name=?, "
                                + "Firstname=?,"
                                + " Birthdate=?,"
                                + " Gender=?,"
                                + " Diet=?,"
                                + " ClassLevel=?"
                                + "WHERE ID_Child=? AND Login=?");
                statement.setString(1, child.getName());
                statement.setString(2, child.getFirstName());
                statement.setDate(3, child.getBirthdate());
                statement.setString(4, child.getGender());
                statement.setString(5, child.getDiet());
                statement.setString(6, child.getLevel());
                statement.setString(7, child.getIdChild());
                statement.setString(8, child.getLogin());
                resultSet = statement.executeQuery();
        } catch(SQLException se){
                System.out.println(se.getMessage());
        } finally {
                try { resultSet.close(); } catch(Exception e){ /* ignored */}
                try { statement.close(); } catch(Exception e){ /* ignored */}
                try { connection.close(); } catch(Exception e){ /* ignored */}
        }
    }
    
}
