package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.*;

import javax.sql.DataSource;

public class EditActivity extends AbstractDataBaseDAO{
    public EditActivity(DataSource ds){
    	 super(ds);
    }
    public void setCost(String id, int price) {
    	Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
        	connection = dataSource.getConnection();
            statement = connection.prepareStatement(
            		"UPDATE Activity SET Price = '?' WHERE ID_Activity = '?'");
            statement.setInt(1, price);
            statement.setString(2, id);
            resultSet = statement.executeQuery();
        } catch(SQLException se){
            System.out.println(se.getMessage());
        }
    }
    
    public void addAct(String name, int cost) {
        Integer id = 0;
    	Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
        	Connection co = dataSource.getConnection();
        	statement = co.prepareStatement("SELECT MAX(ID_Activity) FROM Activity");
        	resultSet = statement.executeQuery();
        	while(resultSet.next()) {
        		id = Integer.parseInt(resultSet.getString("ID_Activivty")) + 1;
        	}
        	}catch(SQLException se){
        		System.out.println(se.getMessage());
        }
        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement(
                    "INSERT INTO Activity VALUEs(?, ?, ?)");
            statement.setString(1, id.toString());
            statement.setString(2, name);
            statement.setInt(3, cost);
            resultSet = statement.executeQuery();
    } catch(SQLException se){
            System.out.println(se.getMessage());
    	}finally {
            try { resultSet.close(); } catch(Exception e){ /* ignored */}
            try { statement.close(); } catch(Exception e){ /* ignored */}
            try { connection.close(); } catch(Exception e){ /* ignored */}
    	}
    }
    public void delAct(String id) {
    	Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
	    try {
	    	connection = dataSource.getConnection();
            statement = connection.prepareStatement(
                    "DELETE FROM Activivty WHERE 'ID_Activity' = ?");
            statement.setString(1, id);
            resultSet = statement.executeQuery();
	    } catch(SQLException se){
            System.out.println(se.getMessage());
	    }
    }

}
