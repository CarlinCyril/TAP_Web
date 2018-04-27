/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import javax.sql.DataSource;
import model.PeriodYear;

/**
 *
 * @author carlinc
 */
public class PeriodYearDAO extends AbstractDataBaseDAO {

    public PeriodYearDAO(DataSource ds) {
        super(ds);
    }
    
    public PeriodYear getcurrentPeriod() {
        Connection connection = null;
        PreparedStatement statement = null;
        PeriodYear currentPeriod = null;
        ResultSet resultSet = null;
        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement(
                "SELECT * FROM PeriodYear WHERE trunc(Sysdate) between "
                        + "StartDay AND EndDay");
            resultSet = statement.executeQuery();
            while(resultSet.next())
                currentPeriod = new PeriodYear(resultSet.getNString(1),
                        resultSet.getDate(2), 
                        resultSet.getDate(3));
        } catch(SQLException se){
                System.out.println(se.getMessage());
        } finally {
                try { resultSet.close(); } catch(Exception e){ /* ignored */}
                try { statement.close(); } catch(Exception e){ /* ignored */}
                try { connection.close(); } catch(Exception e){ /* ignored */}
        }
        if(currentPeriod != null)
            return currentPeriod;
        else {
            return null;
        }
    }
    
}
