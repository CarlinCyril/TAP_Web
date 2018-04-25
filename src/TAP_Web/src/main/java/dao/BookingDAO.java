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
import java.sql.Statement;
import java.util.ArrayList;
import javax.sql.DataSource;
import model.Booking;
import model.GroupChoices;
import model.Nursery;
import model.NurseryChoices;

/**
 *
 * @author carlinc
 */
public class BookingDAO extends AbstractDataBaseDAO {

    public BookingDAO(DataSource ds) {
        super(ds);
    }
    
    public void editBooking(Booking booking, ArrayList<GroupChoices> groupChoices, 
            ArrayList<String> nurseryChoices) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        try {
            String ID = null;
            connection = dataSource.getConnection();
            statement = connection.prepareStatement("SELECT COUNT(*) FROM Booking");
            ResultSet resultLevel = statement.executeQuery();
            while(resultLevel.next())
                ID = Integer.toString(resultLevel.getInt(1)+1);
            statement = connection.prepareStatement("INSERT INTO Booking VALUES (?,?,?,?,?)");
            statement.setString(1, ID);
            statement.setInt(2, booking.getCafeteriaDays());
            statement.setString(3, booking.getIdChild());
            statement.setString(4,booking.getLogin());
            statement.setString(5, booking.getDiet());
            resultSet = statement.executeQuery();
            
            for(GroupChoices groupChoice : groupChoices) {
                statement = connection.prepareStatement("INSERT INTO GroupChoices VALUES (?,?,?)");
                statement.setString(1, ID);
                statement.setString(2, groupChoice.getIdActivity());
                statement.setString(3, groupChoice.getIdGroup());
                resultSet = statement.executeQuery();
            }
            
            for(String nurseryChoice : nurseryChoices) {
                statement = connection.prepareStatement("INSERT INTO NurseryChoices VALUES (?,?)");
                statement.setString(1, ID);
                statement.setString(2, nurseryChoice);
                resultSet = statement.executeQuery();
            }
            
        } catch(SQLException se){
                System.out.println(se.getMessage());
        } finally {
                try { resultSet.close(); } catch(Exception e){ /* ignored */}
                try { statement.close(); } catch(Exception e){ /* ignored */}
                try { connection.close(); } catch(Exception e){ /* ignored */}
        }
    }
}
