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
import java.util.List;
import javax.sql.DataSource;
import model.ClassLevel;
import model.Group;

/**
 *
 * @author cyrilcarlin
 */
public class GroupDAO extends AbstractDataBaseDAO {

    public GroupDAO(DataSource ds) {
        super(ds);
    }
    
    public ArrayList<Group> getAllGroups() {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean valid = false;
        ArrayList<Group> listGroup = new ArrayList<Group>();
        
        try {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(
                        "SELECT * FROM GroupActivity");
                resultSet = statement.executeQuery();
                while(resultSet.next()) {
                    Statement statementTmp = connection.createStatement();
                    String requestLevels = "SELECT ClassLevel  FROM GroupLevels "
                            + "WHERE ID_Activity =" + resultSet.getNString(2)
                            + "AND ID_Group =" + resultSet.getNString(1);
                    ResultSet resultLevel = statementTmp.executeQuery(requestLevels);
                    ArrayList<ClassLevel> levels = new ArrayList<ClassLevel>();
                    while(resultLevel.next()) {
                        ClassLevel newLevel = new ClassLevel(resultLevel.getNString(1));
                        levels.add(newLevel);
                    }
                    Group newGroup = new Group(resultSet.getNString(1), 
                            resultSet.getNString(2),
                            resultSet.getNString(3),
                            resultSet.getNString(4),
                            resultSet.getNString(5),
                            resultSet.getInt(6),
                            levels);
                    listGroup.add(newGroup);
                }
        } catch(SQLException se){
                System.out.println(se.getMessage());
        } finally {
                try { resultSet.close(); } catch(Exception e){ /* ignored */}
                try { statement.close(); } catch(Exception e){ /* ignored */}
                try { connection.close(); } catch(Exception e){ /* ignored */}
                return listGroup;
        }
    }
}
