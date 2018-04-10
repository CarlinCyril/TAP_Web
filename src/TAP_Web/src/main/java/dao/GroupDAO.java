/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.sql.DataSource;
import model.Activity;
import model.Group;

/**
 *
 * @author cyrilcarlin
 */
public class GroupDAO extends AbstractDataBaseDAO {

    public GroupDAO(DataSource ds) {
        super(ds);
    }

    public List<Group> getGroupsDetail(Activity activity) {
        return null;
    }
    
}
