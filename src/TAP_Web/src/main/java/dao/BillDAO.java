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
import model.Activity;
import model.Bill;
import model.Child;
import model.GroupChoices;
import model.Nursery;
import model.NurseryChoices;
import model.PeriodYear;
import model.ReservationChild;

/**
 *
 * @author cyrilcarlin
 */
public class BillDAO extends AbstractDataBaseDAO {

    public BillDAO(DataSource ds) {
        super(ds);
    }
    
    public void createBill(ReservationChild reservation, String username) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Integer totalPrice = 0;
        PeriodYear currentPeriod = null;
        String IDBill = null;
                
        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement(
            "SELECT SUM(Activity.Price) FROM Activity" +
            "    inner join GroupActivity on activity.ID_ACTIVITY = GroupActivity.ID_ACTIVITY" +
            "    inner join GROUPCHOICES on ACTIVITY.ID_ACTIVITY = GROUPCHOICES.ID_ACTIVITY" +
            "    where GROUPCHOICES.ID_Booking = ?");
            statement.setString(1, reservation.getBooking().getIdBooking());
            resultSet = statement.executeQuery();
            while(resultSet.next())
                totalPrice += resultSet.getInt(1);
            
            statement = connection.prepareStatement(
            "SELECT SUM(Nursery.Price) FROM Nursery "
                    + "INNER JOIN NurseryChoices on NurseryChoices.ID_Nursery = Nursery.ID_Nursery "
                    + "WHERE ID_Booking = ?");
            statement.setString(1, reservation.getBooking().getIdBooking());
            while(resultSet.next())
                totalPrice += resultSet.getInt(1);
            
            statement = connection.prepareStatement(
            "SELECT * FROM PeriodYear WHERE trunc(Sysdate) between"
                    + "StartDay AND EndDay");
            resultSet = statement.executeQuery();
            while(resultSet.next())
                currentPeriod = new PeriodYear(resultSet.getNString(1),
                        resultSet.getDate(1), 
                        resultSet.getDate(3));
            statement = connection.prepareStatement(
            "SELECT COUNT(*) FROM Bill");
            resultSet = statement.executeQuery();
            while(resultSet.next())
                IDBill = Integer.toString(1+resultSet.getInt(1));
            Integer billNumber = IDBill.hashCode();
            
            statement = connection.prepareStatement(
                    "INSERT INTO Bill VALUES(?,?,?,?,?,?,?)");
            statement.setString(1, IDBill);
            statement.setInt(2, billNumber);
            statement.setDate(3, currentPeriod.getEndDay());
            statement.setInt(4, totalPrice);
            statement.setString(5, username);
            statement.setString(6, currentPeriod.getIdPeriod());
            statement.setString(7, reservation.getBooking().getIdBooking());
            resultSet = statement.executeQuery();
        } catch(SQLException se){
                System.out.println(se.getMessage());
        } finally {
                try { resultSet.close(); } catch(Exception e){ /* ignored */}
                try { statement.close(); } catch(Exception e){ /* ignored */}
                try { connection.close(); } catch(Exception e){ /* ignored */}
        }
    }
    
    public void absenceActivity(String IdBooking, Activity activity, 
            Nursery nursery, Integer cafeteria) {
        
    }

    public ArrayList<Bill> retrieveBills(ArrayList<Child> children) {
        ArrayList<Bill> bills = new ArrayList<Bill>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = dataSource.getConnection();
            for(Child child : children) {
                if(child.getReservation() != null) {
                    statement = connection.prepareStatement(
                            "SELECT * FROM Bill WHERE ID_Booking=?");
                    statement.setString(1, child.getReservation().getBooking().getIdBooking());
                    resultSet = statement.executeQuery();
                    while(resultSet.next()) {
                        Bill newBill = new Bill(
                        resultSet.getString(1),
                        resultSet.getInt(2),
                        resultSet.getDate(3),
                        resultSet.getInt(4),
                        resultSet.getString(5),
                        resultSet.getString(6),
                        resultSet.getString(7));
                        bills.add(newBill);
                    }
                }
            }
        } catch(SQLException se){
                System.out.println(se.getMessage());
        } finally {
                try { resultSet.close(); } catch(Exception e){ /* ignored */}
                try { statement.close(); } catch(Exception e){ /* ignored */}
                try { connection.close(); } catch(Exception e){ /* ignored */}
        }
        return bills;
    }
}
