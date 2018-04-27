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
import model.Diet;

/**
 *
 * @author cyrilcarlin
 */
public class DietDAO extends AbstractDataBaseDAO {

    public DietDAO(DataSource ds) {
        super(ds);
    }
    
    public ArrayList<Diet> getAll() {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean valid = false;
        ArrayList<Diet> listDiets = new ArrayList<Diet>();
        
        try {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(
                        "SELECT * FROM Diet");
                resultSet = statement.executeQuery();
                while(resultSet.next()) {
                    Diet newDiet = new Diet(resultSet.getNString(1), 
                            resultSet.getString(2));
                    listDiets.add(newDiet);
                }
        } catch(SQLException se){
                throw new DAOException("Erreur BD " + se.getMessage(), se);
        } finally {
                try { resultSet.close(); } catch(Exception e){ /* ignored */}
                try { statement.close(); } catch(Exception e){ /* ignored */}
                try { connection.close(); } catch(Exception e){ /* ignored */}
                return listDiets;
        }
    }
}
