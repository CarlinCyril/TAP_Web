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
import model.Child;
import model.Group;
import model.GroupChoices;
import model.Nursery;
import model.NurseryChoices;
import model.ReservationChild;

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

    public void getBookingsChildren(ArrayList<Child> children) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = dataSource.getConnection();
            for(Child child : children) {
                Booking newBooking = null;
                ArrayList<GroupChoices> groups = new ArrayList<GroupChoices>();
                ArrayList<NurseryChoices> nurseries = new ArrayList<NurseryChoices>();
                statement = connection.prepareStatement("SELECT * FROM Booking "
                        + "WHERE id_child=? AND login=?");
                statement.setString(1, child.getIdChild());
                statement.setString(2, child.getLogin());
                resultSet = statement.executeQuery();
                while(resultSet.next()) {
                    newBooking = new Booking(resultSet.getNString(1),
                            resultSet.getInt(2), 
                            resultSet.getNString(3),
                            resultSet.getNString(4),
                            resultSet.getNString(5));
                }
                
                if(newBooking != null) {
                    statement = connection.prepareStatement(
                            "select * from groupchoices" +
    "    inner join nurserychoices on groupchoices.ID_BOOKING = nurserychoices.ID_BOOKING" +
    "    where groupchoices.ID_BOOKING=?");
                    statement.setString(1, newBooking.getIdBooking());
                    resultSet = statement.executeQuery();
                    while(resultSet.next()) {
                        GroupChoices newGroup = new GroupChoices(resultSet.getNString(1),
                                resultSet.getString(2), 
                                resultSet.getNString(3));
                        NurseryChoices newNursery = new NurseryChoices(resultSet.getNString(4),
                                resultSet.getNString(5));
                        groups.add(newGroup);
                        nurseries.add(newNursery);
                    }
                    ReservationChild newReservation = new ReservationChild(newBooking, groups, nurseries);
                    child.setBooking(newReservation);
                }
            }
                
        } catch(SQLException se){
                System.out.println(se.getMessage());
        } finally {
                try { resultSet.close(); } catch(Exception e){ /* ignored */}
                try { statement.close(); } catch(Exception e){ /* ignored */}
                try { connection.close(); } catch(Exception e){ /* ignored */}
        }
    }
    
    public ArrayList<GroupChoices> getGroupsChildren(ArrayList<Booking> bookings) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean valid = false;
        ArrayList<GroupChoices> groups = new ArrayList<GroupChoices>();
        try {
            connection = dataSource.getConnection();
            for(Booking booking : bookings) {
                statement = connection.prepareStatement(
                        "SELECT * FROM GroupChoices WHERE ID_Booking=?");
                statement.setString(1, booking.getIdBooking());
                resultSet = statement.executeQuery();
                while(resultSet.next()) {
                    GroupChoices newGroup = new GroupChoices(resultSet.getNString(1),
                            resultSet.getString(2), 
                            resultSet.getNString(3));
                    groups.add(newGroup);
                }
            }
                
        } catch(SQLException se){
                System.out.println(se.getMessage());
        } finally {
                try { resultSet.close(); } catch(Exception e){ /* ignored */}
                try { statement.close(); } catch(Exception e){ /* ignored */}
                try { connection.close(); } catch(Exception e){ /* ignored */}
                return null;
        }
    }
}
