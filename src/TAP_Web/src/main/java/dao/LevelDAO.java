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
import model.ClassLevel;

/**
 *
 * @author cyrilcarlin
 */
public class LevelDAO extends AbstractDataBaseDAO {

    public LevelDAO(DataSource ds) {
        super(ds);
    }
    
    public ArrayList<ClassLevel> getAll() {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean valid = false;
        ArrayList<ClassLevel> listDiets = new ArrayList<ClassLevel>();
        
        try {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(
                        "SELECT * FROM ClassLevel");
                resultSet = statement.executeQuery();
                while(resultSet.next()) {
                    ClassLevel newDiet = new ClassLevel(resultSet.getNString(1));
                    listDiets.add(newDiet);
                }
        } catch(SQLException se){
                throw new DAOException("Erreur BD " + se.getMessage(), se);
        } finally {
                try { resultSet.close(); } catch(Exception e){ /* ignored */}
                try { statement.close(); } catch(Exception e){ /* ignored */}
                try { connection.close(); } catch(Exception e){ /* ignored */}
                
        }
        return listDiets;
    }
}
