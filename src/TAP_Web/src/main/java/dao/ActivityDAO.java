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
import java.util.List;
import javax.sql.DataSource;
import model.Activity;
import model.User;

/**
 *
 * @author cyrilcarlin
 */
public class ActivityDAO extends AbstractDataBaseDAO {

    public ActivityDAO(DataSource ds) {
        super(ds);
    }

    public ArrayList<Activity> getAllActivities() {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean valid = false;
        ArrayList<Activity> listAct = new ArrayList<Activity>();
        
        try {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(
                        "SELECT * FROM Activity");
                resultSet = statement.executeQuery();
                while(resultSet.next()) {
                    Activity newActivity = new Activity(resultSet.getNString(1),
                            resultSet.getNString(2), 
                            resultSet.getInt(3));
                    listAct.add(newActivity);
                }
        } catch(SQLException se){
                throw new DAOException("Erreur BD " + se.getMessage(), se);
        } finally {
                try { resultSet.close(); } catch(Exception e){ /* ignored */}
                try { statement.close(); } catch(Exception e){ /* ignored */}
                try { connection.close(); } catch(Exception e){ /* ignored */}
        }
        return listAct;
    }
    
    public ArrayList<Activity> getAllActivitiesPeriod() {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean valid = false;
        ArrayList<Activity> listAct = new ArrayList<Activity>();
        
        try {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(
                        "SELECT * FROM Activity" +
"    inner join PeriodActivity on activity.ID_ACTIVITY = PERIODACTIVITY.ID_ACTIVITY" +
"    inner join PERIODYEAR on PERIODACTIVITY.ID_PERIOD = PERIODYEAR.ID_PERIOD" +
"    where trunc(SYSDATE) between PERIODYEAR.STARTDAY AND PERIODYEAR.ENDDAY");
                resultSet = statement.executeQuery();
                while(resultSet.next()) {
                    Activity newActivity = new Activity(resultSet.getNString(1),
                            resultSet.getNString(2), 
                            resultSet.getInt(3));
                    listAct.add(newActivity);
                }
        } catch(SQLException se){
                throw new DAOException("Erreur BD " + se.getMessage(), se);
        } finally {
                try { resultSet.close(); } catch(Exception e){ /* ignored */}
                try { statement.close(); } catch(Exception e){ /* ignored */}
                try { connection.close(); } catch(Exception e){ /* ignored */}
        }
        return listAct;
    }

    public Activity getActivity(String activityName) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean valid = false;
        Activity newActivity = null;
        
        try {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(
                        "SELECT * FROM Activity WHERE Name=?");
                statement.setString(1, activityName);
                resultSet = statement.executeQuery();
                while(resultSet.next()) {
                    newActivity = new Activity(resultSet.getNString(1),
                            resultSet.getNString(2), 
                            resultSet.getInt(3));
                }
        } catch(SQLException se){
                throw new DAOException("Erreur BD " + se.getMessage(), se);
        } finally {
                try { resultSet.close(); } catch(Exception e){ /* ignored */}
                try { statement.close(); } catch(Exception e){ /* ignored */}
                try { connection.close(); } catch(Exception e){ /* ignored */}
        }
        return newActivity;
    }
    
    
    
}
