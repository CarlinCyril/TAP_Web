/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.sql.DataSource;
import model.Activity;

/**
 *
 * @author cyrilcarlin
 */
public class ActivityDAO extends AbstractDataBaseDAO {

    public ActivityDAO(DataSource ds) {
        super(ds);
    }

    public List<Activity> getAllActivities() {
        return null;
    }
    
}
