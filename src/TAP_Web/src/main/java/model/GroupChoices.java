/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author demarquq
 */
public class GroupChoices {
    private String idBooking;
    private String idActivity;
    private String idGroup;

    public GroupChoices(String idBooking, String idActivity, String idGroup) {
        this.idBooking = idBooking;
        this.idActivity = idActivity;
        this.idGroup = idGroup;
    }

    public String getIdBooking() {
        return idBooking;
    }

    public String getIdActivity() {
        return idActivity;
    }

    public String getIdGroup() {
        return idGroup;
    }

    public void setIdBooking(String idBooking) {
        this.idBooking = idBooking;
    }

    public void setIdActivity(String idActivity) {
        this.idActivity = idActivity;
    }

    public void setIdGroup(String idGroup) {
        this.idGroup = idGroup;
    }
    
    

}
